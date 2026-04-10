import 'dart:math';
import '../../models/character.dart';
import 'phrase_pool.dart';
import 'quest_template.dart';
import '../core/trait_scorer.dart';

/// The plain output of [QuestGenerator.generate].
///
/// Does not contain Isar-specific fields — the caller is responsible for
/// writing these values into a [Quest] object and saving to the database.
class GeneratedQuest {
  /// Short display title shown on quest cards. e.g. "Take a Walk".
  final String title;

  /// The full quest directive. Maps to Quest.description.
  final String questText;

  /// Optional character-voiced note about the balance gap.
  /// Maps to Quest.hint. May be null if the character stays quiet.
  final String? characterNote;

  const GeneratedQuest({
    required this.title,
    required this.questText,
    this.characterNote,
  });
}

/// Generates quest text from a [Character], category, and date.
///
/// Same character + same category + same date always produces the same
/// output — reproducible via seeded RNG without storing intermediate state.
///
/// ## Usage
/// ```dart
/// final generated = QuestGenerator.generate(
///   character: character,
///   category: 'mental',
///   date: DateTime.now(),
/// );
///
/// final quest = Quest()
///   ..title       = generated.title
///   ..description = generated.questText
///   ..hint        = generated.characterNote
///   ..category    = 'mental'
///   ..characterId = character.id
///   ..status      = QuestStatus.active
///   ..assignedByAltrr = true
///   ..assignedAt  = DateTime.now()
///   ..expiresAt   = DateTime.now().add(const Duration(hours: 24));
/// ```
class QuestGenerator {
  QuestGenerator._();

  static GeneratedQuest generate({
    required Character character,
    required String category,
    required DateTime date,
  }) {
    // Same character + same calendar day = same quest (reproducible).
    final dayOfYear = date.difference(DateTime(date.year, 1, 1)).inDays;
    final rng = Random(character.generationSeed ^ dayOfYear);

    final characterTags = _tagsOf(character);
    final template = QuestTemplate.pickFor(character, rng);

    // ── Fill slots ───────────────────────────────────────────────────────────

    final picked = <(PhraseSlot, String, String?)>[];

    for (final slot in template.slots) {
      // Skip optional slots ~40% of the time for length variety.
      if (slot.optional && rng.nextDouble() < 0.40) continue;

      final candidates = PhrasePool.forSlot(slot.slot, category: category);
      if (candidates.isEmpty) continue;

      final phrase = TraitScorer.pickWeighted(candidates, characterTags, rng);
      picked.add((slot.slot, phrase.text, phrase.shortTitle));
    }

    // ── Derive title from the action slot ────────────────────────────────────

    final title = picked
            .where((p) => p.$1 == PhraseSlot.action)
            .map((p) => p.$3 ?? p.$2) // prefer shortTitle, fall back to text
            .firstOrNull ??
        category;

    // ── Assemble questText ───────────────────────────────────────────────────

    final questText = _assemble(picked);

    // ── Generate character note ──────────────────────────────────────────────

    final note = _pickNote(category, characterTags, rng);

    return GeneratedQuest(
      title: _capitalize(title),
      questText: questText,
      characterNote: note,
    );
  }

  // ── Assembly ──────────────────────────────────────────────────────────────

  /// Joins phrase parts into a grammatically coherent sentence.
  ///
  /// Rules:
  /// - [PhraseSlot.opener] starts the first sentence; next word is lowercased.
  /// - [PhraseSlot.action], [PhraseSlot.duration], [PhraseSlot.setting]
  ///   are inline — they extend the current sentence.
  /// - [PhraseSlot.characterLine] and [PhraseSlot.closing] always start
  ///   a new sentence.
  static String _assemble(List<(PhraseSlot, String, String?)> parts) {
    final sentences = <String>[];
    var current = '';
    var afterOpener = false;

    for (final (slot, text, _) in parts) {
      switch (slot) {
        case PhraseSlot.opener:
          current = text;
          afterOpener = true;

        case PhraseSlot.action:
          if (current.isEmpty) {
            current = _capitalize(text);
            afterOpener = false;
          } else if (afterOpener) {
            current += ' ${_lowercase(text)}';
            afterOpener = false;
          } else {
            current += ' $text';
          }

        case PhraseSlot.duration:
        case PhraseSlot.setting:
          current += ' $text';

        case PhraseSlot.characterLine:
        case PhraseSlot.closing:
          if (current.isNotEmpty) {
            sentences.add(_ensurePeriod(current));
            current = '';
            afterOpener = false;
          }
          sentences.add(_ensurePeriod(text));

        case PhraseSlot.note:
          break;
      }
    }

    if (current.isNotEmpty) sentences.add(_ensurePeriod(current));
    return sentences.join(' ');
  }

  // ── Character note ────────────────────────────────────────────────────────

  static String? _pickNote(
    String category,
    List<String> characterTags,
    Random rng,
  ) {
    // 25% chance the character says nothing — silence is also a mood.
    if (rng.nextDouble() < 0.25) return null;

    final candidates = CharacterNotePool.forCategory(category);
    if (candidates.isEmpty) return null;

    return TraitScorer.pickWeighted(candidates, characterTags, rng).text;
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  static List<String> _tagsOf(Character character) => [
        character.archetype.name,
        character.tone.name,
        character.intensity.name,
        character.verbosity.name,
        character.voice.name,
        ...character.traitTags,
      ];

  static String _capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);

  static String _lowercase(String s) =>
      s.isEmpty ? s : s[0].toLowerCase() + s.substring(1);

  static String _ensurePeriod(String s) {
    if (s.isEmpty) return s;
    return '.!?,—-'.contains(s[s.length - 1]) ? s : '$s.';
  }
}
