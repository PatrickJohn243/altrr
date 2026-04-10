import '../models/character.dart';

/// A character definition used to seed the Isar database on first launch.
///
/// To add a character: append a new [CharacterDefinition] to
/// [CharacterRoster.characters]. Every field is human-readable —
/// no code changes elsewhere needed.
class CharacterDefinition {
  final String name;
  final String epithet;
  final CharacterArchetype archetype;
  final CharacterTone tone;
  final CharacterIntensity intensity;
  final CharacterVerbosity verbosity;
  final CharacterVoice voice;
  final CharacterRarity rarity;

  /// Quest categories this character can assign.
  /// Must match keys used in [PhrasePool] and [CharacterNotePool].
  /// e.g. 'physical', 'mental', 'social', 'cooking', 'learning',
  ///      'explore', 'hobby', 'reflection'
  final List<String> domains;

  /// Fine-grained personality modifiers — use [CharacterTrait] enum names.
  final List<String> traitTags;

  /// Stable seed for reproducible quest generation.
  /// Pick any unique int per character.
  final int generationSeed;

  const CharacterDefinition({
    required this.name,
    required this.epithet,
    required this.archetype,
    required this.tone,
    required this.intensity,
    required this.verbosity,
    required this.voice,
    required this.rarity,
    required this.domains,
    required this.traitTags,
    required this.generationSeed,
  });

  /// Creates an unsaved [Character] from this definition.
  /// Persist with Isar after calling.
  Character toCharacter() => Character()
    ..name = name
    ..epithet = epithet
    ..archetype = archetype
    ..tone = tone
    ..intensity = intensity
    ..verbosity = verbosity
    ..voice = voice
    ..rarity = rarity
    ..domains = domains
    ..domainWeights = List.filled(domains.length, 1.0)
    ..traitTags = traitTags
    ..generationSeed = generationSeed
    ..isActive = true
    ..unlockedAt = DateTime.now();
}

/// The predefined character roster.
///
/// Edit this file to create, adjust, or remove characters.
/// Each character owns specific [domains] — the system picks the character
/// whose domains match the category chosen by the balance tracker.
class CharacterRoster {
  CharacterRoster._();

  static const List<CharacterDefinition> characters = [

    // ── Senna — gentle guide, mental + social + reflection ──────────────────
    CharacterDefinition(
      name: 'Senna',
      epithet: 'The Gentle Guide',
      archetype: CharacterArchetype.caretaker,
      tone: CharacterTone.warm,
      intensity: CharacterIntensity.gentle,
      verbosity: CharacterVerbosity.moderate,
      voice: CharacterVoice.secondPerson,
      rarity: CharacterRarity.common,
      domains: ['mental', 'social', 'reflection'],
      traitTags: ['reflective', 'philosophical', 'socialFocus'],
      generationSeed: 1001,
    ),

    // ── Kael — iron warrior, physical only ──────────────────────────────────
    CharacterDefinition(
      name: 'Kael',
      epithet: 'The Iron Voice',
      archetype: CharacterArchetype.warrior,
      tone: CharacterTone.blunt,
      intensity: CharacterIntensity.demanding,
      verbosity: CharacterVerbosity.brief,
      voice: CharacterVoice.secondPerson,
      rarity: CharacterRarity.common,
      domains: ['physical'],
      traitTags: ['competitive', 'physical', 'solitary'],
      generationSeed: 1002,
    ),

    // ── Oryn — hollow sage, mental + learning + reflection ───────────────────
    CharacterDefinition(
      name: 'Oryn',
      epithet: 'The Hollow Sage',
      archetype: CharacterArchetype.sage,
      tone: CharacterTone.cryptic,
      intensity: CharacterIntensity.moderate,
      verbosity: CharacterVerbosity.moderate,
      voice: CharacterVoice.narrator,
      rarity: CharacterRarity.uncommon,
      domains: ['mental', 'learning', 'reflection'],
      traitTags: ['philosophical', 'reflective', 'solitary'],
      generationSeed: 1003,
    ),

    // ── Mira — wandering one, explore + cooking + hobby ─────────────────────
    CharacterDefinition(
      name: 'Mira',
      epithet: 'The Wandering One',
      archetype: CharacterArchetype.explorer,
      tone: CharacterTone.playful,
      intensity: CharacterIntensity.moderate,
      verbosity: CharacterVerbosity.moderate,
      voice: CharacterVoice.secondPerson,
      rarity: CharacterRarity.uncommon,
      domains: ['explore', 'cooking', 'hobby'],
      traitTags: ['wanderer', 'culinary', 'earlyRiser'],
      generationSeed: 1004,
    ),
  ];

  /// Returns all characters whose [domains] include [category].
  static List<CharacterDefinition> forCategory(String category) {
    return characters
        .where((c) => c.domains.contains(category))
        .toList();
  }

  /// Returns a character by name, or null if not found.
  static CharacterDefinition? byName(String name) {
    try {
      return characters.firstWhere((c) => c.name == name);
    } catch (_) {
      return null;
    }
  }
}
