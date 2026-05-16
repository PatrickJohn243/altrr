import 'package:flutter/material.dart';
import 'user_profile_controller.dart';

/// InheritedNotifier — any widget that calls [of] will automatically
/// rebuild when [UserProfileController] calls notifyListeners().
class UserProfileProvider extends InheritedNotifier<UserProfileController> {
  const UserProfileProvider({
    super.key,
    required UserProfileController controller,
    required super.child,
  }) : super(notifier: controller);

  static UserProfileController of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<UserProfileProvider>();
    assert(provider != null, 'No UserProfileProvider found in widget tree');
    return provider!.notifier!;
  }
}
