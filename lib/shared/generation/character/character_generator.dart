import 'dart:math';
import '../../models/character.dart';
import 'character_name_pool.dart';

/// Generates a [Character] deterministically from an integer seed.
///
/// The same seed always produces the same character — name, epithet, traits,
/// domains, everything. No two seeds produce the same combination.
///
/// Traits are not random; they are drawn from correlation tables so that
/// the result is always internally coherent (a warrior won't get a warm,
/// philosophical voice; a caretaker won't get blunt + solitary).
///
/// ## Usage
/// ```dart
/// final character = CharacterGenerator.generate(seed: 2048);
/// // Save to Isar:
/// await isar.writeTxn(() => isar.characters.put(character));
/// ```
///
/// ## Extending variety
/// - Add names or epithet fragments to [CharacterNamePool]
/// - Adjust the correlation tables below (no other file changes needed)
class CharacterGenerator {
  CharacterGenerator._();

  // ── Correlation tables ───────────────────────────────────────────────────
  // Each list is ordered by preference — earlier entries are weighted higher.
  // Add or reorder to shift how a given archetype tends to feel.

  static const Map<String, List<String>> _archetypeTones = {
    'mentor':    ['warm',    'solemn',  'poetic' ],
    'trickster': ['playful', 'cryptic', 'blunt'  ],
    'sage':      ['cryptic', 'poetic',  'solemn' ],
    'warrior':   ['blunt',   'stoic'             ],
    'explorer':  ['playful', 'warm',    'poetic' ],
    'scholar':   ['stoic',   'poetic',  'cryptic'],
    'caretaker': ['warm',    'solemn',  'poetic' ],
    'rogue':     ['playful', 'blunt',   'cryptic'],
  };

  static const Map<String, List<String>> _archetypeVoices = {
    'mentor':    ['secondPerson', 'firstPerson'            ],
    'trickster': ['riddle',       'narrator'               ],
    'sage':      ['narrator',     'riddle'                 ],
    'warrior':   ['secondPerson'                           ],
    'explorer':  ['secondPerson', 'firstPerson'            ],
    'scholar':   ['narrator',     'secondPerson'           ],
    'caretaker': ['secondPerson', 'firstPerson'            ],
    'rogue':     ['firstPerson',  'riddle'                 ],
  };

  /// Domain pool per archetype.
  /// The generator picks 1–3 from this list (shuffled, then truncated).
  static const Map<String, List<String>> _archetypeDomains = {
    'mentor':    ['mental',   'learning',  'reflection'],
    'trickster': ['social',   'explore',   'hobby'     ],
    'sage':      ['mental',   'reflection','learning'  ],
    'warrior':   ['physical', 'mental'                 ],
    'explorer':  ['explore',  'cooking',   'hobby'     ],
    'scholar':   ['learning', 'mental',    'reflection'],
    'caretaker': ['social',   'reflection','mental'    ],
    'rogue':     ['explore',  'social',    'hobby'     ],
  };

  /// Trait tag pool per archetype.
  /// The generator picks 2–3 from this list (shuffled, then truncated).
  static const Map<String, List<String>> _archetypeTraits = {
    'mentor':    ['reflective',  'philosophical', 'socialFocus', 'prolific'  ],
    'trickster': ['wanderer',    'competitive',   'socialFocus', 'nightOwl'  ],
    'sage':      ['philosophical','reflective',   'solitary',    'minimal'   ],
    'warrior':   ['competitive', 'physical',      'solitary',    'earlyRiser'],
    'explorer':  ['wanderer',    'culinary',      'earlyRiser',  'prolific'  ],
    'scholar':   ['philosophical','solitary',     'minimal',     'reflective'],
    'caretaker': ['socialFocus', 'reflective',    'prolific',    'philosophical'],
    'rogue':     ['wanderer',    'nightOwl',      'competitive', 'solitary'  ],
  };

  /// Intensity distribution — gentle 30 / moderate 40 / demanding 25 / ruthless 5.
  static const List<(CharacterIntensity, int)> _intensityWeights = [
    (CharacterIntensity.gentle,    30),
    (CharacterIntensity.moderate,  40),
    (CharacterIntensity.demanding, 25),
    (CharacterIntensity.ruthless,   5),
  ];

  /// Rarity distribution — must sum to 100.
  static const List<(CharacterRarity, int)> _rarityWeights = [
    (CharacterRarity.common,    40),
    (CharacterRarity.uncommon,  35),
    (CharacterRarity.rare,      20),
    (CharacterRarity.legendary,  5),
  ];

  // ── Public API ────────────────────────────────────────────────────────────

  /// Generates a [Character] from [seed].
  ///
  /// Returns an unsaved object — persist to Isar after calling.
  static Character generate({required int seed}) {
    final rng = Random(seed);

    final archetype = _pickAny(CharacterArchetype.values, rng);
    final tone      = _pickCorrelated(_archetypeTones[archetype.name]!,    rng, CharacterTone.values);
    final voice     = _pickCorrelated(_archetypeVoices[archetype.name]!,   rng, CharacterVoice.values);
    final intensity = _pickByWeight(_intensityWeights, rng);
    final verbosity = _pickAny(CharacterVerbosity.values, rng);
    final rarity    = _pickByWeight(_rarityWeights, rng);

    final domains   = _pickDomains(archetype, rng);
    final traits    = _pickTraits(archetype, rng);

    final name      = CharacterNamePool.names[rng.nextInt(CharacterNamePool.names.length)];
    final epithet   = _buildEpithet(archetype, tone, rng);

    return Character()
      ..name           = name
      ..epithet        = epithet
      ..archetype      = archetype
      ..tone           = tone
      ..intensity      = intensity
      ..verbosity      = verbosity
      ..voice          = voice
      ..rarity         = rarity
      ..domains        = domains
      ..domainWeights  = _buildDomainWeights(domains, rarity, rng)
      ..traitTags      = traits
      ..generationSeed = seed
      ..isActive       = true
      ..unlockedAt     = DateTime.now();
  }

