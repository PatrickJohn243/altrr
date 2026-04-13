import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';
import 'grid_background.dart';

/// Lime quest display card — shown on home screen.
/// Contains: assigned-by dot, quest title, "What you're doing" overlay box,
/// expiry info, skip button, and complete button.
class QuestDisplayCard extends StatelessWidget {
  final String questTitle;
  final String description;
  final String expiryText;
  final bool assignedByAltrr;
  final VoidCallback? onComplete;
  final VoidCallback? onSkip;

  const QuestDisplayCard({
    super.key,
    required this.questTitle,
    required this.description,
    required this.expiryText,
    this.assignedByAltrr = true,
    this.onComplete,
    this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.card)),
      child: Container(
        width: double.infinity,
        color: AppColors.accent,
        child: GridBackground(
          squareSize: 28,
          lineColor: const Color(0x15121212),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.cardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Assigned-by indicator
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: AppColors.questCardTextMuted,
                        borderRadius: BorderRadius.all(
                            Radius.circular(AppRadius.dot)),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      assignedByAltrr
                          ? 'Assigned by ALTRR'
                          : 'Anonymously assigned',
                      style: AppTypography.outfitSemiBold(
                          10, AppColors.questCardTextMuted),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                // Quest title
                Text(
                  questTitle,
                  style: AppTypography.questTitle,
                ),
                const SizedBox(height: AppSpacing.lg),
                // "What you're doing" box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 11),
                  decoration: const BoxDecoration(
                    color: AppColors.questCardOverlay,
                    borderRadius: BorderRadius.all(Radius.circular(11)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "WHAT YOU'RE DOING —",
                        style: AppTypography.outfitBold(
                                12, AppColors.questCardTextDim)
                            .copyWith(letterSpacing: 0.9),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        description,
                        style: AppTypography.questDescription,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                // Footer: expiry + actions
                Row(
                  children: [
                    const Icon(Icons.access_time,
                        size: 12, color: AppColors.textInverse),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        expiryText,
                        style: AppTypography.outfitMedium(
                            12, AppColors.textInverse),
                      ),
                    ),
                    // Skip button
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: AppColors.bgElevated,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(14)),
                        border: Border.all(color: AppColors.borderMid),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.info_outline,
                            size: 12, color: AppColors.textMuted),
                        onPressed: onSkip,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    // Complete button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.bgPrimary,
                        foregroundColor: AppColors.accent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 9),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppRadius.button)),
                        ),
                        elevation: 0,
                      ),
                      onPressed: onComplete,
                      child: Text(
                        'Complete',
                        style: AppTypography.ctaButton
                            .copyWith(color: AppColors.accent),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
