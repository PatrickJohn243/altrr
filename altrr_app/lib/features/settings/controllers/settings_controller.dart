import 'package:flutter/material.dart';
import '../../../core/config/app_preferences.dart';
import '../../../core/services/notification_service.dart';

class SettingsController extends ChangeNotifier {
  bool _streakReminder = AppPreferences.streakReminder;
  bool _dailyReminder  = AppPreferences.dailyReminder;

  bool get streakReminder => _streakReminder;
  bool get dailyReminder  => _dailyReminder;

  void setStreakReminder(bool value) {
    _streakReminder = value;
    AppPreferences.setStreakReminder(value);
    if (value) {
      NotificationService.scheduleStreakReminder();
    } else {
      NotificationService.cancelStreakReminder();
    }
    notifyListeners();
  }

  void setDailyReminder(bool value) {
    _dailyReminder = value;
    AppPreferences.setDailyReminder(value);
    if (value) {
      NotificationService.scheduleDailyReminder();
    } else {
      NotificationService.cancelDailyReminder();
    }
    notifyListeners();
  }
}
