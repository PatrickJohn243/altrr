import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import '../../../core/database/isar_service.dart';
import '../../../core/widgets/streak_card.dart';
import '../../../features/quests/controllers/quests_controller.dart';
import '../../../shared/models/quest.dart';
import '../../../shared/models/earned_title.dart';

class HomeController extends ChangeNotifier {
  final QuestsController _questsController;
  final Isar _isar = IsarService.instance;
  bool _disposed = false;

  List<Quest> recentQuests = [];
  int streakCount = 0;
  List<StreakDay> streakDays = _emptyWeek();
  Map<String, int> categoryTitleCounts = {};
  Map<String, int> categoryQuestCounts = {};

  HomeController(this._questsController) {
    _load();
    // Reload whenever a quest is completed.
    _questsController.addListener(_load);
  }

  Future<void> _load() async {
    final now = DateTime.now();

    // All completed quests, sorted newest first.
    final history = await _isar.quests
        .filter()
        .statusEqualTo(QuestStatus.completed)
        .sortByAssignedAtDesc()
        .findAll();

    recentQuests = history.take(5).toList();
    streakCount = _computeStreak(history, now);
    streakDays = _buildWeekDays(history, now);

    final allTitles = await _isar.earnedTitles.where().findAll();
    final counts = <String, int>{};
    for (final t in allTitles) {
      if (t.category != null) {
        counts[t.category!] = (counts[t.category!] ?? 0) + 1;
      }
    }
    categoryTitleCounts = counts;

    final questCounts = <String, int>{};
    for (final q in history) {
      questCounts[q.category] = (questCounts[q.category] ?? 0) + 1;
    }
    categoryQuestCounts = questCounts;

    if (!_disposed) notifyListeners();
  }

  // ── Streak helpers ─────────────────────────────────────────────────────────

  static int _computeStreak(List<Quest> history, DateTime now) {
    final completedOnly =
        history.where((q) => q.status == QuestStatus.completed && q.completedAt != null);

    // Unique calendar days that had at least one completion, newest first.
    final days = completedOnly
        .map((q) => _day(q.completedAt!))
        .toSet()
        .toList()
      ..sort((a, b) => b.compareTo(a));

    if (days.isEmpty) return 0;

    final today = _day(now);
    final yesterday = today.subtract(const Duration(days: 1));

    // Streak must touch today or yesterday to still be alive.
    if (days.first != today && days.first != yesterday) return 0;

    int streak = 1;
    for (int i = 1; i < days.length; i++) {
      if (days[i - 1].difference(days[i]).inDays == 1) {
        streak++;
      } else {
        break;
      }
    }
    return streak;
  }

  static List<StreakDay> _buildWeekDays(List<Quest> history, DateTime now) {
    final completedDays = history
        .where((q) => q.status == QuestStatus.completed && q.completedAt != null)
        .map((q) => _day(q.completedAt!))
        .toSet();

    final today = _day(now);
    // Monday of the current week.
    final monday = today.subtract(Duration(days: today.weekday - 1));

    const labels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    return List.generate(7, (i) {
      final d = monday.add(Duration(days: i));
      final DayStatus status;

      if (d.isAfter(today)) {
        status = DayStatus.empty;
      } else if (d == today) {
        status = completedDays.contains(d) ? DayStatus.completed : DayStatus.current;
      } else {
        status = completedDays.contains(d) ? DayStatus.completed : DayStatus.missed;
      }

      return StreakDay(label: labels[i], status: status);
    });
  }

  static List<StreakDay> _emptyWeek() {
    const labels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    return labels.map((l) => StreakDay(label: l, status: DayStatus.empty)).toList();
  }

  static DateTime _day(DateTime dt) =>
      DateTime(dt.year, dt.month, dt.day);

  @override
  void dispose() {
    _disposed = true;
    _questsController.removeListener(_load);
    super.dispose();
  }
}
