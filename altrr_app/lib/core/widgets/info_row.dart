import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool accent;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    this.accent = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: AppTypography.unboundedBold(9, AppColors.textMuted)
              .copyWith(letterSpacing: 0.8),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Container(height: 1, color: AppColors.borderSubtle),
        ),
        const SizedBox(width: AppSpacing.md),
        Text(
          value,
          style: AppTypography.outfitSemiBold(
            11,
            accent ? AppColors.accent : AppColors.textMuted,
          ),
        ),
      ],
    );
  }
}
