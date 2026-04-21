import 'package:flutter/material.dart';
import '../database/isar_service.dart';
import '../config/app_preferences.dart';
import '../utils/image_utils.dart';
import '../../shared/models/user_profile.dart';

class UserProfileController extends ChangeNotifier {
  String _name = 'Adventurer';
  String? _avatarPath;

  String get name => _name;
  String? get avatarPath => _avatarPath;
  bool get isOnboarded => AppPreferences.isOnboarded;
  List<String> get preferredCategories => AppPreferences.preferredCategories;

  String get initials {
    final parts = _name.trim().split(' ').where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return '?';
    if (parts.length >= 2) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    return _name.substring(0, _name.length.clamp(0, 2)).toUpperCase();
  }

  Future<void> load() async {
    final profile = await IsarService.instance.userProfiles.get(1);
    if (profile != null) {
      _name = profile.name;
      _avatarPath = profile.avatarPath;
    }
  }

  Future<void> save(String name, String? avatarPath) async {
    if (avatarPath != _avatarPath && _avatarPath != null) {
      await ImageUtils.deleteIfExists(_avatarPath);
    }
    final profile = UserProfile()
      ..id = 1
      ..name = name.trim().isEmpty ? 'Adventurer' : name.trim()
      ..avatarPath = avatarPath;
    await IsarService.instance.writeTxn(() async {
      await IsarService.instance.userProfiles.put(profile);
    });
    _name = profile.name;
    _avatarPath = profile.avatarPath;
    notifyListeners();
  }

  Future<void> saveOnboarding({
    required String name,
    String? avatarPath,
    required List<String> preferredCategories,
  }) async {
    final profile = UserProfile()
      ..id = 1
      ..name = name.trim().isEmpty ? 'Adventurer' : name.trim()
      ..avatarPath = avatarPath;
    await IsarService.instance.writeTxn(() async {
      await IsarService.instance.userProfiles.put(profile);
    });
    await AppPreferences.setPreferredCategories(preferredCategories);
    await AppPreferences.setIsOnboarded(true);
    _name = profile.name;
    _avatarPath = profile.avatarPath;
    notifyListeners();
  }
}
