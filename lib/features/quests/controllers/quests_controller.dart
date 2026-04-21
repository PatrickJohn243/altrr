import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import '../../../core/config/app_features.dart';
import '../../../core/database/isar_service.dart';
import '../../../shared/generation/quest/balance_tracker.dart';
import '../../../shared/generation/character/character_roster.dart';
import '../../../shared/generation/quest/quest_generator.dart';
import '../../../shared/generation/quest/prompts.dart';
import '../../../shared/generation/title/title_controller.dart';
import '../../../shared/generation/title/title_generator.dart';
import '../../../shared/models/earned_title.dart';
import '../../../shared/models/quest.dart';
import '../../../core/services/daily_stats_service.dart';
import '../../../core/config/app_preferences.dart';

class QuestsController extends ChangeNotifier {
  // ── Active quests ──────────────────────────────────────────────────────────

  /// The currently active daily quest.
  Quest? activeQuest;

  /// The currently active challenge quest.
  Quest? activeChallengeQuest;

  /// The currently active chain quest step.
  Quest? activeChainQuest;

  // ── Pending offers ─────────────────────────────────────────────────────────

  /// A generated challenge quest pending user acceptance.
  Quest? pendingChallengeOffer;

  /// A generated chain quest step-1 pending user acceptance.
  Quest? pendingChainOffer;

  // ── Prompt ─────────────────────────────────────────────────────────────────

  /// True when the active quest needs a yes/no or options prompt from the user.
  bool needsPrompt = false;
  String? _pendingRequiresKey;

  /// The requires key currently pending a user prompt response. Null otherwise.
  String? get pendingRequiresKey => _pendingRequiresKey;

  // ── Stats ──────────────────────────────────────────────────────────────────

  List<Quest> recentCompleted = [];
  BalanceResult? currentBalance;
  List<EarnedTitle> lastEarnedTitles = const [];
  int completedCount = 0;
  int titlesEarnedCount = 0;

  // ── Break mode ─────────────────────────────────────────────────────────────

  bool isBreakActive = false;
  bool pendingBreakOffer = false;

  // ── Daily limit ────────────────────────────────────────────────────────────

  bool isDailyDoneToday = false;

  // ── Internal ───────────────────────────────────────────────────────────────

  bool isLoading = false;
  bool _disposed = false;

  Timer? _expiryTimer;
  Timer? _challengeExpiryTimer;
  Timer? _chainExpiryTimer;
  Timer? _midnightTimer;

  final Isar _isar = IsarService.instance;

  QuestsController() {
    _init();
  }

  // ── Init ───────────────────────────────────────────────────────────────────

  Future<void> _init() async {
    isLoading = true;
    if (!_disposed) notifyListeners();

    await _loadStats();

    // Daily quest
    if (AppFeatures.breakMode.enabled && AppPreferences.isBreakModeActive) {
      isBreakActive = true;
    } else {
      // Check if daily quest already completed today.
      final now = DateTime.now();
      final todayStart = DateTime(now.year, now.month, now.day);
      final allDailyCompleted = await _isar.quests
          .filter()
          .statusEqualTo(QuestStatus.completed)
          .questTypeEqualTo(QuestType.daily)
          .findAll();
      final doneToday = allDailyCompleted.any(
        (q) => q.completedAt != null && q.completedAt!.isAfter(todayStart),
      );

      if (doneToday) {
        isDailyDoneToday = true;
        _startMidnightTimer();
      } else {
        final existing = await _isar.quests
            .filter()
            .statusEqualTo(QuestStatus.active)
            .questTypeEqualTo(QuestType.daily)
            .findFirst();

        if (existing != null && existing.expiresAt.isAfter(DateTime.now())) {
          activeQuest = existing;
          _startExpiryTimer();
        } else {
          if (existing != null) {
            await _isar.writeTxn(() async {
              await _isar.quests.delete(existing.id);
            });
          }
          await _assignNewQuest();
        }
      }
    }

    // Challenge quest (independent of daily)
    if (AppFeatures.challengeQuests.enabled) {
      final existingChallenge = await _isar.quests
          .filter()
          .statusEqualTo(QuestStatus.active)
          .questTypeEqualTo(QuestType.challenge)
          .findFirst();

      if (existingChallenge != null) {
        if (existingChallenge.expiresAt.isAfter(DateTime.now())) {
          activeChallengeQuest = existingChallenge;
          _startChallengeExpiryTimer();
        } else {
          await _isar.writeTxn(() async {
            await _isar.quests.delete(existingChallenge.id);
          });
        }
      }
    }

    // Chain quest (independent of daily and challenge)
    if (AppFeatures.chainQuests.enabled) {
      final existingChain = await _isar.quests
          .filter()
          .statusEqualTo(QuestStatus.active)
          .questTypeEqualTo(QuestType.chain)
          .findFirst();

      if (existingChain != null) {
        if (existingChain.expiresAt.isAfter(DateTime.now())) {
          activeChainQuest = existingChain;
          _startChainExpiryTimer();
        } else {
          await _isar.writeTxn(() async {
            await _isar.quests.delete(existingChain.id);
          });
        }
      }
    }

    isLoading = false;
    if (!_disposed) notifyListeners();
  }

