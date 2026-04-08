import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';

/// Dark list row for a earned title — icon + title/subtitle + optional NEW badge.
class TitleRowCard extends StatelessWidget {
  final Widget icon;
  final String titleName;
  final String subtitle;
  final bool isNew;

  const TitleRowCard({
    super.key,
    required this.icon,
    required this.titleName,
    required this.subtitle,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: const BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.card)),
        border: Border(
          top: BorderSide(color: AppColors.borderSubtle),
          left: BorderSide(color: AppColors.borderSubtle),
          right: BorderSide(color: AppColors.borderSubtle),
          bottom: BorderSide(color: AppColors.borderSubtle, width: 3),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(AppRadius.card)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.cardPaddingMd),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: AppColors.borderSubtle,
                  borderRadius: BorderRadius.all(Radius.circular(AppRadius.icon)),
                ),
                child: Center(child: icon),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(titleName, style: AppTypography.cardTitle),
                    const SizedBox(height: 2),
                    Text(subtitle, style: AppTypography.bodyMedium),
                  ],
                ),
              ),
              if (isNew) ...[
                const SizedBox(width: AppSpacing.sm),
                _NewBadge(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _NewBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 37,
      height: 13,
      decoration: const BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.chip)),
      ),
      alignment: Alignment.center,
      child: Text(
        'NEW',
        style: AppTypography.unboundedBlack(8, AppColors.textInverse),
      ),
    );
  }
}
