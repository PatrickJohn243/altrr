import 'package:flutter/material.dart';
import '../../../prefs/app_preferences.dart';

class SettingsController extends ChangeNotifier {
  bool _streakReminder = AppPreferences.streakReminder;
  bool _dailyReminder  = AppPreferences.dailyReminder;

  bool get streakReminder => _streakReminder;
  bool get dailyReminder  => _dailyReminder;

  void setStreakReminder(bool value) {
    _streakReminder = value;
    AppPreferences.setStreakReminder(value);
    notifyListeners();
  }

  void setDailyReminder(bool value) {
    _dailyReminder = value;
    AppPreferences.setDailyReminder(value);
    notifyListeners();
  }
}
