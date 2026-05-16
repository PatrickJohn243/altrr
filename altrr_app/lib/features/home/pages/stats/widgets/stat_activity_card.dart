import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/app_typography.dart';
import '../controllers/stats_graph_controller.dart';
import 'quest_line_chart.dart';

class StatActivityCard extends StatelessWidget {
  final StatsGraphController controller;
  const StatActivityCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.cardPadding),
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: const Border(
          top: BorderSide(color: AppColors.borderSubtle),
          left: BorderSide(color: AppColors.borderSubtle),
          right: BorderSide(color: AppColors.borderSubtle),
          bottom: BorderSide(color: AppColors.borderSubtle, width: 3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('THIS WEEK', style: AppTypography.sectionLabel),
          const SizedBox(height: AppSpacing.lg),
          SizedBox(
            height: 160,
            child: controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.accent,
                      strokeWidth: 2,
                    ),
                  )
                : QuestLineChart(
                    spots: controller.spots,
                    labels: controller.labels,
                    maxY: controller.maxY,
                  ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Quests completed per day',
            style: AppTypography.outfitMedium(10, AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}
