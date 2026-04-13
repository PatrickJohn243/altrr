import 'dart:math';
import '../../models/earned_title.dart';
import 'title_pool.dart';
import 'title_phrase.dart';
import 'phrases/gacha_pool.dart';

/// Plain output of a title generation pass.
///
/// Does not contain Isar-specific fields — the caller writes these into an
/// [EarnedTitle] and saves to the database.
class GeneratedTitle {
  final String titleText;

  /// First subtext fragment (observation). Null for gacha titles.
  final String? subtextA;

  /// Second subtext fragment (payoff). Null for gacha titles.
  final String? subtextB;

  /// Full subtext for gacha titles. Null for factored titles.
  final String? gachaSubtext;

  final String? category;
  final int? tier;
  final TitleType titleType;
  final TitleCondition condition;

  const GeneratedTitle({
    required this.titleText,
    required this.titleType,
    required this.condition,
    this.subtextA,
    this.subtextB,
    this.gachaSubtext,
    this.category,
    this.tier,
  });
}

/// Assembles [GeneratedTitle] objects from phrase pools.
///
/// Stateless — all randomness is seeded by the caller's [Random].
///
/// ## Quest-count factored
/// ```dart
/// TitleGenerator.generateQuestCount(
///   category: 'cooking', tier: 1, rng: rng);
/// ```
///
/// ## Time-based factored
/// ```dart
/// TitleGenerator.generateTimeBased(condition: 'quickDraw', rng: rng);
/// ```
///
/// ## Gacha
/// ```dart
/// TitleGenerator.pickGacha(claimedTitles: {'Error 404'}, rng: rng);
/// ```
class TitleGenerator {
  TitleGenerator._();

  // ── Quest-count factored ──────────────────────────────────────────────────

  /// Picks a title for a [category] + [tier] milestone.
  ///
  /// Returns null if no matching phrases exist.
  static GeneratedTitle? generateQuestCount({
    required String category,
    required int tier,
    required Random rng,
  }) {
    final titles = TitlePool.all
        .where((p) =>
            p.slot == TitleSlot.titleText &&
            p.category == category &&
            p.tier == tier &&
            p.condition == null)
        .toList();

    if (titles.isEmpty) return null;

    // Universal subtext: no category tag, no condition tag, matching tier.
    final sAPool = TitlePool.all
        .where((p) =>
            p.slot == TitleSlot.subtextA &&
            p.category == null &&
            p.condition == null &&
            (p.tier == null || p.tier == tier))
        .toList();

    final sBPool = TitlePool.all
        .where((p) =>
            p.slot == TitleSlot.subtextB &&
            p.category == null &&
            p.condition == null &&
            (p.tier == null || p.tier == tier))
        .toList();

    final titlePhrase = titles[rng.nextInt(titles.length)];
    final sA = sAPool.isEmpty ? null : sAPool[rng.nextInt(sAPool.length)];
    final sB = sBPool.isEmpty ? null : sBPool[rng.nextInt(sBPool.length)];

    return GeneratedTitle(
      titleText: titlePhrase.text,
      subtextA: sA?.text,
      subtextB: sB?.text,
      category: category,
      tier: tier,
      titleType: TitleType.factored,
      condition: TitleCondition.questCount,
    );
  }

  // ── Time-based factored ───────────────────────────────────────────────────

  /// Picks a title for a time-based [condition] string.
  ///
  /// Returns null if no matching phrases exist for the condition.
  static GeneratedTitle? generateTimeBased({
    required String condition,
    required Random rng,
  }) {
    final pool = TitlePool.forCondition(condition);
    if (pool.isEmpty) return null;

    final titles = pool.where((p) => p.slot == TitleSlot.titleText).toList();
    final sAPool = pool.where((p) => p.slot == TitleSlot.subtextA).toList();
    final sBPool = pool.where((p) => p.slot == TitleSlot.subtextB).toList();

    if (titles.isEmpty) return null;

    final titlePhrase = titles[rng.nextInt(titles.length)];
    final sA = sAPool.isEmpty ? null : sAPool[rng.nextInt(sAPool.length)];
    final sB = sBPool.isEmpty ? null : sBPool[rng.nextInt(sBPool.length)];

    return GeneratedTitle(
      titleText: titlePhrase.text,
      subtextA: sA?.text,
      subtextB: sB?.text,
      titleType: TitleType.factored,
      condition: TitleCondition.timeBased,
    );
  }

  // ── Gacha ─────────────────────────────────────────────────────────────────

  /// Picks a random unclaimed gacha title.
  ///
  /// [claimedTitles] is a set of titleText strings already earned by the user.
  /// Returns null if every gacha title has already been claimed.
  static GeneratedTitle? pickGacha({
    required Set<String> claimedTitles,
    required Random rng,
  }) {
    final available = GachaTitlePool.titles
        .where((g) => !claimedTitles.contains(g.titleText))
        .toList();

    if (available.isEmpty) return null;

    final pick = available[rng.nextInt(available.length)];
    return GeneratedTitle(
      titleText: pick.titleText,
      gachaSubtext: pick.subtext,
      titleType: TitleType.gacha,
      condition: TitleCondition.gacha,
    );
  }
}