  /// Generates a batch of [count] unique characters using seeds derived from [baseSeed].
  ///
  /// Useful for populating an initial roster or unlocking a wave of characters.
  /// Seeds used: baseSeed, baseSeed+1, baseSeed+2, ...
  static List<Character> generateBatch({
    required int baseSeed,
    required int count,
  }) {
    return List.generate(
      count,
      (i) => generate(seed: baseSeed + i),
    );
  }

  /// Generates a character guaranteed to cover [requiredDomain].
  ///
  /// Tries up to [maxAttempts] seeds starting from [seed] until it finds one
  /// whose archetype's domain pool includes [requiredDomain].
  /// Falls back to [generate(seed: seed)] if none found.
  static Character generateForDomain({
    required int seed,
    required String requiredDomain,
    int maxAttempts = 20,
  }) {
    for (int i = 0; i < maxAttempts; i++) {
      final candidate = generate(seed: seed + i);
      if (candidate.domains.contains(requiredDomain)) return candidate;
    }
    // Fallback: force-assign domain to whatever came out of the base seed.
    final fallback = generate(seed: seed);
    if (!fallback.domains.contains(requiredDomain)) {
      fallback.domains = [requiredDomain, ...fallback.domains];
      fallback.domainWeights = [1.0, ...fallback.domainWeights];
    }
    return fallback;
  }

  // ── Private helpers ───────────────────────────────────────────────────────

  /// Picks uniformly from [values].
  static T _pickAny<T>(List<T> values, Random rng) =>
      values[rng.nextInt(values.length)];

  /// Picks from [correlated] enum names with a preference gradient —
  /// earlier entries score higher. [allValues] is the full enum value list.
  ///
  /// Weights: for N entries → weights [N, N-1, ..., 1].
  static T _pickCorrelated<T extends Enum>(
    List<String> correlated,
    Random rng,
    List<T> allValues,
  ) {
    final weights = List.generate(correlated.length, (i) => correlated.length - i);
    final total   = weights.fold(0, (a, b) => a + b);
    var   roll    = rng.nextInt(total);

    for (int i = 0; i < correlated.length; i++) {
      roll -= weights[i];
      if (roll < 0) {
        final match = allValues.where((v) => v.name == correlated[i]).firstOrNull;
        if (match != null) return match;
      }
    }
    return allValues.first;
  }

  /// Picks from a weighted list of (value, weight) pairs.
  static T _pickByWeight<T>(List<(T, int)> weighted, Random rng) {
    final total = weighted.fold(0, (a, b) => a + b.$2);
    var   roll  = rng.nextInt(total);

    for (final (value, weight) in weighted) {
      roll -= weight;
      if (roll < 0) return value;
    }
    return weighted.last.$1;
  }

  /// Picks 1–3 domains from the archetype's domain pool.
  /// Warriors always get exactly 1 (their focus is narrow by design).
  static List<String> _pickDomains(CharacterArchetype archetype, Random rng) {
    final pool  = List<String>.from(_archetypeDomains[archetype.name]!);
    pool.shuffle(rng);
    final count = archetype == CharacterArchetype.warrior ? 1 : 2 + rng.nextInt(2);
    return pool.take(count).toList();
  }

  /// Builds domain weights.
  /// Rarer characters are more specialised — primary domain weight is higher
  /// relative to secondary domains.
  static List<double> _buildDomainWeights(
    List<String> domains,
    CharacterRarity rarity,
    Random rng,
  ) {
    final spread = switch (rarity) {
      CharacterRarity.legendary => 0.55,
      CharacterRarity.rare      => 0.35,
      CharacterRarity.uncommon  => 0.20,
      CharacterRarity.common    => 0.10,
    };

    return List.generate(domains.length, (i) {
      final base  = i == 0 ? 1.0 : 1.0 - spread;
      final jitter = (rng.nextDouble() * 0.10) - 0.05; // ±0.05 noise
      return (base + jitter).clamp(0.10, 1.0);
    });
  }

  /// Picks 2–3 trait tags from the archetype's trait pool.
  static List<String> _pickTraits(CharacterArchetype archetype, Random rng) {
    final pool  = List<String>.from(_archetypeTraits[archetype.name]!);
    pool.shuffle(rng);
    final count = 2 + rng.nextInt(2);
    return pool.take(count).toList();
  }

  /// Builds "The [Adjective] [Noun]" from tone + archetype.
  static String _buildEpithet(
    CharacterArchetype archetype,
    CharacterTone tone,
    Random rng,
  ) {
    final adjs  = CharacterNamePool.adjectivesByTone[tone.name]!;
    final nouns = CharacterNamePool.nounsByArchetype[archetype.name]!;
    final adj   = adjs[rng.nextInt(adjs.length)];
    final noun  = nouns[rng.nextInt(nouns.length)];
    return 'The $adj $noun';
  }
}
