library;

/// Slot types and the Phrase model used across all phrase pools.
///
/// This is the only file that other phrase files need to import.

// ── Slot types ────────────────────────────────────────────────────────────────

enum PhraseSlot {
  /// The core directive: what the user will do.
  action,

  /// Inline time suggestion, optional. e.g. "for 10 minutes".
  duration,

  /// Where to do it, appended to action. e.g. "somewhere quiet".
  setting,

  /// Character-voiced line about how to experience the quest.
  characterLine,

  /// Sentence starter that sets mood. e.g. "Tonight,".
  opener,

  /// Final sentence, reinforces character personality.
  closing,

  /// Character-voiced observation about the balance gap.
  /// Only used in note pools — not part of any template.
  note,
}

// ── Phrase model ──────────────────────────────────────────────────────────────

class Phrase {
  /// The text fragment. May be a partial sentence or a full sentence.
  final String text;

  /// Which slot this phrase fills.
  final PhraseSlot slot;

  /// Trait/tone/archetype names that boost this phrase's score.
  /// Use enum `.name` values from [CharacterArchetype], [CharacterTone],
  /// [CharacterIntensity], [CharacterVerbosity], and [CharacterTrait].
  final List<String> affinityTags;

  /// Categories this phrase applies to. Empty list means any category.
  final List<String> categories;

  /// Starting score before trait matching.
  final double baseWeight;

  /// Short display title — only meaningful for [PhraseSlot.action] phrases.
  /// Used as the Quest.title in the app.
  final String? shortTitle;

  const Phrase({
    required this.text,
    required this.slot,
    this.affinityTags = const [],
    this.categories = const [],
    this.baseWeight = 1.0,
    this.shortTitle,
  });
}
