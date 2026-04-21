import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../shared/generation/character/character_roster.dart';
import '../../shared/models/character.dart';
import '../../shared/models/daily_stats.dart';
import '../../shared/models/quest.dart';
import '../../shared/models/earned_title.dart';
import '../../shared/models/user_profile.dart';

/// App-wide Isar singleton.
///
/// Call [init] once in main() before runApp.
/// Access the instance anywhere via [IsarService.instance].
class IsarService {
  IsarService._();

  static late Isar instance;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    instance = await Isar.open(
      [QuestSchema, CharacterSchema, UserProfileSchema, EarnedTitleSchema, DailyStatsSchema],
      directory: dir.path,
    );
    await _seedRosterIfEmpty();
  }

  /// Writes the canonical roster characters on first launch.
  /// No-op on every subsequent launch.
  static Future<void> _seedRosterIfEmpty() async {
    final count = await instance.characters.count();
    if (count > 0) return;
    await instance.writeTxn(() async {
      await instance.characters.putAll(
        CharacterRoster.characters.map((d) => d.toCharacter()).toList(),
      );
    });
  }

  /// Returns the Isar [Character] whose [generationSeed] matches [seed].
  /// Used to resolve a CharacterDefinition to a persisted Isar ID.
  static Future<Character?> characterBySeed(int seed) async {
    final all = await instance.characters.where().findAll();
    try {
      return all.firstWhere((c) => c.generationSeed == seed);
    } catch (_) {
      return null;
    }
  }
}
