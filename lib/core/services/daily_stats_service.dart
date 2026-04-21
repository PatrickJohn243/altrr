import 'package:isar/isar.dart';
import '../../shared/models/daily_stats.dart';
import '../database/isar_service.dart';

class DailyStatsService {
  static Future<void> recordQuestCompleted({
    required String category,
    required int streakCount,
    int titlesEarned = 0,
  }) async {
    final db = IsarService.instance;
    final today = _today();
    await db.writeTxn(() async {
      final existing =
          await db.dailyStats.where().dateEqualTo(today).findFirst();
      final snap = existing ?? (DailyStats()..date = today);
      snap.questsCompleted++;
      snap.streakCount = streakCount;
      snap.titlesEarned += titlesEarned;

      final keys = List<String>.from(snap.categoryKeys);
      final vals = List<int>.from(snap.categoryValues);
      final idx = keys.indexOf(category);
      if (idx >= 0) {
        vals[idx]++;
      } else {
        keys.add(category);
        vals.add(1);
      }
      snap.categoryKeys = keys;
      snap.categoryValues = vals;

      await db.dailyStats.put(snap);
    });
  }

  static Future<List<DailyStats>> getRange(DateTime from, DateTime to) =>
      IsarService.instance.dailyStats.where().dateBetween(from, to).findAll();

  static Future<List<DailyStats>> getAll() async {
    final all = await IsarService.instance.dailyStats.where().findAll();
    return all..sort((a, b) => a.date.compareTo(b.date));
  }

  static DateTime _today() {
    final now = DateTime.now();
    return DateTime.utc(now.year, now.month, now.day);
  }
}
