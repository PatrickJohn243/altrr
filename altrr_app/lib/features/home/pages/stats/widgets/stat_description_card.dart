import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/app_typography.dart';
import '../controllers/stats_controller.dart';

class StatDescriptionCard extends StatelessWidget {
  final StatItem item;
  const StatDescriptionCard({super.key, required this.item});

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
          Text(
            item.label.toUpperCase(),
            style: AppTypography.sectionLabel,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            item.description,
            style: AppTypography.outfitMedium(14, AppColors.textPrimary)
                .copyWith(height: 1.6),
          ),
        ],
      ),
    );
  }
}
