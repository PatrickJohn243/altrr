import 'dart:math';
import '../character/character_roster.dart';

// ── Input record ──────────────────────────────────────────────────────────────

/// Lightweight projection of a completed quest.
/// No Isar dependency — the caller maps Quest objects to these before passing.
class CompletedRecord {
  final String category;
  final DateTime completedAt;

  const CompletedRecord({
    required this.category,
    required this.completedAt,
  });
}

// ── Result ────────────────────────────────────────────────────────────────────

/// Everything needed to generate the next quest.
class BalanceResult {
  /// Category chosen by the balance algorithm.
  final String category;

  /// Character whose domains include [category]. Null if roster has no match.
  final CharacterDefinition? character;

  /// Weight per category at the moment of picking.
  /// Higher = more overdue. Exposed for note generation and debugging.
  final Map<String, double> weights;

  const BalanceResult({
    required this.category,
    required this.character,
    required this.weights,
  });

  bool get isValid => character != null;
}

// ── Tracker ───────────────────────────────────────────────────────────────────

/// Picks the next quest (category + character) based on neglect.
///
/// ## Algorithm
/// Each category accumulates weight = days since last completion,
/// clamped to [1, [maxDays]]. Categories never done start at [maxDays].
/// Selection is weighted random — neglected categories win more often,
/// but not always, so the result still feels like a whim rather than a schedule.
///
/// ## Usage
/// ```dart
/// final result = BalanceTracker.pick(
///   history: completedQuests
///       .map((q) => CompletedRecord(
///             category: q.category,
///             completedAt: q.completedAt!,
///           ))
///       .toList(),
/// );
///
/// if (result.isValid) {
///   final generated = QuestGenerator.generate(
///     character: result.character!.toCharacter(),
///     category: result.category,
///     date: DateTime.now(),
///   );
/// }
/// ```
///
/// Pass an empty list on first launch — all categories receive [maxDays],
/// making the first pick uniformly random across all domains.
class BalanceTracker {
  BalanceTracker._();

  static const List<String> allCategories = [
    'physical',
    'mental',
    'social',
    'cooking',
    'learning',
    'explore',
    'hobby',
    'reflection',
  ];

  /// Categories neglected beyond this many days are treated as equally overdue.
  /// Prevents one ignored category from permanently dominating picks.
  static const double maxDays = 14.0;

  // ── Public API ─────────────────────────────────────────────────────────────

  /// Picks the next (category, character) pair given completed quest [history].
  static BalanceResult pick({
    required List<CompletedRecord> history,
    Random? rng,
  }) {
    final r = rng ?? Random();
    final weights = computeWeights(history);
    final category = _pickCategory(weights, r);
    final character = _pickCharacter(category, r);
    return BalanceResult(
      category: category,
      character: character,
      weights: weights,
    );
  }

  /// Returns weight per category. Useful for testing or surfacing hints.
  ///
  /// Weight = fractional days since last completion, clamped to [1.0, maxDays].
  /// A category with no history receives [maxDays].
  static Map<String, double> computeWeights(List<CompletedRecord> history) {
    final now = DateTime.now();

    // Most recent completion per category.
    final lastCompleted = <String, DateTime>{};
    for (final record in history) {
      final prev = lastCompleted[record.category];
      if (prev == null || record.completedAt.isAfter(prev)) {
        lastCompleted[record.category] = record.completedAt;
      }
    }

    return {
      for (final cat in allCategories) cat: _weight(lastCompleted[cat], now),
    };
  }

  // ── Private helpers ────────────────────────────────────────────────────────

  static double _weight(DateTime? lastDone, DateTime now) {
    if (lastDone == null) return maxDays;
    final days = now.difference(lastDone).inHours / 24.0;
    return days.clamp(1.0, maxDays);
  }

  /// Weighted random selection from the computed weights map.
  static String _pickCategory(Map<String, double> weights, Random rng) {
    final total = weights.values.fold(0.0, (sum, w) => sum + w);
    var roll = rng.nextDouble() * total;
    for (final entry in weights.entries) {
      roll -= entry.value;
      if (roll <= 0) return entry.key;
    }
    // Floating point safety — return last key if roll never hits zero.
    return weights.keys.last;
  }

  /// Picks a character from the roster whose domains include [category].
  static CharacterDefinition? _pickCharacter(String category, Random rng) {
    final candidates = CharacterRoster.forCategory(category);
    if (candidates.isEmpty) return null;
    return candidates[rng.nextInt(candidates.length)];
  }
}
