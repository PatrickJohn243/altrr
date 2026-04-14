import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'core/controllers/user_profile_controller.dart';
import 'core/controllers/user_profile_provider.dart';
import 'core/database/isar_service.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService.init();
  final profileController = UserProfileController();
  await profileController.load();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => AltrrApp(profileController: profileController),
    ),
  );
}

class AltrrApp extends StatelessWidget {
  final UserProfileController profileController;

  const AltrrApp({super.key, required this.profileController});

  @override
  Widget build(BuildContext context) {
    return UserProfileProvider(
      controller: profileController,
      child: MaterialApp.router(
        title: 'Altrr',
        theme: AppTheme.dark,
        routerConfig: createAppRouter(profileController),
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
      ),
    );
  }
}
