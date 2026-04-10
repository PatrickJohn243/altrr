import 'package:flutter/material.dart';

class SettingsController extends ChangeNotifier {
  bool _streakReminder = true;
  bool _dailyReminder = false;

  bool get streakReminder => _streakReminder;
  bool get dailyReminder => _dailyReminder;

  void setStreakReminder(bool value) {
    _streakReminder = value;
    notifyListeners();
  }

  void setDailyReminder(bool value) {
    _dailyReminder = value;
    notifyListeners();
  }
}
