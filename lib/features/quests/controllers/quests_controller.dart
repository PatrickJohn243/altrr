import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import '../../../core/database/isar_service.dart';
import '../../../shared/generation/quest/balance_tracker.dart';
import '../../../shared/generation/quest/quest_generator.dart';
import '../../../shared/generation/title/title_controller.dart';
import '../../../shared/generation/title/title_generator.dart';
import '../../../shared/models/earned_title.dart';
import '../../../shared/models/quest.dart';

class QuestsController extends ChangeNotifier {
  /// The currently active quest loaded from Isar.
  Quest? activeQuest;

  /// The 5 most recently completed quests — shown on the quests screen.
  List<Quest> recentCompleted = [];

  /// Balance result for the active quest (character + category + weights).
  BalanceResult? currentBalance;

  /// Titles earned during the most recent quest completion.
  /// Cleared when [clearLastEarnedTitles] is called (e.g. after UI shows them).
  List<EarnedTitle> lastEarnedTitles = const [];

  int completedCount = 0;
  int titlesEarnedCount = 0;

  /// True while an async operation is in progress.
  bool isLoading = false;

  final Isar _isar = IsarService.instance;

  QuestsController() {
    _init();
  }

  // ── Init ───────────────────────────────────────────────────────────────────

  Future<void> _init() async {
    isLoading = true;
    notifyListeners();

    // Restore an existing active quest if it hasn't expired.
    final existing = await _isar.quests
        .filter()
        .statusEqualTo(QuestStatus.active)
        .sortByAssignedAtDesc()
        .findFirst();

    if (existing != null && existing.expiresAt.isAfter(DateTime.now())) {
      activeQuest = existing;
      isLoading = false;
      notifyListeners();
      return;
    }

    // Expired quest — discard it (not recorded) and assign a fresh one.
    if (existing != null) {
      await _isar.writeTxn(() async {
        await _isar.quests.delete(existing.id);
      });
    }

    await _assignNewQuest();
  }

  // ── Public actions ─────────────────────────────────────────────────────────

  /// Re-runs the balance tracker and assigns a new quest.
  /// Called by the generate button and after complete/skip.
  void generateQuest() => _assignNewQuest();

  void completeQuest() {
    if (activeQuest == null) return;
    _resolveQuest(QuestStatus.completed);
  }

  /// Clears [lastEarnedTitles] after the UI has displayed them.
  void clearLastEarnedTitles() {
    lastEarnedTitles = const [];
    notifyListeners();
  }

  /// [DEBUG] Generates a title for the active quest's category and a random
  /// tier — bypassing all condition checks. Used for UI testing only.
  Future<void> debugGenerateTitle() async {
    final quest = activeQuest;
    if (quest == null) return;

    final rng = Random();
    final tier = 1 + rng.nextInt(3); // 1, 2, or 3

    final generated = TitleGenerator.generateQuestCount(
      category: quest.category,
      tier: tier,
      rng: rng,
    );
    if (generated == null) return;

    final title = EarnedTitle()
      ..titleText = generated.titleText
      ..subtextA = generated.subtextA
      ..subtextB = generated.subtextB
      ..gachaSubtext = generated.gachaSubtext
      ..category = generated.category
      ..tier = generated.tier
      ..titleType = generated.titleType
      ..condition = generated.condition
      ..earnedAt = DateTime.now()
      ..isSeen = false;

    await _isar.writeTxn(() async {
      await _isar.earnedTitles.put(title);
    });

    lastEarnedTitles = [title];
    notifyListeners();
  }

  void skipQuest() {
    if (activeQuest == null) return;
    _discardAndAssign();
  }

  // ── Private ────────────────────────────────────────────────────────────────

  Future<void> _resolveQuest(QuestStatus resolution) async {
    final questId = activeQuest!.id;
    isLoading = true;
    notifyListeners();

    // Re-read from Isar so submission fields saved by QuestSubmissionScreen
    // are not overwritten by the stale in-memory activeQuest object.
    Quest? quest;
    await _isar.writeTxn(() async {
      quest = await _isar.quests.get(questId);
      if (quest == null) return;
      quest!.status = resolution;
      quest!.completedAt = DateTime.now();
      await _isar.quests.put(quest!);
    });

    if (quest == null) return;

    lastEarnedTitles = await TitleController.checkAndAward(
      completedQuest: quest!,
      isar: _isar,
    );

    await _assignNewQuest();
  }

  /// Discards the active quest without recording it, then assigns a new one.
  Future<void> _discardAndAssign() async {
    final quest = activeQuest!;
    isLoading = true;
    lastEarnedTitles = const [];
    notifyListeners();

    await _isar.writeTxn(() async {
      await _isar.quests.delete(quest.id);
    });

    await _assignNewQuest();
  }

  Future<void> _assignNewQuest() async {
    // Build history from all completed quests for the balance tracker.
    final completed = await _isar.quests
        .filter()
        .statusEqualTo(QuestStatus.completed)
        .findAll();

    completedCount = completed.length;
    titlesEarnedCount = await _isar.earnedTitles.count();

    // Keep the 5 most recent for the quests screen preview.
    recentCompleted = (completed..sort((a, b) =>
        (b.completedAt ?? b.assignedAt).compareTo(a.completedAt ?? a.assignedAt)))
        .take(5)
        .toList();

    final history = completed
        .where((q) => q.completedAt != null)
        .map((q) => CompletedRecord(
              category: q.category,
              completedAt: q.completedAt!,
            ))
        .toList();

    final result = BalanceTracker.pick(history: history);
    if (!result.isValid) {
      isLoading = false;
      notifyListeners();
      return;
    }

    final definition = result.character!;

    final generated = QuestGenerator.generate(
      character: definition.toCharacter(),
      category: result.category,
      date: DateTime.now(),
    );

    // Resolve the Isar character ID so the quest records who assigned it.
    final isarCharacter = await IsarService.characterBySeed(
      definition.generationSeed,
    );

    final quest = Quest()
      ..title = generated.title
      ..description = generated.questText
      ..hint = generated.characterNote
      ..category = result.category
      ..status = QuestStatus.active
      ..assignedByAltrr = true
      ..assignedAt = DateTime.now()
      ..expiresAt = DateTime.now().add(const Duration(hours: 24))
      ..characterId = isarCharacter?.id;

    await _isar.writeTxn(() async {
      await _isar.quests.put(quest);
    });

    activeQuest = quest;
    currentBalance = result;
    isLoading = false;
    notifyListeners();
  }
}
