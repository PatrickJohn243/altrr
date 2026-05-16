import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';

class NamePage extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const NamePage({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),
          Text('What should\nwe call you?',
              style: AppTypography.unboundedBlack(24, AppColors.textPrimary)),
          const SizedBox(height: AppSpacing.sm),
          Text('This shows on your profile.',
              style: AppTypography.outfitMedium(13, AppColors.textMuted)),
          const SizedBox(height: AppSpacing.xxl),
          TextField(
            controller: controller,
            focusNode: focusNode,
            style: AppTypography.outfitSemiBold(16, AppColors.textPrimary),
            cursorColor: AppColors.accent,
            decoration: InputDecoration(
              hintText: 'Your name',
              hintStyle: AppTypography.outfitMedium(16, AppColors.textMuted),
              filled: true,
              fillColor: AppColors.bgSurface,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
    );
  }
}
