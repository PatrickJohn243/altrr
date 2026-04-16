import 'package:flutter/material.dart';

class QuestCategory {
  final String key;
  final String label;
  final IconData icon;

  const QuestCategory({
    required this.key,
    required this.label,
    required this.icon,
  });
}

class QuestCategories {
  static const List<QuestCategory> all = [
    QuestCategory(key: 'physical',   label: 'Physical',   icon: Icons.fitness_center),
    QuestCategory(key: 'mental',     label: 'Mental',     icon: Icons.psychology),
    QuestCategory(key: 'social',     label: 'Social',     icon: Icons.people),
    QuestCategory(key: 'cooking',    label: 'Cooking',    icon: Icons.restaurant),
    QuestCategory(key: 'learning',   label: 'Learning',   icon: Icons.school),
    QuestCategory(key: 'explore',    label: 'Explore',    icon: Icons.travel_explore),
    QuestCategory(key: 'hobby',      label: 'Hobby',      icon: Icons.palette),
    QuestCategory(key: 'reflection', label: 'Reflection', icon: Icons.self_improvement),
  ];

  static IconData iconFor(String key) {
    return all.firstWhere(
      (c) => c.key == key.toLowerCase(),
      orElse: () => const QuestCategory(
        key: '',
        label: '',
        icon: Icons.task_alt,
      ),
    ).icon;
  }

  static String labelFor(String key) {
    return all.firstWhere(
      (c) => c.key == key.toLowerCase(),
      orElse: () => const QuestCategory(
        key: '',
        label: '',
        icon: Icons.task_alt,
      ),
    ).label;
  }
}
