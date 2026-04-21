import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';

/// Shown in place of the quest card when break mode is active.
class BreakStateCard extends StatelessWidget {
  final VoidCallback? onEndEarly;

  const BreakStateCard({super.key, this.onEndEarly});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.card)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.cardPadding),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Icon + label row ──────────────────────────────────────────
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.bgElevated,
                    borderRadius: BorderRadius.circular(AppRadius.icon),
                    border: Border.all(color: AppColors.borderSubtle),
                  ),
                  child: const Icon(
                    Icons.bedtime_outlined,
                    size: 22,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BREAK MODE',
                      style: AppTypography.outfitBold(10, AppColors.textMuted)
                          .copyWith(letterSpacing: 0.9),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'You\'re resting today.',
                      style: AppTypography.unboundedBold(
                          13, AppColors.textPrimary),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),

            // ── Divider ───────────────────────────────────────────────────
            const Divider(color: AppColors.borderSubtle, thickness: 1),
            const SizedBox(height: AppSpacing.md),

            // ── Body ──────────────────────────────────────────────────────
            Text(
              'The quests will still be here tomorrow. Take it easy.',
              style: AppTypography.outfitMedium(14, AppColors.textMuted),
            ),
            const SizedBox(height: AppSpacing.xl),

            // ── End early link ────────────────────────────────────────────
            if (onEndEarly != null)
              GestureDetector(
                onTap: onEndEarly,
                child: Text(
                  'End break early',
                  style: AppTypography.outfitSemiBold(12, AppColors.textMuted)
                      .copyWith(decoration: TextDecoration.underline),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
