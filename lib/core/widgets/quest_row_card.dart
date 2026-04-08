import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';

/// Dark list row for a completed/recent quest — icon + category/title + date.
class QuestRowCard extends StatelessWidget {
  final Widget icon;
  final String category;
  final String questTitle;
  final String date;
  final bool isSkipped;

  const QuestRowCard({
    super.key,
    required this.icon,
    required this.category,
    required this.questTitle,
    required this.date,
    this.isSkipped = false,
  });

  @override
  Widget build(BuildContext context) {
    final double opacity = isSkipped ? 0.07 : 1.0;

    return Opacity(
      opacity: opacity,
      child: Container(
        height: 72,
        decoration: const BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.card)),
          border: Border(
            top: BorderSide(color: AppColors.borderSubtle),
            left: BorderSide(color: AppColors.borderSubtle),
            right: BorderSide(color: AppColors.borderSubtle),
            bottom: BorderSide(color: AppColors.borderSubtle, width: 3),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(AppRadius.card)),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.cardPaddingMd),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: AppColors.borderSubtle,
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppRadius.icon)),
                  ),
                  child: Center(child: icon),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.toUpperCase(),
                        style: AppTypography.categoryLabel,
                      ),
                      const SizedBox(height: 2),
                      Text(questTitle, style: AppTypography.cardTitle),
                    ],
                  ),
                ),
                Text(
                  date,
                  style: AppTypography.outfitSemiBold(10, AppColors.textMuted),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
