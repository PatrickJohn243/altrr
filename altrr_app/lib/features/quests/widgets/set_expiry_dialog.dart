import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../controllers/quests_controller.dart';

void showSetExpiryDialog(BuildContext context, QuestsController controller) {
  final textController = TextEditingController(text: '10');
  showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      backgroundColor: AppColors.bgSurface,
      title: Text(
        'Set expiry (debug)',
        style: AppTypography.unboundedBold(13, AppColors.textPrimary),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [5, 10, 30, 60].map((s) {
              return GestureDetector(
                onTap: () {
                  controller.debugSetExpiry(s);
                  Navigator.pop(dialogContext);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.bgElevated,
                    borderRadius: BorderRadius.circular(AppRadius.button),
                    border: Border.all(color: AppColors.borderMid),
                  ),
                  child: Text(
                    '${s}s',
                    style:
                        AppTypography.unboundedBold(10, AppColors.textPrimary),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: textController,
            keyboardType: TextInputType.number,
            style: AppTypography.outfitMedium(14, AppColors.textPrimary),
            cursorColor: AppColors.accent,
            decoration: InputDecoration(
              hintText: 'Custom seconds',
              hintStyle: AppTypography.outfitMedium(14, AppColors.textMuted),
              filled: true,
              fillColor: AppColors.bgElevated,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.button),
                borderSide: const BorderSide(color: AppColors.borderMid),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.button),
                borderSide: const BorderSide(color: AppColors.borderMid),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.button),
                borderSide:
                    const BorderSide(color: AppColors.accent, width: 1.5),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext),
          child: Text(
            'Cancel',
            style: AppTypography.outfitMedium(13, AppColors.textMuted),
          ),
        ),
        TextButton(
          onPressed: () {
            final s = int.tryParse(textController.text);
            if (s != null && s > 0) controller.debugSetExpiry(s);
            Navigator.pop(dialogContext);
          },
          child: Text(
            'Set',
            style: AppTypography.outfitMedium(13, AppColors.accent),
          ),
        ),
      ],
    ),
  );
}
