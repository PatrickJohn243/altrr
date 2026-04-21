import 'dart:math';
import '../character/character_roster.dart';
import '../core/phrase.dart';

// ── Input record ──────────────────────────────────────────────────────────────

class CompletedRecord {
  final String category;
  final QuestNature nature;
  final DateTime completedAt;

  const CompletedRecord({
    required this.category,
    required this.nature,
    required this.completedAt,
  });
}

// ── Result ────────────────────────────────────────────────────────────────────

class BalanceResult {
  final String category;
  final QuestNature nature;
  final CharacterDefinition? character;
  final Map<String, double> weights;
  final Map<QuestNature, double> natureWeights;

  const BalanceResult({
    required this.category,
    required this.nature,
    required this.character,
    required this.weights,
    required this.natureWeights,
  });

  bool get isValid => character != null;
}

// ── Tracker ───────────────────────────────────────────────────────────────────

class BalanceTracker {
  BalanceTracker._();

  static const List<String> allCategories = [
    'physical', 'mental', 'social', 'cooking',
    'learning', 'explore', 'hobby', 'reflection',
  ];

  static const List<QuestNature> allNatures = [
    QuestNature.action,
    QuestNature.social,
    QuestNature.creative,
    QuestNature.explore,
  ];

  /// Category neglect cap — 14 days max weight.
  static const double maxCategoryDays = 14.0;

  /// Nature neglect cap — 7 days max weight (4 natures, want faster rotation).
  static const double maxNatureDays = 7.0;

  // ── Public API ─────────────────────────────────────────────────────────────

  static BalanceResult pick({
    required List<CompletedRecord> history,
    List<String>? preferredCategories,
    Random? rng,
  }) {
    final r = rng ?? Random();
    final weights = computeWeights(history, preferredCategories: preferredCategories);
    final natureWeights = computeNatureWeights(history);

    final category = _pickWeighted(weights.map((k, v) => MapEntry(k, v)), r);
    final nature = _pickNature(natureWeights, r);
    final character = _pickCharacter(category, r);

    return BalanceResult(
      category: category,
      nature: nature,
      character: character,
      weights: weights,
      natureWeights: natureWeights,
    );
  }

  static Map<String, double> computeWeights(
    List<CompletedRecord> history, {
    List<String>? preferredCategories,
  }) {
    final now = DateTime.now();
    final lastCompleted = <String, DateTime>{};

    for (final record in history) {
      final prev = lastCompleted[record.category];
      if (prev == null || record.completedAt.isAfter(prev)) {
        lastCompleted[record.category] = record.completedAt;
      }
    }

    return {
      for (final cat in allCategories)
        cat: _categoryWeight(lastCompleted[cat], now, preferredCategories, cat),
    };
  }

  static Map<QuestNature, double> computeNatureWeights(
    List<CompletedRecord> history,
  ) {
    final now = DateTime.now();
    final lastByNature = <QuestNature, DateTime>{};

    for (final record in history) {
      final prev = lastByNature[record.nature];
      if (prev == null || record.completedAt.isAfter(prev)) {
        lastByNature[record.nature] = record.completedAt;
      }
    }

    return {
      for (final nature in allNatures)
        nature: _natureWeight(lastByNature[nature], now),
    };
  }

  // ── Private helpers ────────────────────────────────────────────────────────

  static double _categoryWeight(
    DateTime? lastDone,
    DateTime now,
    List<String>? preferred,
    String category,
  ) {
    if (lastDone == null) return maxCategoryDays;
    final days = now.difference(lastDone).inHours / 24.0;
    double w = days.clamp(1.0, maxCategoryDays);
    // Boost preferred categories from onboarding by 20%.
    if (preferred != null && preferred.contains(category)) w *= 1.2;
    return w;
  }

  static double _natureWeight(DateTime? lastDone, DateTime now) {
    if (lastDone == null) return maxNatureDays;
    final days = now.difference(lastDone).inHours / 24.0;
    return days.clamp(1.0, maxNatureDays);
  }

  static String _pickWeighted(Map<String, double> weights, Random rng) {
    final total = weights.values.fold(0.0, (s, w) => s + w);
    var roll = rng.nextDouble() * total;
    for (final entry in weights.entries) {
      roll -= entry.value;
      if (roll <= 0) return entry.key;
    }
    return weights.keys.last;
  }

  static QuestNature _pickNature(
    Map<QuestNature, double> weights,
    Random rng,
  ) {
    final total = weights.values.fold(0.0, (s, w) => s + w);
    var roll = rng.nextDouble() * total;
    for (final entry in weights.entries) {
      roll -= entry.value;
      if (roll <= 0) return entry.key;
    }
    return weights.keys.last;
  }

  static CharacterDefinition? _pickCharacter(String category, Random rng) {
    final candidates = CharacterRoster.forCategory(category);
    if (candidates.isEmpty) return null;
    return candidates[rng.nextInt(candidates.length)];
  }
}
