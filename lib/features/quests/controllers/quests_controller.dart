import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import '../../../core/database/isar_service.dart';
import '../../../shared/generation/balance/balance_tracker.dart';
import '../../../shared/generation/quest/quest_generator.dart';
import '../../../shared/models/quest.dart';

class QuestsController extends ChangeNotifier {
  /// The currently active quest loaded from Isar.
  Quest? activeQuest;

  /// Balance result for the active quest (character + category + weights).
  BalanceResult? currentBalance;

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

    // Expired quest — mark skipped before assigning a fresh one.
    if (existing != null) {
      await _isar.writeTxn(() async {
        existing
          ..status = QuestStatus.skipped
          ..skippedAt = DateTime.now();
        await _isar.quests.put(existing);
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

  void skipQuest() {
    if (activeQuest == null) return;
    _resolveQuest(QuestStatus.skipped);
  }

  // ── Private ────────────────────────────────────────────────────────────────

  Future<void> _resolveQuest(QuestStatus resolution) async {
    final quest = activeQuest!;
    isLoading = true;
    notifyListeners();

    await _isar.writeTxn(() async {
      quest.status = resolution;
      if (resolution == QuestStatus.completed) {
        quest.completedAt = DateTime.now();
      } else {
        quest.skippedAt = DateTime.now();
      }
      await _isar.quests.put(quest);
    });

    await _assignNewQuest();
  }

  Future<void> _assignNewQuest() async {
    // Build history from all completed quests for the balance tracker.
    final completed = await _isar.quests
        .filter()
        .statusEqualTo(QuestStatus.completed)
        .findAll();

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
