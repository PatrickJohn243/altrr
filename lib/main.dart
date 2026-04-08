import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const AltrrApp(),
    ),
  );
}

class AltrrApp extends StatelessWidget {
  const AltrrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Altrr',
      theme: AppTheme.dark,
      routerConfig: appRouter,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}
