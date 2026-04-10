import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';

/// Two-tone expanded quest card — lime top section + dark bottom section.
/// Used on the Quests screen for the active quest.
class QuestCard extends StatelessWidget {
  final String questTitle;
  final String description;
  final String? hint;
  final String expiryText;
  final bool assignedByAltrr;
  final VoidCallback? onComplete;
  final VoidCallback? onSkip;

  const QuestCard({
    super.key,
    required this.questTitle,
    required this.description,
    this.hint,
    required this.expiryText,
    this.assignedByAltrr = false,
    this.onComplete,
    this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.card)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Lime top
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.cardPadding),
            decoration: const BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.card)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: AppColors.questCardTextMuted,
                        borderRadius: BorderRadius.all(Radius.circular(AppRadius.dot)),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      assignedByAltrr ? 'Assigned by ALTRR' : 'Anonymously assigned',
                      style: AppTypography.outfitSemiBold(12, AppColors.questCardTextMuted),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(questTitle, style: AppTypography.questTitle),
              ],
            ),
          ),
          // Dark bottom
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.cardPadding),
            decoration: const BoxDecoration(
              color: AppColors.bgPrimary,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(AppRadius.card)),
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
                // "What you're doing" label
                Text(
                  "WHAT YOU'RE DOING",
                  style: AppTypography.outfitBold(10, const Color(0x73C8F135))
                      .copyWith(letterSpacing: 0.9),
                ),
                const SizedBox(height: 4),
                // Description
                Text(
                  description,
                  style: AppTypography.outfitSemiBold(20, AppColors.textPrimary),
                ),
                const SizedBox(height: AppSpacing.sm),
                // Hint with left accent border — only shown when non-null
                if (hint != null && hint!.isNotEmpty) ...[
                  Container(
                    padding: const EdgeInsets.only(left: 14),
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Color(0x4DC8F135), width: 2),
                      ),
                    ),
                    child: Text(hint!, style: AppTypography.bodyMedium),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                ],
                // Footer
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 12, color: AppColors.textMuted),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(expiryText, style: AppTypography.bodyMedium),
                    ),
                    // Skip icon button
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: AppColors.bgElevated,
                        borderRadius: const BorderRadius.all(Radius.circular(14)),
                        border: Border.all(color: AppColors.borderMid),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.info_outline, size: 12, color: AppColors.textMuted),
                        onPressed: onSkip,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    // Complete button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accent,
                        foregroundColor: AppColors.textInverse,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(AppRadius.button)),
                        ),
                        elevation: 0,
                      ),
                      onPressed: onComplete,
                      child: Text('Complete', style: AppTypography.ctaButton),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
