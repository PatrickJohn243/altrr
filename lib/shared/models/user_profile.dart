import 'package:isar/isar.dart';

part 'user_profile.g.dart';

/// Singleton user profile — always stored at id = 1.
@collection
class UserProfile {
  Id id = 1;
  late String name;
  String? avatarPath;
}
