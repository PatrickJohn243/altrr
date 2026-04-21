import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:go_router/go_router.dart';
import 'core/controllers/user_profile_controller.dart';
import 'core/controllers/user_profile_provider.dart';
import 'core/database/isar_service.dart';
import 'core/router/app_router.dart';
import 'core/services/notification_service.dart';
import 'features/home/controllers/notifications_controller.dart';
import 'core/config/app_preferences.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const _SplashApp());
}

class _SplashApp extends StatefulWidget {
  const _SplashApp();

  @override
  State<_SplashApp> createState() => _SplashAppState();
}

class _SplashAppState extends State<_SplashApp> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await IsarService.init();
    await AppPreferences.init();
    await NotificationService.init();
    _rescheduleNotifications();
    await NotificationsController.instance.load();
    final profileController = UserProfileController();
    await profileController.load();
    final router = createAppRouter(profileController);
    runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => AltrrApp(profileController: profileController, router: router),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: Scaffold(backgroundColor: Color(0xFF121212)),
      );
}

/// Re-schedule active notifications on every cold start.
/// Scheduled notifications are lost after app uninstall or OS clear — this
/// ensures they come back after reinstall / update.
void _rescheduleNotifications() {
  if (AppPreferences.streakReminder) {
    NotificationService.scheduleStreakReminder();
  }
  if (AppPreferences.dailyReminder) {
    NotificationService.scheduleDailyReminder();
  }
}

class AltrrApp extends StatelessWidget {
  final UserProfileController profileController;
  final GoRouter router;

  const AltrrApp({super.key, required this.profileController, required this.router});

  @override
  Widget build(BuildContext context) {
    return UserProfileProvider(
      controller: profileController,
      child: MaterialApp.router(
        title: 'Altrr',
        theme: AppTheme.dark,
        routerConfig: router,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
      ),
    );
  }
}
