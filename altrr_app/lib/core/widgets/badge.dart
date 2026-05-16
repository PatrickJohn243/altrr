import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

class AppBadge extends StatelessWidget {
  final String label;
  final Color color;
  final Color textColor;
  final double fontSize;
  final Color? borderColor;

  const AppBadge({
    super.key,
    required this.label,
    required this.color,
    required this.textColor,
    this.fontSize = 8,
    this.borderColor,
  });

  // ── Presets ───────────────────────────────────────────────────────────────────

  factory AppBadge.newLabel() => const AppBadge(
        label: 'NEW',
        color: AppColors.accent,
        textColor: AppColors.textInverse,
      );

  factory AppBadge.active() => const AppBadge(
        label: 'ACTIVE',
        color: AppColors.accentSubtle,
        textColor: AppColors.accent,
      );

  factory AppBadge.completed() => const AppBadge(
        label: 'DONE',
        color: AppColors.bgElevated,
        textColor: AppColors.textMuted,
      );

  factory AppBadge.danger(String label) => AppBadge(
        label: label,
        color: AppColors.dangerDim,
        textColor: AppColors.danger,
      );

  factory AppBadge.ghost(String label) => AppBadge(
        label: label,
        color: Colors.transparent,
        textColor: AppColors.textDisabled,
        borderColor: AppColors.borderMid,
      );

  factory AppBadge.subtle(String label) => AppBadge(
        label: label,
        color: AppColors.bgElevated,
        textColor: AppColors.textPrimary,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(AppRadius.chip)),
        border: borderColor != null
            ? Border.all(color: borderColor!)
            : null,
      ),
      child: Text(
        label,
        style: AppTypography.unboundedBlack(fontSize, textColor),
      ),
    );
  }
}
