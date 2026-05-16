import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';

class ProCTACard extends StatelessWidget {
  final VoidCallback onTap;

  const ProCTACard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.cardPadding),
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(AppRadius.card),
          border: Border(
            top: BorderSide(color: AppColors.accentDim, width: 1),
            left: BorderSide(color: AppColors.accentDim, width: 1),
            right: BorderSide(color: AppColors.accentDim, width: 1),
            bottom: BorderSide(color: AppColors.accentDim, width: 3),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.accentSubtle,
                borderRadius: BorderRadius.circular(AppRadius.icon),
                border: Border.all(color: AppColors.accentDim),
              ),
              child: const Icon(
                Icons.auto_awesome_outlined,
                size: 18,
                color: AppColors.accent,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Unlock Pro',
                        style: AppTypography.unboundedBold(
                            12, AppColors.textPrimary),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'PRO',
                          style: AppTypography.unboundedBlack(
                                  7, AppColors.textInverse)
                              .copyWith(letterSpacing: 1.0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'AI quests, groups, cloud sync and more.',
                    style: AppTypography.outfitMedium(12, AppColors.textMuted),
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.accent,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
