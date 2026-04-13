import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../../../core/database/isar_service.dart';
import '../../../shared/models/quest.dart';

export '../../../shared/models/quest.dart' show Quest;

// ── Models ────────────────────────────────────────────────────────────────────

class QuestEntry {
  final String category;
  final String title;
  final String date;
  final IconData icon;
  final Quest quest;

  const QuestEntry({
    required this.category,
    required this.title,
    required this.date,
    required this.icon,
    required this.quest,
  });
}

class HistorySection {
  final String label;
  final List<QuestEntry> quests;

  const HistorySection({required this.label, required this.quests});
}

// ── Controller ────────────────────────────────────────────────────────────────

class HistoryController extends ChangeNotifier {
  final searchController = TextEditingController();
  final Isar _isar = IsarService.instance;

  String _query = '';
  List<HistorySection> _allLoaded = [];

  String get query => _query;

  HistoryController() {
    _load();
  }

  Future<void> _load() async {
    final all = await _isar.quests
        .filter()
        .statusEqualTo(QuestStatus.completed)
        .sortByAssignedAtDesc()
        .findAll();

    final now = DateTime.now();
    final today = _day(now);
    final yesterday = today.subtract(const Duration(days: 1));

    // Group by calendar day (using completedAt/skippedAt, falling back to assignedAt).
    final Map<DateTime, List<Quest>> byDay = {};
    for (final q in all) {
      final date = _day(q.completedAt ?? q.assignedAt);
      byDay.putIfAbsent(date, () => []).add(q);
    }

    // Sort days newest first.
    final sortedDays = byDay.keys.toList()..sort((a, b) => b.compareTo(a));

    _allLoaded = sortedDays.map((day) {
      final String label;
      if (day == today) {
        label = 'TODAY';
      } else if (day == yesterday) {
        label = 'YESTERDAY';
      } else {
        const months = [
          'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
          'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'
        ];
        label = '${months[day.month - 1]} ${day.day}';
      }

      final entries = byDay[day]!.map((q) {
        final dt = q.completedAt ?? q.assignedAt;
        const months = [
          'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
          'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
        ];
        return QuestEntry(
          category: q.category,
          title: q.title,
          date: '${months[dt.month - 1]} ${dt.day}',
          icon: _iconForCategory(q.category),
          quest: q,
        );
      }).toList();

      return HistorySection(label: label, quests: entries);
    }).toList();

    notifyListeners();
  }

  List<HistorySection> get filteredSections {
    if (_query.isEmpty) return _allLoaded;
    final q = _query.toLowerCase();
    return _allLoaded
        .map((s) => HistorySection(
              label: s.label,
              quests: s.quests
                  .where((e) =>
                      e.title.toLowerCase().contains(q) ||
                      e.category.toLowerCase().contains(q))
                  .toList(),
            ))
        .where((s) => s.quests.isNotEmpty)
        .toList();
  }

  void onSearchChanged(String value) {
    _query = value;
    notifyListeners();
  }

  static DateTime _day(DateTime dt) => DateTime(dt.year, dt.month, dt.day);

  static IconData _iconForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'physical':
        return Icons.fitness_center;
      case 'mental':
        return Icons.psychology;
      case 'social':
        return Icons.people;
      case 'cooking':
        return Icons.restaurant;
      case 'learning':
        return Icons.school;
      case 'explore':
        return Icons.travel_explore;
      case 'hobby':
        return Icons.palette;
      case 'reflection':
        return Icons.self_improvement;
      default:
        return Icons.star_outline;
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
