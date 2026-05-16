import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import '../../../../../core/config/app_preferences.dart';
import '../../../../../core/services/daily_stats_service.dart';

class StatsGraphController extends ChangeNotifier {
  bool _disposed = false;
  bool isLoading = true;

  List<FlSpot> spots = [];
  List<String> labels = [];
  double maxY = 10;
  int weekBest = 0;

  static const _dayLabels = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];

  StatsGraphController() {
    loadWeek();
  }

  Future<void> loadWeek() async {
    isLoading = true;
    _notify();

    final now = DateTime.now();
    final today = DateTime.utc(now.year, now.month, now.day);
    final days = List.generate(7, (i) => today.subtract(Duration(days: 6 - i)));

    final raw = await DailyStatsService.getRange(days.first, days.last);
    final byDate = {for (final s in raw) _key(s.date): s};

    final newSpots = <FlSpot>[];
    final newLabels = <String>[];

    for (int i = 0; i < days.length; i++) {
      final stat = byDate[_key(days[i])];
      newSpots
          .add(FlSpot(i.toDouble(), (stat?.questsCompleted ?? 0).toDouble()));
      newLabels.add(_dayLabels[days[i].weekday - 1]);
    }

    // Dynamic Y: nearest multiple of 10 above week max, floor 10
    final weekMax =
        newSpots.isEmpty ? 0 : newSpots.map((s) => s.y).reduce(max).toInt();
    final dynamicY =
        weekMax == 0 ? 10.0 : ((weekMax / 10).ceil() * 10).toDouble();

    // Record all-time best daily count
    if (weekMax > AppPreferences.allTimeBestDailyCount) {
      await AppPreferences.setAllTimeBestDailyCount(weekMax);
    }

    spots = newSpots;
    labels = newLabels;
    maxY = dynamicY;
    weekBest = weekMax;
    isLoading = false;
    _notify();
  }

  String _key(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  void _notify() {
    if (!_disposed) notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
