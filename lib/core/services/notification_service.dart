import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static const _streakId = 1;
  static const _dailyId = 2;

  static const _streakChannelId = 'altrr_streak_reminder';
  static const _dailyChannelId = 'altrr_daily_reminder';

  static final _plugin = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    tz.initializeTimeZones();
    final timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));

    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await _plugin.initialize(
      const InitializationSettings(android: androidSettings, iOS: iosSettings),
    );
  }

  /// Request POST_NOTIFICATIONS permission (Android 13+ / iOS).
  /// Returns true if granted.
  static Future<bool> requestPermission() async {
    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    final ios = _plugin.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();

    final androidGranted = await android?.requestNotificationsPermission();
    final iosGranted = await ios?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );

    return (androidGranted ?? true) && (iosGranted ?? true);
  }

  // ---------------------------------------------------------------------------
  // Immediate (test / event-driven) notification
  // ---------------------------------------------------------------------------

  static Future<void> showNow({
    required int id,
    required String title,
    required String body,
    String channelId = 'altrr_general',
    String channelName = 'Altrr',
  }) async {
    await _plugin.show(
      id,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channelId,
          channelName,
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: const DarwinNotificationDetails(),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Streak reminder — 8:00 PM daily
  // ---------------------------------------------------------------------------

  static Future<void> scheduleStreakReminder() async {
    await _plugin.zonedSchedule(
      _streakId,
      'Your streak is on the line.',
      'Don\'t let today slip. Complete your quest before midnight.',
      _nextInstanceOf(20, 0),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          _streakChannelId,
          'Streak Reminder',
          channelDescription: 'Reminds you to complete your quest before your streak breaks.',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static Future<void> cancelStreakReminder() async {
    await _plugin.cancel(_streakId);
  }

  // ---------------------------------------------------------------------------
  // Daily reminder — 9:00 AM daily
  // ---------------------------------------------------------------------------

  static Future<void> scheduleDailyReminder() async {
    await _plugin.zonedSchedule(
      _dailyId,
      'A quest awaits.',
      'Your character has something for you today. Check in.',
      _nextInstanceOf(9, 0),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          _dailyChannelId,
          'Daily Reminder',
          channelDescription: 'Reminds you to check your daily quest.',
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static Future<void> cancelDailyReminder() async {
    await _plugin.cancel(_dailyId);
  }

  // ---------------------------------------------------------------------------

  static tz.TZDateTime _nextInstanceOf(int hour, int minute) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduled =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }
}
