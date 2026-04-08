import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';

/// 119×155 vertical title card — lime header with icon, dark body with category/name/count.
class TitleCard extends StatelessWidget {
  final Widget icon;
  final String category;
  final String titleName;
  final int questCount;

  const TitleCard({
    super.key,
    required this.icon,
    required this.category,
    required this.titleName,
    required this.questCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 119,
      height: 155,
      decoration: const BoxDecoration(
        color: AppColors.bgPrimary,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Lime header
            Container(
              height: 63,
              decoration: const BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.card)),
                border: Border(bottom: BorderSide(color: AppColors.borderSubtle)),
              ),
              child: Center(
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: const BoxDecoration(
                    color: AppColors.bgElevated,
                    borderRadius: BorderRadius.all(Radius.circular(AppRadius.icon)),
                  ),
                  child: Center(child: icon),
                ),
              ),
            ),
            // Dark body
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.cardPaddingSm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.toUpperCase(),
                      style: AppTypography.unboundedMedium(10, AppColors.accent),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      titleName,
                      style: AppTypography.unboundedExtraBold(12, AppColors.textPrimary),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '$questCount quest',
                      style: AppTypography.outfitMedium(12, AppColors.textDisabled),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
