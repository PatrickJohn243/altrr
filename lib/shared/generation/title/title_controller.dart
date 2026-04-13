import 'dart:math';
import 'package:isar/isar.dart';
import '../../models/earned_title.dart';
import '../../models/quest.dart';
import 'title_generator.dart';

/// Evaluates all title conditions after a quest is completed and saves any
/// newly earned [EarnedTitle] records to Isar.
///
/// ## Award order
/// 1. **Gacha roll** (1 % chance) — if it hits AND an unclaimed gacha title
///    exists, one gacha title is saved and factored checks are skipped.
/// 2. **Quest-count factored** — checks T1/T2/T3 thresholds for the quest's
///    category. Awards every newly crossed tier (at most one per run in
///    normal play).
/// 3. **Time-based factored** — evaluates every time condition against the
///    quest history. Awards all conditions triggered in this run.
///
/// Returns the list of [EarnedTitle] objects saved in this call (may be empty).
class TitleController {
  TitleController._();

  // Tier thresholds: (tier, minCompletions)
  static const List<(int, int)> _tierThresholds = [
    (3, 20),
    (2, 10),
    (1, 3),
  ];

  // ── Public entry point ────────────────────────────────────────────────────

  static Future<List<EarnedTitle>> checkAndAward({
    required Quest completedQuest,
    required Isar isar,
  }) async {
    final rng = Random();

    // Load state from Isar.
    final allQuests = await isar.quests.where().findAll();
    final allEarned = await isar.earnedTitles.where().findAll();

    final earned = <EarnedTitle>[];

    // ── 1. Gacha roll ─────────────────────────────────────────────────────
    if (rng.nextDouble() < 0.01) {
      final claimedGacha = allEarned
          .where((t) => t.titleType == TitleType.gacha)
          .map((t) => t.titleText)
          .toSet();

      final gacha = TitleGenerator.pickGacha(
        claimedTitles: claimedGacha,
        rng: rng,
      );

      if (gacha != null) {
        earned.add(_toIsar(gacha));
        await _saveAll(earned, isar);
        return earned; // gacha hit — skip factored checks
      }
    }

    // ── 2. Quest-count factored ───────────────────────────────────────────
    final categoryCompletions = allQuests
        .where((q) =>
            q.category == completedQuest.category &&
            q.status == QuestStatus.completed)
        .length;

    for (final (tier, threshold) in _tierThresholds) {
      if (categoryCompletions != threshold) continue;

      // Check this (category, tier) hasn't been awarded before.
      final alreadyEarned = allEarned.any((t) =>
          t.condition == TitleCondition.questCount &&
          t.category == completedQuest.category &&
          t.tier == tier);
      if (alreadyEarned) continue;

      final generated = TitleGenerator.generateQuestCount(
        category: completedQuest.category,
        tier: tier,
        rng: rng,
      );
      if (generated != null) earned.add(_toIsar(generated));
    }

    // ── 3. Time-based factored ────────────────────────────────────────────
    final timeEarned = await _checkTimeBased(
      completedQuest: completedQuest,
      allQuests: allQuests,
      allEarned: allEarned,
      rng: rng,
    );
    earned.addAll(timeEarned);

    if (earned.isNotEmpty) await _saveAll(earned, isar);
    return earned;
  }

  // ── Time-based condition checks ───────────────────────────────────────────

