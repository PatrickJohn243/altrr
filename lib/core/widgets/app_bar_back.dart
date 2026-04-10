import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';

/// Back app bar — used on profile and sub-screens.
class AppBarBack extends StatelessWidget {
  final VoidCallback? onBack;

  const AppBarBack({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenPadding,
        vertical: AppSpacing.lg,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack ?? () => Navigator.of(context).pop(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: const BoxDecoration(
                color: AppColors.bgSurface,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.fromBorderSide(
                  BorderSide(color: AppColors.borderSubtle),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.arrow_back_ios_new,
                    size: 12,
                    color: AppColors.textDisabled,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text('Back',
              style: AppTypography.outfitMedium(12, AppColors.textDisabled)),
        ],
      ),
    );
  }
}
