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

  static IconData iconForConditionTag(String tag) {
    switch (tag) {
      case 'quickDraw':      return Icons.bolt;
      case 'earlyBird':      return Icons.wb_sunny_outlined;
      case 'nightOwl':       return Icons.nightlight_round;
      case 'comeback':       return Icons.replay;
      case 'dailyBurst':     return Icons.local_fire_department;
      case 'weekStreak':
      case 'monthStreak':    return Icons.calendar_today_outlined;
      case 'cleanRun':       return Icons.check_circle_outline;
      case 'speedMilestone': return Icons.speed;
      default:               return Icons.timer_outlined;
    }
  }
}
