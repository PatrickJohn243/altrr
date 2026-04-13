import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';

class QuestsEmptyState extends StatelessWidget {
  final String query;

  const QuestsEmptyState({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                color: AppColors.bgSurface,
                borderRadius: BorderRadius.all(Radius.circular(AppRadius.card)),
                border: Border.fromBorderSide(
                  BorderSide(color: AppColors.borderSubtle),
                ),
              ),
              child: const Icon(
                Icons.check_circle_outline,
                color: AppColors.textMuted,
                size: 24,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              query.isEmpty ? 'No completed quests yet' : 'No results for "$query"',
              style: AppTypography.unboundedBold(14, AppColors.textPrimary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              query.isEmpty
                  ? 'Complete your first quest to see it here.'
                  : 'Try a different search term.',
              style: AppTypography.outfitMedium(13, AppColors.textMuted),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
