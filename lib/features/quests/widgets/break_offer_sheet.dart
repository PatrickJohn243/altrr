import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';

class BreakOfferSheet extends StatelessWidget {
  final VoidCallback onRest;
  final VoidCallback onKeepGoing;

  const BreakOfferSheet._({required this.onRest, required this.onKeepGoing});

  static Future<void> show(
    BuildContext context, {
    required VoidCallback onRest,
    required VoidCallback onKeepGoing,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => BreakOfferSheet._(onRest: onRest, onKeepGoing: onKeepGoing),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          // ── Handle ────────────────────────────────────────────────────────
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

          // ── Icon ──────────────────────────────────────────────────────────
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
          const SizedBox(height: AppSpacing.lg),

          // ── Headline ─────────────────────────────────────────────────────
          Text(
            'You seem tired.',
            style: AppTypography.unboundedBlack(18, AppColors.textPrimary),
          ),
          const SizedBox(height: AppSpacing.sm),

          // ── Body ──────────────────────────────────────────────────────────
          Text(
            'No judgment. Take today to rest — your streak is protected.',
            style: AppTypography.outfitMedium(14, AppColors.textMuted),
          ),
          const SizedBox(height: AppSpacing.xxl),

          // ── Actions ───────────────────────────────────────────────────────
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
                onRest();
              },
              child: Text('Rest today', style: AppTypography.ctaButton),
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
                onKeepGoing();
              },
              child: Text(
                'Keep going',
                style: AppTypography.unboundedBold(12, AppColors.textDisabled),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
