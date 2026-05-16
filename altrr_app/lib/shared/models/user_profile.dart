import 'package:isar/isar.dart';

part 'user_profile.g.dart';

@collection
class UserProfile {
  Id id = 1;
  late String name;
  String? avatarPath;
}
