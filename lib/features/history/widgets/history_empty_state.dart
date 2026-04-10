import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';

class HistoryEmptyState extends StatelessWidget {
  final String query;

  const HistoryEmptyState({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.search_off, color: AppColors.textMuted, size: 32),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'No quests matching "$query"',
            style: const TextStyle(color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}
