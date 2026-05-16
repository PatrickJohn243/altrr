import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/grid_background.dart';
import '../../../shared/models/earned_title.dart';

class TitleShareCard extends StatelessWidget {
  final EarnedTitle title;

  const TitleShareCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final isGacha = title.titleType == TitleType.gacha;

    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: Container(
          color: AppColors.accent,
          child: GridBackground(
            squareSize: 28,
            lineColor: const Color(0x15121212),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.cardPadding,
                AppSpacing.xxl,
                AppSpacing.cardPadding,
                AppSpacing.cardPadding,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ── Type badge ─────────────────────────────────────────────
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0x1A121212),
                      borderRadius: BorderRadius.circular(AppRadius.chip),
                    ),
                    child: Text(
                      _typeLabel(),
                      style: AppTypography.unboundedBold(
                              8, AppColors.questCardTextMuted)
                          .copyWith(letterSpacing: 1.2),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),

                  // ── Title text ─────────────────────────────────────────────
                  Text(
                    title.titleText,
                    textAlign: TextAlign.center,
                    style: AppTypography.unboundedBlack(28, AppColors.textInverse),
                  ),
                  const SizedBox(height: AppSpacing.md),

                  // ── Subtext ────────────────────────────────────────────────
                  _buildSubtext(isGacha),

                  const SizedBox(height: AppSpacing.xxl),

                  // ── Footer: date + branding ────────────────────────────────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatDate(title.earnedAt),
                        style: AppTypography.outfitMedium(
                            11, AppColors.questCardTextMuted),
                      ),
                      Text(
                        'altrr',
                        style: AppTypography.unboundedBold(
                                10, AppColors.questCardTextMuted)
                            .copyWith(letterSpacing: 1.2),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubtext(bool isGacha) {
    if (isGacha && title.gachaSubtext != null) {
      return Text(
        title.gachaSubtext!,
        textAlign: TextAlign.center,
        style: AppTypography.outfitMedium(14, AppColors.questCardTextMuted)
            .copyWith(fontStyle: FontStyle.italic),
      );
    }
    return Column(
      children: [
        if (title.subtextA != null)
          Text(
            title.subtextA!,
            textAlign: TextAlign.center,
            style: AppTypography.outfitMedium(14, AppColors.questCardTextMuted)
                .copyWith(fontStyle: FontStyle.italic),
          ),
        if (title.subtextA != null && title.subtextB != null)
          const SizedBox(height: AppSpacing.xs),
        if (title.subtextB != null)
          Text(
            title.subtextB!,
            textAlign: TextAlign.center,
            style: AppTypography.outfitSemiBold(14, AppColors.textInverse),
          ),
      ],
    );
  }

  String _typeLabel() {
    switch (title.condition) {
      case TitleCondition.questCount:
        return 'QUEST TITLE';
      case TitleCondition.timeBased:
        return 'TIME TITLE';
      case TitleCondition.gacha:
        return 'CHAOS TITLE';
    }
  }

  String _formatDate(DateTime dt) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
  }
}
