import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/models/quest.dart';

/// Bottom sheet that presents a chain quest arc offer for user acceptance.
class ChainOfferSheet extends StatelessWidget {
  final Quest offer;
  final VoidCallback onAccept;
  final VoidCallback onDecline;

  const ChainOfferSheet._({
    required this.offer,
    required this.onAccept,
    required this.onDecline,
  });

  static Future<void> show(
    BuildContext context, {
    required Quest offer,
    required VoidCallback onAccept,
    required VoidCallback onDecline,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => ChainOfferSheet._(
        offer: offer,
        onAccept: onAccept,
        onDecline: onDecline,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final total = offer.chainTotal ?? 2;
    final stepsLabel = total == 1 ? '1 step' : '$total steps';

    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border.all(color: AppColors.borderMid),
      ),
      padding: EdgeInsets.fromLTRB(
        AppSpacing.screenPadding,
        AppSpacing.xl,
        AppSpacing.screenPadding,
        AppSpacing.screenPadding +
            MediaQuery.of(context).viewInsets.bottom +
            MediaQuery.of(context).padding.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Handle ──────────────────────────────────────────────────────
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.borderMid,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          // ── Header badges ────────────────────────────────────────────────
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.accentSubtle,
                  borderRadius: BorderRadius.circular(AppRadius.chip),
                  border: Border.all(color: AppColors.accentDim),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.link_rounded,
                        size: 10, color: AppColors.accent),
                    const SizedBox(width: 4),
                    Text(
                      'CHAIN QUEST',
                      style: AppTypography.unboundedBold(9, AppColors.accent)
                          .copyWith(letterSpacing: 1.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.bgElevated,
                  borderRadius: BorderRadius.circular(AppRadius.chip),
                  border: Border.all(color: AppColors.borderMid),
                ),
                child: Text(
                  '$stepsLabel · ${offer.category.toUpperCase()}',
                  style: AppTypography.unboundedBold(9, AppColors.textMuted)
                      .copyWith(letterSpacing: 0.5),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          Text(
            offer.title,
            style: AppTypography.unboundedBlack(18, AppColors.textPrimary),
          ),
          const SizedBox(height: AppSpacing.md),

          Text(
            offer.description,
            style: AppTypography.outfitMedium(14, AppColors.textPrimary),
          ),

          if (offer.hint != null && offer.hint!.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.md),
            Container(
              padding: const EdgeInsets.only(left: 14),
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(color: AppColors.accentDim, width: 2),
                ),
              ),
              child: Text(
                offer.hint!,
                style: AppTypography.outfitMedium(13, AppColors.textMuted),
              ),
            ),
          ],

          const SizedBox(height: AppSpacing.xl),

          // ── Step indicators ───────────────────────────────────────────────
          Row(
            children: [
              const Icon(Icons.access_time, size: 14, color: AppColors.textMuted),
              const SizedBox(width: 6),
              Text(
                '$stepsLabel · 48 hours per step',
                style: AppTypography.outfitSemiBold(13, AppColors.textMuted),
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.md),

          // Step progress dots
          Row(
            children: List.generate(total * 2 - 1, (i) {
              if (i.isEven) {
                final step = i ~/ 2;
                final isFirst = step == 0;
                return Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: isFirst ? AppColors.accent : AppColors.bgElevated,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isFirst ? AppColors.accent : AppColors.borderMid,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${step + 1}',
                      style: AppTypography.unboundedBold(
                        10,
                        isFirst ? AppColors.textInverse : AppColors.textMuted,
                      ),
                    ),
                  ),
                );
              }
              return Expanded(
                child: Container(
                  height: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  color: AppColors.borderMid,
                ),
              );
            }),
          ),

          const SizedBox(height: AppSpacing.xxl),

          // ── Actions ──────────────────────────────────────────────────────
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                foregroundColor: AppColors.textInverse,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppRadius.button)),
                ),
                elevation: 0,
              ),
              onPressed: () {
                Navigator.pop(context);
                onAccept();
              },
              child: Text('Start the Chain', style: AppTypography.ctaButton),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.textDisabled,
                side: const BorderSide(color: AppColors.borderMid),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppRadius.button)),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                onDecline();
              },
              child: Text(
                'Not now',
                style: AppTypography.unboundedBold(12, AppColors.textDisabled),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
