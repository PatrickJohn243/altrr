import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';

class TitlesEmptyState extends StatelessWidget {
  final String query;

  const TitlesEmptyState({super.key, required this.query});

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
                Icons.military_tech_outlined,
                color: AppColors.textMuted,
                size: 24,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              query.isEmpty ? 'No titles yet' : 'No results for "$query"',
              style: AppTypography.unboundedBold(14, AppColors.textPrimary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              query.isEmpty
                  ? 'Complete quests to earn your first title.'
                  : 'Try a different search or filter.',
              style: AppTypography.outfitMedium(13, AppColors.textMuted),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