  static Future<List<EarnedTitle>> _checkTimeBased({
    required Quest completedQuest,
    required List<Quest> allQuests,
    required List<EarnedTitle> allEarned,
    required Random rng,
  }) async {
    final now = completedQuest.completedAt ?? DateTime.now();
    final earned = <EarnedTitle>[];

    // De-dup: check conditionTag directly — no reverse-mapping needed.
    bool alreadyEarned(String conditionKey) => allEarned.any(
          (t) => t.conditionTag == conditionKey,
        );

    void tryAward(String conditionKey, bool triggered) {
      if (!triggered) return;
      if (alreadyEarned(conditionKey)) return;

      final gen = TitleGenerator.generateTimeBased(
        condition: conditionKey,
        rng: rng,
      );
      if (gen != null) earned.add(_toIsar(gen, conditionTag: conditionKey));
    }

    final completedOnly = allQuests
        .where((q) => q.status == QuestStatus.completed && q.completedAt != null)
        .toList()
      ..sort((a, b) => a.completedAt!.compareTo(b.completedAt!));

    // quickDraw — completed within 4 hours of assignment.
    tryAward(
      'quickDraw',
      now.difference(completedQuest.assignedAt).inHours < 4,
    );

    // earlyBird — completed before 6:00 AM.
    tryAward('earlyBird', now.hour < 6);

    // nightOwl — completed between midnight and 4:00 AM.
    tryAward('nightOwl', now.hour < 4);

    // comeback — first completion after a 7+ day gap.
    if (completedOnly.length >= 2) {
      final prev = completedOnly[completedOnly.length - 2];
      final gap = now.difference(prev.completedAt!).inDays;
      tryAward('comeback', gap >= 7);
    } else if (completedOnly.length == 1) {
      // Very first completion ever — no comeback possible yet.
    }

    // dailyBurst — 3+ completions on the same calendar day.
    final today = DateTime(now.year, now.month, now.day);
    final todayCount = completedOnly
        .where((q) {
          final d = q.completedAt!;
          return DateTime(d.year, d.month, d.day) == today;
        })
        .length;
    tryAward('dailyBurst', todayCount >= 3);

    // weekStreak — 7 consecutive days with at least one completion.
    final streak = _computeStreak(completedOnly, now);
    tryAward('weekStreak', streak >= 7);

    // monthStreak — 30 consecutive days.
    tryAward('monthStreak', streak >= 30);

    // cleanRun — 10+ completions total (skips are never recorded).
    tryAward('cleanRun', completedOnly.length >= 10);

    // speedMilestone — 2 titles earned within any 10-day window.
    // Uses allEarned (titles before this run) only — avoids self-reference.
    final tenDaysAgo = now.subtract(const Duration(days: 10));
    final recentTitles = allEarned
        .where((t) => t.earnedAt.isAfter(tenDaysAgo))
        .length;

    if (recentTitles >= 1) {
      final alreadyHasSpeedMilestone = allEarned.any((t) =>
          t.conditionTag == 'speedMilestone' &&
          t.earnedAt.isAfter(tenDaysAgo));

      if (!alreadyHasSpeedMilestone) {
        final gen = TitleGenerator.generateTimeBased(
          condition: 'speedMilestone',
          rng: rng,
        );
        if (gen != null) {
          earned.add(_toIsar(gen, conditionTag: 'speedMilestone'));
        }
      }
    }

    return earned;
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  /// Computes the current consecutive-day streak ending at [now].
  static int _computeStreak(List<Quest> sortedCompleted, DateTime now) {
    if (sortedCompleted.isEmpty) return 0;

    // Unique calendar days, descending.
    final days = sortedCompleted
        .map((q) {
          final d = q.completedAt!;
          return DateTime(d.year, d.month, d.day);
        })
        .toSet()
        .toList()
      ..sort((a, b) => b.compareTo(a));

    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    // Streak must touch today or yesterday to still be active.
    if (days.first != today && days.first != yesterday) return 0;

    int streak = 1;
    for (int i = 0; i < days.length - 1; i++) {
      if (days[i].difference(days[i + 1]).inDays == 1) {
        streak++;
      } else {
        break;
      }
    }
    return streak;
  }

  static EarnedTitle _toIsar(GeneratedTitle g, {String? conditionTag}) =>
      EarnedTitle()
        ..titleText = g.titleText
        ..subtextA = g.subtextA
        ..subtextB = g.subtextB
        ..gachaSubtext = g.gachaSubtext
        ..category = g.category
        ..tier = g.tier
        ..titleType = g.titleType
        ..condition = g.condition
        ..conditionTag = conditionTag
        ..earnedAt = DateTime.now()
        ..isSeen = false;

  static Future<void> _saveAll(List<EarnedTitle> titles, Isar isar) async {
    await isar.writeTxn(() async {
      await isar.earnedTitles.putAll(titles);
    });
  }
}