  // ── Timers ─────────────────────────────────────────────────────────────────

  void _startExpiryTimer() {
    _expiryTimer?.cancel();
    final quest = activeQuest;
    if (quest == null) return;
    final remaining = quest.expiresAt.difference(DateTime.now());
    if (remaining.isNegative) {
      _discardAndAssign();
      return;
    }
    _expiryTimer = Timer(remaining, () {
      if (!_disposed) _discardAndAssign();
    });
  }

  void _startChallengeExpiryTimer() {
    _challengeExpiryTimer?.cancel();
    final quest = activeChallengeQuest;
    if (quest == null) return;
    final remaining = quest.expiresAt.difference(DateTime.now());
    if (remaining.isNegative) {
      _discardChallenge();
      return;
    }
    _challengeExpiryTimer = Timer(remaining, () {
      if (!_disposed) _discardChallenge();
    });
  }

  void _startChainExpiryTimer() {
    _chainExpiryTimer?.cancel();
    final quest = activeChainQuest;
    if (quest == null) return;
    final remaining = quest.expiresAt.difference(DateTime.now());
    if (remaining.isNegative) {
      _discardChain();
      return;
    }
    _chainExpiryTimer = Timer(remaining, () {
      if (!_disposed) _discardChain();
    });
  }

  void _startMidnightTimer() {
    _midnightTimer?.cancel();
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day + 1);
    _midnightTimer = Timer(midnight.difference(now), () {
      if (_disposed) return;
      isDailyDoneToday = false;
      _assignNewQuest();
    });
  }

  // ── Public: challenge ──────────────────────────────────────────────────────

  Future<void> acceptChallenge({required int days}) async {
    final offer = pendingChallengeOffer;
    if (offer == null) return;
    final hours = days * 24;
    offer.expiryDuration = hours;
    offer.expiresAt = DateTime.now().add(Duration(hours: hours));
    await _isar.writeTxn(() async {
      await _isar.quests.put(offer);
    });
    activeChallengeQuest = offer;
    pendingChallengeOffer = null;
    _startChallengeExpiryTimer();
    if (!_disposed) notifyListeners();
  }

  void declineChallenge() {
    pendingChallengeOffer = null;
    if (!_disposed) notifyListeners();
  }

  void completeChallenge() {
    if (activeChallengeQuest == null) return;
    _resolveChallengeQuest(QuestStatus.completed);
  }

  void abandonChallenge() {
    if (activeChallengeQuest == null) return;
    _discardChallenge();
  }

  // ── Public: chain ──────────────────────────────────────────────────────────

  Future<void> acceptChain() async {
    final offer = pendingChainOffer;
    if (offer == null) return;
    await _isar.writeTxn(() async {
      await _isar.quests.put(offer);
    });
    activeChainQuest = offer;
    pendingChainOffer = null;
    _startChainExpiryTimer();
    if (!_disposed) notifyListeners();
  }

  void declineChain() {
    pendingChainOffer = null;
    if (!_disposed) notifyListeners();
  }

  /// Marks the active chain step as completed and unlocks the next step,
  /// or ends the chain if this was the final step.
  Future<void> completeChainStep() async {
    final quest = activeChainQuest;
    if (quest == null) return;

    await _isar.writeTxn(() async {
      quest.status = QuestStatus.completed;
      quest.completedAt = DateTime.now();
      await _isar.quests.put(quest);
    });
    _chainExpiryTimer?.cancel();

    final step = quest.chainStep ?? 1;
    final total = quest.chainTotal ?? 1;

    if (step < total) {
      await _generateNextChainStep(quest);
    } else {
      activeChainQuest = null;
    }

    await _loadStats();
    if (!_disposed) notifyListeners();
  }

  void abandonChain() {
    if (activeChainQuest == null) return;
    _discardChain();
  }

  // ── Public: prompt ─────────────────────────────────────────────────────────

  /// User answered "yes" (or confirmed an option) on the prompt.
  Future<void> confirmPrompt() async {
    final key = _pendingRequiresKey;
    if (key == null) return;
    final prompt = promptFor(key);
    if (prompt != null && prompt.cacheAnswer) {
      await AppPreferences.setCachedPromptAnswer(key, 'yes');
    }
    _pendingRequiresKey = null;
    needsPrompt = false;
    if (!_disposed) notifyListeners();
  }

  /// User answered "no" — delete the current quest and regenerate excluding
  /// the requires key that triggered this prompt.
  Future<void> declinePrompt() async {
    final key = _pendingRequiresKey;
    if (key == null) return;
    final prompt = promptFor(key);
    if (prompt != null && prompt.cacheAnswer) {
      await AppPreferences.setCachedPromptAnswer(key, 'no');
    }
    _pendingRequiresKey = null;
    needsPrompt = false;

    final quest = activeQuest;
    if (quest != null) {
      await _isar.writeTxn(() async {
        await _isar.quests.delete(quest.id);
      });
      activeQuest = null;
    }
    await _assignNewQuest(excludeRequires: [key]);
  }

  // ── Public: general ────────────────────────────────────────────────────────

  void generateQuest() {
    isDailyDoneToday = false;
    _midnightTimer?.cancel();
    _assignNewQuest();
  }

  void completeQuest() {
    if (activeQuest == null) return;
    _resolveQuest(QuestStatus.completed);
  }

  void clearLastEarnedTitles() {
    lastEarnedTitles = const [];
    if (!_disposed) notifyListeners();
  }

  void skipQuest() {
    if (activeQuest == null) return;
    _discardAndAssign();
  }

  Future<void> activateBreakMode() async {
    await AppPreferences.activateBreakMode();
    isBreakActive = true;
    pendingBreakOffer = false;
    activeQuest = null;
    if (!_disposed) notifyListeners();
  }

  Future<void> declineBreakOffer() async {
    pendingBreakOffer = false;
    isDailyDoneToday = true;
    _startMidnightTimer();
    if (!_disposed) notifyListeners();
    await _checkChallengeOffer();
    await _checkChainOffer();
  }

  Future<void> endBreakEarly() async {
    await AppPreferences.clearBreakMode();
    isBreakActive = false;
    if (!_disposed) notifyListeners();
    await _assignNewQuest();
  }

  // ── Public: debug ──────────────────────────────────────────────────────────

  Future<void> debugTriggerChallengeOffer() async {
    pendingChallengeOffer = null;

    final completed = await _loadStats();
    final history = completed
        .where((q) => q.completedAt != null)
        .map((q) => CompletedRecord(
              category: q.category,
              nature: q.questNature,
              completedAt: q.completedAt!,
            ))
        .toList();

    final result = BalanceTracker.pick(
      history: history,
      preferredCategories: AppPreferences.preferredCategories,
    );
    if (!result.isValid) return;

    final definition = result.character!;
    final generated = QuestGenerator.generate(
      character: definition.toCharacter(),
      category: result.category,
      nature: result.nature,
      date: DateTime.now(),
    );

    final isarCharacter =
        await IsarService.characterBySeed(definition.generationSeed);

    pendingChallengeOffer = Quest()
      ..title = generated.title
      ..description = generated.questText
      ..hint = generated.characterNote
      ..category = result.category
      ..questType = QuestType.challenge
      ..questNature = generated.nature
      ..expiryDuration = 72
      ..status = QuestStatus.active
      ..assignedByAltrr = true
      ..assignedAt = DateTime.now()
      ..expiresAt = DateTime.now().add(const Duration(hours: 72))
      ..characterId = isarCharacter?.id;

    if (!_disposed) notifyListeners();
  }

  Future<void> debugGenerateTitle() async {
    final quest = activeQuest;
    if (quest == null) return;

    final rng = Random();
    final tier = 1 + rng.nextInt(3);

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
    if (!_disposed) notifyListeners();
  }

  Future<void> debugSetExpiry(int seconds) async {
    final quest = activeQuest;
    if (quest == null) return;
    final newExpiry = DateTime.now().add(Duration(seconds: seconds));
    await _isar.writeTxn(() async {
      quest.expiresAt = newExpiry;
      await _isar.quests.put(quest);
    });
    activeQuest = quest;
    _startExpiryTimer();
    if (!_disposed) notifyListeners();
  }

  // ── Private: resolve / discard ─────────────────────────────────────────────

  Future<void> _resolveQuest(QuestStatus resolution) async {
    final questId = activeQuest!.id;
    isLoading = true;
    if (!_disposed) notifyListeners();

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

    final allCompleted = await _isar.quests
        .filter()
        .statusEqualTo(QuestStatus.completed)
        .findAll();
    await DailyStatsService.recordQuestCompleted(
      category: quest!.category,
      streakCount: _computeCurrentStreak(allCompleted),
      titlesEarned: lastEarnedTitles.length,
    );

    if (AppFeatures.breakMode.enabled) {
      final emotions = quest!.submissionEmotions;
      if (emotions.contains('Tired') || emotions.contains('Stressed')) {
        pendingBreakOffer = true;
        activeQuest = null;
        isLoading = false;
        if (!_disposed) notifyListeners();
        return;
      }
    }

    isDailyDoneToday = true;
    _startMidnightTimer();
    activeQuest = null;
    isLoading = false;
    if (!_disposed) notifyListeners();
    await _checkChallengeOffer();
    await _checkChainOffer();
  }

  Future<void> _discardAndAssign() async {
    final quest = activeQuest!;
    isLoading = true;
    lastEarnedTitles = const [];
    if (!_disposed) notifyListeners();

    await _isar.writeTxn(() async {
      await _isar.quests.delete(quest.id);
    });

    await _assignNewQuest();
  }

  Future<void> _resolveChallengeQuest(QuestStatus resolution) async {
    final questId = activeChallengeQuest!.id;

    await _isar.writeTxn(() async {
      final quest = await _isar.quests.get(questId);
      if (quest == null) return;
      quest.status = resolution;
      quest.completedAt = DateTime.now();
      await _isar.quests.put(quest);
    });

    _challengeExpiryTimer?.cancel();
    activeChallengeQuest = null;
    await _loadStats();
    if (!_disposed) notifyListeners();
  }

  Future<void> _discardChallenge() async {
    final quest = activeChallengeQuest;
    if (quest == null) return;
    await _isar.writeTxn(() async {
      await _isar.quests.delete(quest.id);
    });
    _challengeExpiryTimer?.cancel();
    activeChallengeQuest = null;
    if (!_disposed) notifyListeners();
  }

  Future<void> _discardChain() async {
    final quest = activeChainQuest;
    if (quest == null) return;
    await _isar.writeTxn(() async {
      await _isar.quests.delete(quest.id);
    });
    _chainExpiryTimer?.cancel();
    activeChainQuest = null;
    if (!_disposed) notifyListeners();
  }

  // ── Private: stats ─────────────────────────────────────────────────────────

  Future<List<Quest>> _loadStats() async {
    final completed = await _isar.quests
        .filter()
        .statusEqualTo(QuestStatus.completed)
        .findAll();

    completedCount = completed.length;
    titlesEarnedCount = await _isar.earnedTitles.count();
    recentCompleted = (completed
          ..sort((a, b) => (b.completedAt ?? b.assignedAt)
              .compareTo(a.completedAt ?? a.assignedAt)))
        .take(5)
        .toList();

    return completed;
  }

  // ── Private: quest generation ──────────────────────────────────────────────

  Future<void> _assignNewQuest({List<String> excludeRequires = const []}) async {
    final completed = await _loadStats();

    final history = completed
        .where((q) => q.completedAt != null)
        .map((q) => CompletedRecord(
              category: q.category,
              nature: q.questNature,
              completedAt: q.completedAt!,
            ))
        .toList();

    final result = BalanceTracker.pick(
      history: history,
      preferredCategories: AppPreferences.preferredCategories,
    );
    if (!result.isValid) {
      isLoading = false;
      if (!_disposed) notifyListeners();
      return;
    }

    final definition = result.character!;
    final generated = QuestGenerator.generate(
      character: definition.toCharacter(),
      category: result.category,
      nature: result.nature,
      date: DateTime.now(),
      excludeRequires: excludeRequires,
    );

    final isarCharacter =
        await IsarService.characterBySeed(definition.generationSeed);

    final quest = Quest()
      ..title = generated.title
      ..description = generated.questText
      ..hint = generated.characterNote
      ..category = result.category
      ..questType = QuestType.daily
      ..questNature = generated.nature
      ..expiryDuration = 24
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

    // Handle prompt requirement from the generated action phrase.
    final requires = generated.requires;
    if (requires != null) {
      final prompt = promptFor(requires);
      if (prompt != null) {
        if (prompt.cacheAnswer) {
          final cached = AppPreferences.getCachedPromptAnswer(requires);
          if (cached == null) {
            _pendingRequiresKey = requires;
            needsPrompt = true;
          } else if (cached == 'no') {
            // Cache says user doesn't have this — regenerate without it.
            await _isar.writeTxn(() async {
              await _isar.quests.delete(quest.id);
            });
            activeQuest = null;
            await _assignNewQuest(
                excludeRequires: [...excludeRequires, requires]);
            return;
          }
          // cached == 'yes' → proceed normally
        } else {
          // Non-cached prompt (e.g. ingredients) — always ask.
          _pendingRequiresKey = requires;
          needsPrompt = true;
        }
      }
    }

    isLoading = false;
    _startExpiryTimer();
    if (!_disposed) notifyListeners();
  }

  Future<void> _checkChallengeOffer() async {
    if (!AppFeatures.challengeQuests.enabled) return;
    if (activeChallengeQuest != null) return;
    if (pendingChallengeOffer != null) return;

    final balance = currentBalance;
    if (balance == null) return;

    final maxEntry =
        balance.weights.entries.reduce((a, b) => a.value > b.value ? a : b);
    if (maxEntry.value < 5.0) return;

    final candidates = CharacterRoster.forCategory(maxEntry.key);
    if (candidates.isEmpty) return;
    final definition = candidates.first;

    final generated = QuestGenerator.generate(
      character: definition.toCharacter(),
      category: maxEntry.key,
      nature: balance.nature,
      date: DateTime.now(),
    );

    final isarCharacter =
        await IsarService.characterBySeed(definition.generationSeed);

    pendingChallengeOffer = Quest()
      ..title = generated.title
      ..description = generated.questText
      ..hint = generated.characterNote
      ..category = maxEntry.key
      ..questType = QuestType.challenge
      ..questNature = generated.nature
      ..expiryDuration = 72
      ..status = QuestStatus.active
      ..assignedByAltrr = true
      ..assignedAt = DateTime.now()
      ..expiresAt = DateTime.now().add(const Duration(hours: 72))
      ..characterId = isarCharacter?.id;

    if (!_disposed) notifyListeners();
  }

  Future<void> _checkChainOffer() async {
    if (!AppFeatures.chainQuests.enabled) return;
    if (activeChainQuest != null) return;
    if (pendingChainOffer != null) return;

    // 20% chance to offer a chain quest after a daily quest completion.
    if (Random().nextDouble() > 0.20) return;

    final balance = currentBalance;
    if (balance == null) return;

    final candidates = CharacterRoster.forCategory(balance.category);
    if (candidates.isEmpty) return;
    final rng = Random();
    final definition = candidates[rng.nextInt(candidates.length)];
    final chainId = '${DateTime.now().millisecondsSinceEpoch}';
    final chainTotal = rng.nextBool() ? 2 : 3;

    final generated = QuestGenerator.generate(
      character: definition.toCharacter(),
      category: balance.category,
      nature: balance.nature,
      date: DateTime.now().add(const Duration(milliseconds: 1)),
    );

    final isarCharacter =
        await IsarService.characterBySeed(definition.generationSeed);

    pendingChainOffer = Quest()
      ..title = generated.title
      ..description = generated.questText
      ..hint = generated.characterNote
      ..category = balance.category
      ..questType = QuestType.chain
      ..questNature = generated.nature
      ..expiryDuration = 48
      ..chainId = chainId
      ..chainStep = 1
      ..chainTotal = chainTotal
      ..status = QuestStatus.active
      ..assignedByAltrr = true
      ..assignedAt = DateTime.now()
      ..expiresAt = DateTime.now().add(const Duration(hours: 48))
      ..characterId = isarCharacter?.id;

    if (!_disposed) notifyListeners();
  }

  Future<void> _generateNextChainStep(Quest completed) async {
    final candidates = CharacterRoster.forCategory(completed.category);
    if (candidates.isEmpty) {
      activeChainQuest = null;
      return;
    }
    final rng = Random();
    final definition = candidates[rng.nextInt(candidates.length)];

    final generated = QuestGenerator.generate(
      character: definition.toCharacter(),
      category: completed.category,
      nature: completed.questNature,
      date: DateTime.now().add(const Duration(milliseconds: 2)),
    );

    final isarCharacter =
        await IsarService.characterBySeed(definition.generationSeed);
    final nextStep = (completed.chainStep ?? 1) + 1;

    final next = Quest()
      ..title = generated.title
      ..description = generated.questText
      ..hint = generated.characterNote
      ..category = completed.category
      ..questType = QuestType.chain
      ..questNature = generated.nature
      ..expiryDuration = 48
      ..chainId = completed.chainId
      ..chainStep = nextStep
      ..chainTotal = completed.chainTotal
      ..status = QuestStatus.active
      ..assignedByAltrr = true
      ..assignedAt = DateTime.now()
      ..expiresAt = DateTime.now().add(const Duration(hours: 48))
      ..characterId = isarCharacter?.id;

    await _isar.writeTxn(() async {
      await _isar.quests.put(next);
    });

    activeChainQuest = next;
    _startChainExpiryTimer();
  }

  // ── Private: streak ────────────────────────────────────────────────────────

  static int _computeCurrentStreak(List<Quest> history) {
    final breaks = AppPreferences.breakDays;
    final days = history
        .where((q) => q.completedAt != null)
        .map((q) {
          final d = q.completedAt!;
          return DateTime(d.year, d.month, d.day);
        })
        .toSet()
        .toList()
      ..sort((a, b) => b.compareTo(a));

    if (days.isEmpty) return 0;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final isBreakToday = breaks.contains(_dateStr(today));

    if (days.first != today && days.first != yesterday && !isBreakToday) {
      return 0;
    }

    int streak = 1;
    for (int i = 1; i < days.length; i++) {
      final gap = days[i - 1].difference(days[i]).inDays;
      if (gap == 1) {
        streak++;
      } else if (gap > 1) {
        bool allBreak = true;
        for (int d = 1; d < gap; d++) {
          final gapDay = days[i - 1].subtract(Duration(days: d));
          if (!breaks.contains(_dateStr(gapDay))) {
            allBreak = false;
            break;
          }
        }
        if (allBreak) {
          streak++;
        } else {
          break;
        }
      } else {
        break;
      }
    }
    return streak;
  }

  static String _dateStr(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  @override
  void dispose() {
    _disposed = true;
    _expiryTimer?.cancel();
    _challengeExpiryTimer?.cancel();
    _chainExpiryTimer?.cancel();
    _midnightTimer?.cancel();
    super.dispose();
  }
}
