import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';

/// 119×155 category card — shows titles earned per category.
/// Locked state (count == 0): dark header, dim text, no tap.
/// Unlocked: lime header, category icon, title count, navigates on tap.
class TitleCategoryCard extends StatelessWidget {
  final String category;
  final IconData icon;
  final int titleCount;
  final bool locked;
  final VoidCallback? onTap;

  const TitleCategoryCard({
    super.key,
    required this.category,
    required this.icon,
    required this.titleCount,
    this.locked = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor =
        locked ? AppColors.borderCard : AppColors.borderSubtle;

    return GestureDetector(
      onTap: locked ? null : onTap,
      child: Container(
        width: 119,
        height: 155,
        decoration: BoxDecoration(
          color: AppColors.bgPrimary,
          borderRadius: BorderRadius.circular(AppRadius.card),
          border: Border(
            top: BorderSide(color: borderColor),
            left: BorderSide(color: borderColor),
            right: BorderSide(color: borderColor),
            bottom: BorderSide(color: borderColor, width: 3),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.card),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header ────────────────────────────────────────────────────
              Container(
                height: 63,
                decoration: BoxDecoration(
                  color: locked ? AppColors.bgElevated : AppColors.accent,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(AppRadius.card),
                  ),
                  border: const Border(
                    bottom: BorderSide(color: AppColors.borderSubtle),
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: locked
                          ? AppColors.bgPrimary
                          : AppColors.bgElevated,
                      borderRadius: BorderRadius.circular(AppRadius.icon),
                    ),
                    child: Center(
                      child: locked
                          ? const Icon(
                              Icons.lock_outline,
                              size: 16,
                              color: AppColors.textMuted,
                            )
                          : Icon(icon, size: 20, color: AppColors.accent),
                    ),
                  ),
                ),
              ),

              // ── Body ──────────────────────────────────────────────────────
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.cardPaddingSm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.toUpperCase(),
                        style: locked
                            ? AppTypography.unboundedMedium(
                                10, AppColors.textDisabled)
                            : AppTypography.unboundedMedium(
                                10, AppColors.accent),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        locked
                            ? 'No titles yet'
                            : '$titleCount ${titleCount == 1 ? 'title' : 'titles'}',
                        style: AppTypography.outfitMedium(
                          12,
                          locked
                              ? AppColors.textMuted
                              : AppColors.textDisabled,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
