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

  // ── Stats ──────────────────────────────────────────────────────────────────

  static const _kAllTimeBestDailyCount = 'pref_all_time_best_daily_count';

  static int get allTimeBestDailyCount =>
      _prefs.getInt(_kAllTimeBestDailyCount) ?? 0;
  static Future<void> setAllTimeBestDailyCount(int v) =>
      _prefs.setInt(_kAllTimeBestDailyCount, v);

  // ── Notifications ──────────────────────────────────────────────────────────

  static const _kStreakReminder = 'pref_streak_reminder';
  static const _kDailyReminder  = 'pref_daily_reminder';

  static bool get streakReminder => _prefs.getBool(_kStreakReminder) ?? true;
  static Future<void> setStreakReminder(bool v) => _prefs.setBool(_kStreakReminder, v);

  static bool get dailyReminder => _prefs.getBool(_kDailyReminder) ?? false;
  static Future<void> setDailyReminder(bool v) => _prefs.setBool(_kDailyReminder, v);

  // ── Break mode ─────────────────────────────────────────────────────────────

  static const _kBreakDate = 'pref_break_date';
  static const _kBreakDays = 'pref_break_days';

  static bool get isBreakModeActive {
    final stored = _prefs.getString(_kBreakDate);
    if (stored == null) return false;
    return stored == _toDateStr(DateTime.now());
  }

  static Set<String> get breakDays =>
      (_prefs.getStringList(_kBreakDays) ?? []).toSet();

  static Future<void> activateBreakMode() async {
    final todayStr = _toDateStr(DateTime.now());
    await _prefs.setString(_kBreakDate, todayStr);
    final existing = List<String>.from(_prefs.getStringList(_kBreakDays) ?? []);
    if (!existing.contains(todayStr)) {
      existing.add(todayStr);
      await _prefs.setStringList(_kBreakDays, existing);
    }
  }

  static Future<void> clearBreakMode() => _prefs.remove(_kBreakDate);

  static String _toDateStr(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  // ── Quest prompt cache ─────────────────────────────────────────────────────

  static String? getCachedPromptAnswer(String requires) =>
      _prefs.getString('pref_prompt_$requires');

  static Future<void> setCachedPromptAnswer(String requires, String answer) =>
      _prefs.setString('pref_prompt_$requires', answer);

  static Future<void> clearCachedPromptAnswer(String requires) =>
      _prefs.remove('pref_prompt_$requires');
}
