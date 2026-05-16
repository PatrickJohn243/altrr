import 'package:flutter/foundation.dart';

class EntitlementService {
  EntitlementService._();

  static bool _debugPro = false;

  static bool get isPro {
    if (kDebugMode) return _debugPro;
    return false; // wire RevenueCat here later
  }

  static void debugSetPro(bool value) {
    if (kDebugMode) _debugPro = value;
  }

  static bool get debugProEnabled => kDebugMode && _debugPro;
}
