import 'package:flutter/material.dart';
import '../database/isar_service.dart';
import '../../shared/models/user_profile.dart';

class UserProfileController extends ChangeNotifier {
  String _name = 'Adventurer';
  String? _avatarPath;
  List<String> _preferredCategories = [];
  bool _isOnboarded = false;

  String get name => _name;
  String? get avatarPath => _avatarPath;
  List<String> get preferredCategories => _preferredCategories;
  bool get isOnboarded => _isOnboarded;

  String get initials {
    final parts = _name.trim().split(' ').where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return '?';
    if (parts.length >= 2) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    return _name.substring(0, _name.length.clamp(0, 2)).toUpperCase();
  }

  /// Called once before runApp — no notifyListeners needed.
  Future<void> load() async {
    final profile = await IsarService.instance.userProfiles.get(1);
    if (profile != null) {
      _name = profile.name;
      _avatarPath = profile.avatarPath;
      _preferredCategories = List.of(profile.preferredCategories);
      _isOnboarded = profile.isOnboarded;
    }
  }

  /// Saves profile edits (name + avatar) without touching onboarding state.
  Future<void> save(String name, String? avatarPath) async {
    final existing = await IsarService.instance.userProfiles.get(1);
    final profile = UserProfile()
      ..id = 1
      ..name = name.trim().isEmpty ? 'Adventurer' : name.trim()
      ..avatarPath = avatarPath
      ..preferredCategories = existing?.preferredCategories ?? _preferredCategories
      ..isOnboarded = _isOnboarded;
    await IsarService.instance.writeTxn(() async {
      await IsarService.instance.userProfiles.put(profile);
    });
    _name = profile.name;
    _avatarPath = profile.avatarPath;
    notifyListeners();
  }

  /// Called at the end of onboarding — writes all fields and marks complete.
  Future<void> saveOnboarding({
    required String name,
    String? avatarPath,
    required List<String> preferredCategories,
  }) async {
    final profile = UserProfile()
      ..id = 1
      ..name = name.trim().isEmpty ? 'Adventurer' : name.trim()
      ..avatarPath = avatarPath
      ..preferredCategories = preferredCategories
      ..isOnboarded = true;
    await IsarService.instance.writeTxn(() async {
      await IsarService.instance.userProfiles.put(profile);
    });
    _name = profile.name;
    _avatarPath = profile.avatarPath;
    _preferredCategories = preferredCategories;
    _isOnboarded = true;
    notifyListeners();
  }
}
