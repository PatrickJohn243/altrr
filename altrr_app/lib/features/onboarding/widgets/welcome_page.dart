import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';

class WelcomePage extends StatelessWidget {
  final VoidCallback onNext;
  const WelcomePage({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(AppRadius.icon),
            ),
            child: const Icon(
              Icons.bolt,
              color: AppColors.textInverse,
              size: 32,
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
          Text('Welcome to\nAltrr.',
              style: AppTypography.unboundedBlack(28, AppColors.textPrimary)),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Altrr assigns you quests — you don\'t pick them.\nComplete them, earn titles, build your streak.',
            style: AppTypography.outfitMedium(14, AppColors.textMuted),
          ),
          const SizedBox(height: AppSpacing.xxl),
          const _FeatureRow(
              icon: Icons.task_alt, text: 'Daily quests assigned to you'),
          const SizedBox(height: AppSpacing.md),
          const _FeatureRow(
              icon: Icons.local_fire_department, text: 'Streak tracking'),
          const SizedBox(height: AppSpacing.md),
          const _FeatureRow(
              icon: Icons.workspace_premium, text: 'Earn titles as you grow'),
        ],
      ),
    );
  }
}

class _FeatureRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const _FeatureRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.accentSubtle,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 16, color: AppColors.accent),
        ),
        const SizedBox(width: AppSpacing.md),
        Text(text,
            style: AppTypography.outfitSemiBold(13, AppColors.textPrimary)),
      ],
    );
  }
}
