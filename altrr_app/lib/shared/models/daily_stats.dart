import 'package:isar/isar.dart';

part 'daily_stats.g.dart';

@collection
class DailyStats {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late DateTime date;

  int questsCompleted = 0;
  int streakCount = 0;
  int titlesEarned = 0;

  List<String> categoryKeys = [];
  List<int> categoryValues = [];
}
