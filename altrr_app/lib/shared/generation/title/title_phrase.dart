/// Slot types and the TitlePhrase model used across all title phrase pools.
///
/// This is the only file that title phrase pool files need to import.

// ── Slot types ────────────────────────────────────────────────────────────────

enum TitleSlot {
  /// The atomic headline title text.
  /// e.g. "A Cook's First Attempt"
  titleText,

  /// First subtext fragment — the observation or setup.
  /// e.g. "Not perfect —"
  subtextA,

  /// Second subtext fragment — the payoff or sentiment.
  /// e.g. "but that's what matters most"
  subtextB,
}

// ── TitlePhrase model ─────────────────────────────────────────────────────────

class TitlePhrase {
  /// The text fragment.
  final String text;

  /// Which slot this phrase fills.
  final TitleSlot slot;

  /// Category this phrase applies to.
  /// Null means it works for any category.
  final String? category;

  /// Tier this phrase applies to (1, 2, or 3).
  /// Null means it works for any tier.
  final int? tier;

  /// Time-based condition this phrase applies to.
  /// e.g. 'quickDraw', 'weekStreak', 'dailyBurst'.
  /// Null for quest-count factored phrases.
  final String? condition;

  const TitlePhrase({
    required this.text,
    required this.slot,
    this.category,
    this.tier,
    this.condition,
  });
}
