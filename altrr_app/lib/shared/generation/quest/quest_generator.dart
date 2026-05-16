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

  /// The nature of this quest — action, social, creative, or explore.
  final QuestNature nature;

  /// The requires key for this quest's action phrase, if any.
  /// Maps to a [QuestPrompt] in prompts.dart.
  final String? requires;

  const GeneratedQuest({
    required this.title,
    required this.questText,
    required this.nature,
    this.characterNote,
    this.requires,
  });
}

/// Generates quest text from a [Character], category, and date.
///
/// Pass [DateTime.now()] as [date] to get a unique quest each call.
class QuestGenerator {
  QuestGenerator._();

  static GeneratedQuest generate({
    required Character character,
    required String category,
    required DateTime date,
    QuestNature? nature,
    List<String> excludeRequires = const [],
  }) {
    final rng = Random(character.generationSeed ^ date.millisecondsSinceEpoch);

    final characterTags = _tagsOf(character);
    final template = QuestTemplate.pickFor(character, rng);

    // ── Fill slots ───────────────────────────────────────────────────────────

    final picked = <(PhraseSlot, String, String?, QuestNature?)>[];
    String? actionRequires;

    for (final slot in template.slots) {
      // Skip optional slots ~40% of the time for length variety.
      if (slot.optional && rng.nextDouble() < 0.40) continue;

      // For action slot: filter by nature, fall back to unfiltered if empty.
      var candidates = PhrasePool.forSlot(
        slot.slot,
        category: category,
        nature: slot.slot == PhraseSlot.action ? nature : null,
        excludeRequires: excludeRequires,
      );
      if (candidates.isEmpty && slot.slot == PhraseSlot.action && nature != null) {
        candidates = PhrasePool.forSlot(
          slot.slot,
          category: category,
          excludeRequires: excludeRequires,
        );
      }
      if (candidates.isEmpty) continue;

      final phrase = TraitScorer.pickWeighted(candidates, characterTags, rng);
      if (slot.slot == PhraseSlot.action) actionRequires = phrase.requires;
      picked.add((slot.slot, phrase.text, phrase.shortTitle, phrase.nature));
    }

    // ── Derive title from the action slot ────────────────────────────────────

    final title = picked
            .where((p) => p.$1 == PhraseSlot.action)
            .map((p) => p.$3 ?? p.$2)
            .firstOrNull ??
        category;

    // ── Assemble questText ───────────────────────────────────────────────────

    final questText = _assemble(picked);

    // ── Derive nature from the picked action phrase ──────────────────────────

    final derivedNature = picked
            .where((p) => p.$1 == PhraseSlot.action)
            .map((p) => p.$4)
            .firstOrNull ??
        QuestNature.action;

    // ── Generate character note ──────────────────────────────────────────────

    final note = _pickNote(category, characterTags, rng);

    return GeneratedQuest(
      title: _capitalize(title),
      questText: questText,
      nature: derivedNature,
      characterNote: note,
      requires: actionRequires,
    );
  }

  // ── Assembly ──────────────────────────────────────────────────────────────

  static String _assemble(List<(PhraseSlot, String, String?, QuestNature?)> parts) {
    final sentences = <String>[];
    var current = '';
    var afterOpener = false;

    for (final (slot, text, _, _) in parts) {
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
    // 25% chance the character says nothing.
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
