import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import '../../../../../core/database/isar_service.dart';
import '../../../../../shared/models/quest.dart';
import '../../../../../shared/models/earned_title.dart';

class StatItem {
  final String key;
  final String label;
  final String description;
  final int value;

  const StatItem({
    required this.key,
    required this.label,
    required this.description,
    required this.value,
  });
}

class StatsController extends ChangeNotifier {
  final Isar _isar = IsarService.instance;
  bool _disposed = false;
  bool isLoading = true;

  List<StatItem> stats = [];

  StatsController() {
    _load();
  }

  Future<void> reload() => _load();

  Future<void> _load() async {
    isLoading = true;
    if (!_disposed) notifyListeners();

    final history = await _isar.quests
        .filter()
        .statusEqualTo(QuestStatus.completed)
        .sortByAssignedAtDesc()
        .findAll();

    final titles = await _isar.earnedTitles.where().findAll();

    stats = [
      StatItem(
        key: 'quests',
        label: 'Quests Done',
        description:
            'Every quest you complete builds the person you\'re becoming. The number doesn\'t define you — the habit does.',
        value: history.length,
      ),
      StatItem(
        key: 'streak',
        label: 'Current Streak',
        description:
            'Consistency is the compound interest of self-improvement. Each day you show up, the next one gets easier.',
        value: _computeCurrentStreak(history),
      ),
      StatItem(
        key: 'best',
        label: 'Best Streak',
        description:
            'Your longest run of daily quests — a record set by your past self. The question is whether your future self will beat it.',
        value: _computeBestStreak(history),
      ),
      StatItem(
        key: 'titles',
        label: 'Titles Earned',
        description:
            'Each title marks a chapter in your story. Some are rare. Some are hidden. All of them were earned.',
        value: titles.length,
      ),
      StatItem(
        key: 'categories',
        label: 'Areas Explored',
        description:
            'The more dimensions you operate in, the harder you are to categorize. You\'re becoming something harder to define.',
        value: history.map((q) => q.category).toSet().length,
      ),
    ];

    isLoading = false;
    if (!_disposed) notifyListeners();
  }

  static int _computeCurrentStreak(List<Quest> history) {
    final days = history
        .where((q) => q.completedAt != null)
        .map((q) => _day(q.completedAt!))
        .toSet()
        .toList()
      ..sort((a, b) => b.compareTo(a));

    if (days.isEmpty) return 0;
    final today = _day(DateTime.now());
    final yesterday = today.subtract(const Duration(days: 1));
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

  static int _computeBestStreak(List<Quest> history) {
    final days = history
        .where((q) => q.completedAt != null)
        .map((q) => _day(q.completedAt!))
        .toSet()
        .toList()
      ..sort((a, b) => a.compareTo(b));

    if (days.isEmpty) return 0;
    int best = 1, current = 1;
    for (int i = 1; i < days.length; i++) {
      if (days[i].difference(days[i - 1]).inDays == 1) {
        current++;
        if (current > best) best = current;
      } else {
        current = 1;
      }
    }
    return best;
  }

  static DateTime _day(DateTime dt) => DateTime(dt.year, dt.month, dt.day);

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
