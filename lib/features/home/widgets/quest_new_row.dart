import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/badge.dart';

class QuestNewRow extends StatelessWidget {
  final IconData icon;
  final String category;
  final String questTitle;
  final bool isNew;

  const QuestNewRow({
    super.key,
    required this.icon,
    required this.category,
    required this.questTitle,
    required this.isNew,
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
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.cardPaddingMd),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: AppColors.borderSubtle,
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppRadius.icon)),
                ),
                child: Icon(icon, size: 18, color: AppColors.textMuted),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.toUpperCase(),
                      style: AppTypography.categoryLabel,
                    ),
                    const SizedBox(height: 2),
                    Text(questTitle, style: AppTypography.cardTitle),
                  ],
                ),
              ),
              if (isNew) AppBadge.newLabel(),
            ],
          ),
        ),
      ),
    );
  }
}
