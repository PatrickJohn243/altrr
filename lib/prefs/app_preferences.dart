import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  AppPreferences._();

  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // ── Onboarding ─────────────────────────────────────────────────────────────

  static const _kIsOnboarded          = 'pref_is_onboarded';
  static const _kPreferredCategories  = 'pref_preferred_categories';

  static bool get isOnboarded => _prefs.getBool(_kIsOnboarded) ?? false;
  static Future<void> setIsOnboarded(bool v) => _prefs.setBool(_kIsOnboarded, v);

  static List<String> get preferredCategories =>
      _prefs.getStringList(_kPreferredCategories) ?? [];
  static Future<void> setPreferredCategories(List<String> v) =>
      _prefs.setStringList(_kPreferredCategories, v);

  // ── Notifications ──────────────────────────────────────────────────────────

  static const _kStreakReminder = 'pref_streak_reminder';
  static const _kDailyReminder  = 'pref_daily_reminder';

  static bool get streakReminder => _prefs.getBool(_kStreakReminder) ?? true;
  static Future<void> setStreakReminder(bool v) => _prefs.setBool(_kStreakReminder, v);

  static bool get dailyReminder => _prefs.getBool(_kDailyReminder) ?? false;
  static Future<void> setDailyReminder(bool v) => _prefs.setBool(_kDailyReminder, v);
}
