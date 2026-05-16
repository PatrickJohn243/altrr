import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../controllers/quests_controller.dart';

void showQuestTypeDialog(BuildContext context, QuestsController controller) {
  final types = [
    (
      label: 'Daily',
      color: AppColors.accent,
      action: () => controller.generateQuest(),
    ),
    (
      label: 'Chain · 2 Steps',
      color: Colors.cyan,
      action: () => controller.debugTriggerChainOffer(chainTotal: 2),
    ),
    (
      label: 'Chain · 3 Steps',
      color: Colors.cyan,
      action: () => controller.debugTriggerChainOffer(chainTotal: 3),
    ),
    (
      label: 'Challenge',
      color: Colors.orange,
      action: () => controller.debugTriggerChallengeOffer(),
    ),
  ];

  showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      backgroundColor: AppColors.bgSurface,
      title: Text(
        'Generate Quest Type',
        style: AppTypography.unboundedBold(13, AppColors.textPrimary),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: types.map((t) {
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: t.color,
                  side: BorderSide(color: t.color),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppRadius.button)),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(dialogContext);
                  t.action();
                },
                child: Text(
                  t.label,
                  style: AppTypography.unboundedBold(11, t.color),
                ),
              ),
            ),
          );
        }).toList(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext),
          child: Text(
            'Cancel',
            style: AppTypography.outfitMedium(13, AppColors.textMuted),
          ),
        ),
      ],
    ),
  );
}
