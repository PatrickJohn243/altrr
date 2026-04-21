import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/models/quest.dart';

/// Bottom sheet that presents a challenge quest offer for user acceptance.
class ChallengeOfferSheet extends StatefulWidget {
  final Quest offer;
  final ValueChanged<int> onAccept;
  final VoidCallback onDecline;

  const ChallengeOfferSheet._({
    required this.offer,
    required this.onAccept,
    required this.onDecline,
  });

  static Future<void> show(
    BuildContext context, {
    required Quest offer,
    required ValueChanged<int> onAccept,
    required VoidCallback onDecline,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => ChallengeOfferSheet._(
        offer: offer,
        onAccept: onAccept,
        onDecline: onDecline,
      ),
    );
  }

  @override
  State<ChallengeOfferSheet> createState() => _ChallengeOfferSheetState();
}

class _ChallengeOfferSheetState extends State<ChallengeOfferSheet> {
  static const _durationOptions = [1, 2, 3, 5, 7];
  int _selectedDays = 3;

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

          // ── Header ──────────────────────────────────────────────────────
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
                    const Icon(Icons.flag_rounded,
                        size: 10, color: AppColors.accent),
                    const SizedBox(width: 4),
                    Text(
                      'CHALLENGE',
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
                  widget.offer.category.toUpperCase(),
                  style: AppTypography.unboundedBold(9, AppColors.textMuted)
                      .copyWith(letterSpacing: 0.5),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          Text(
            widget.offer.title,
            style: AppTypography.unboundedBlack(18, AppColors.textPrimary),
          ),
          const SizedBox(height: AppSpacing.md),

          // ── Description ──────────────────────────────────────────────────
          Text(
            widget.offer.description,
            style: AppTypography.outfitMedium(14, AppColors.textPrimary),
          ),

          if (widget.offer.hint != null && widget.offer.hint!.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.md),
            Container(
              padding: const EdgeInsets.only(left: 14),
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(color: AppColors.accentDim, width: 2),
                ),
              ),
              child: Text(
                widget.offer.hint!,
                style: AppTypography.outfitMedium(13, AppColors.textMuted),
              ),
            ),
          ],

          const SizedBox(height: AppSpacing.xl),

          // ── Duration picker ───────────────────────────────────────────────
          Text(
            'HOW LONG DO YOU WANT?',
            style: AppTypography.unboundedBold(9, AppColors.textMuted)
                .copyWith(letterSpacing: 1.0),
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: _durationOptions.map((days) {
              final selected = days == _selectedDays;
              return Padding(
                padding: const EdgeInsets.only(right: AppSpacing.sm),
                child: GestureDetector(
                  onTap: () => setState(() => _selectedDays = days),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: selected
                          ? AppColors.accent
                          : AppColors.bgElevated,
                      borderRadius:
                          BorderRadius.circular(AppRadius.button),
                      border: Border.all(
                        color: selected
                            ? AppColors.accent
                            : AppColors.borderMid,
                      ),
                    ),
                    child: Text(
                      days == 1 ? '1 day' : '$days days',
                      style: AppTypography.unboundedBold(
                        10,
                        selected
                            ? AppColors.textInverse
                            : AppColors.textMuted,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
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
                widget.onAccept(_selectedDays);
              },
              child: Text('Take the Challenge', style: AppTypography.ctaButton),
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
                widget.onDecline();
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
