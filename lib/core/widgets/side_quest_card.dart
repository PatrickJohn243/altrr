import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';

/// Dark side quest card — icon, category, title, description, dot indicators + Start button.
class SideQuestCard extends StatelessWidget {
  final Widget icon;
  final String category;
  final String questTitle;
  final String description;
  final String date;
  final int totalDots;
  final int activeDot;
  final VoidCallback? onStart;

  const SideQuestCard({
    super.key,
    required this.icon,
    required this.category,
    required this.questTitle,
    required this.description,
    required this.date,
    this.totalDots = 3,
    this.activeDot = 0,
    this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Column(
          children: [
            // Main content row
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.cardPaddingMd,
                vertical: AppSpacing.cardPaddingSm,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: const BoxDecoration(
                      color: AppColors.bgElevated,
                      borderRadius: BorderRadius.all(Radius.circular(AppRadius.icon)),
                    ),
                    child: Center(child: icon),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              category.toUpperCase(),
                              style: AppTypography.categoryLabel,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.access_time,
                                    size: 9, color: AppColors.textMuted),
                                const SizedBox(width: 3),
                                Text(date,
                                    style: AppTypography.outfitSemiBold(12, AppColors.textMuted)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          questTitle,
                          style: AppTypography.unboundedExtraBold(12, AppColors.textPrimary),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          description,
                          style: AppTypography.outfitMedium(12, const Color(0x80F0F0F0)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Divider + footer
            Container(
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: AppColors.borderSubtle)),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.cardPaddingMd,
                vertical: AppSpacing.sm,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Dot indicators
                  Row(
                    children: List.generate(totalDots, (i) {
                      return Container(
                        width: 5,
                        height: 5,
                        margin: EdgeInsets.only(right: i < totalDots - 1 ? 3 : 0),
                        decoration: BoxDecoration(
                          color: i == activeDot ? AppColors.accent : AppColors.bgEmpty,
                          borderRadius: const BorderRadius.all(Radius.circular(2.5)),
                        ),
                      );
                    }),
                  ),
                  // Start button
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.borderMid),
                      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(AppRadius.button)),
                      ),
                    ),
                    onPressed: onStart,
                    child: Text(
                      'Start',
                      style: AppTypography.unboundedBold(12, AppColors.textDisabled),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
