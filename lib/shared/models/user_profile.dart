import 'package:isar/isar.dart';

part 'user_profile.g.dart';

/// Singleton user profile — always stored at id = 1.
@collection
class UserProfile {
  Id id = 1;
  late String name;
  String? avatarPath;

  /// Categories the user expressed interest in during onboarding.
  /// Used by the balance tracker to weight early quest assignments.
  /// Over time quests diversify beyond these — preferences fade, not lock.
  List<String> preferredCategories = [];

  /// True once onboarding is completed. Gates the redirect in the router.
  bool isOnboarded = false;
}
