enum AppFlavor { debug, staging, release }

abstract final class AppConfig {
  static const String _flavor = String.fromEnvironment(
    'FLAVOR',
    defaultValue: 'debug',
  );

  static AppFlavor get flavor => switch (_flavor) {
        'staging' => AppFlavor.staging,
        'release' => AppFlavor.release,
        _ => AppFlavor.debug,
      };

  static bool get isDebug => flavor == AppFlavor.debug;
  static bool get isStaging => flavor == AppFlavor.staging;
  static bool get isRelease => flavor == AppFlavor.release;
}
