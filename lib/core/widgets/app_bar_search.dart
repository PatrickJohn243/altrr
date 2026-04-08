import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';

class AppBarSearch extends StatelessWidget {
  final String hint;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const AppBarSearch({
    super.key,
    this.hint = 'Search quests...',
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenPadding,
        vertical: AppSpacing.lg,
      ),
      child: Container(
        height: 44,
        decoration: const BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.card)),
          border: Border.fromBorderSide(BorderSide(color: AppColors.borderSubtle)),
        ),
        child: Row(
          children: [
            const SizedBox(width: AppSpacing.cardPaddingMd),
            const Icon(Icons.search, color: AppColors.textMuted, size: 18),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                style: AppTypography.outfitMedium(14, AppColors.textPrimary),
                cursorColor: AppColors.accent,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: AppTypography.outfitMedium(14, AppColors.textMuted),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.cardPaddingMd),
          ],
        ),
      ),
    );
  }
}
