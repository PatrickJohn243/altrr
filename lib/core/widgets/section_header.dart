import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';

class SectionHeader extends StatelessWidget {
  final String label;
  final VoidCallback? seeAll;

  const SectionHeader({super.key, required this.label, this.seeAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: AppTypography.sectionLabel),
        const SizedBox(width: AppSpacing.md),
        const Expanded(
          child: Divider(color: AppColors.borderSubtle, thickness: 1),
        ),
        if (seeAll != null) ...[
          const SizedBox(width: AppSpacing.md),
          GestureDetector(
            onTap: seeAll,
            child: Text(
              'SEE ALL',
              style: AppTypography.unboundedBold(12, AppColors.accent)
                  .copyWith(letterSpacing: 1.26),
            ),
          ),
        ],
      ],
    );
  }
}
