import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/data/quest_categories.dart';

class CategoriesPage extends StatelessWidget {
  final List<QuestCategory> categories;
  final Set<String> selected;
  final ValueChanged<String> onToggle;

  const CategoriesPage({
    super.key,
    required this.categories,
    required this.selected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),
          Text('What interests\nyou?',
              style: AppTypography.unboundedBlack(24, AppColors.textPrimary)),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Altrr starts here — then takes you further.',
            style: AppTypography.outfitMedium(13, AppColors.textMuted),
          ),
          const SizedBox(height: AppSpacing.xxl),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: AppSpacing.md,
              crossAxisSpacing: AppSpacing.md,
              childAspectRatio: 2.6,
              physics: const NeverScrollableScrollPhysics(),
              children: categories.map((c) {
                final isOn = selected.contains(c.key);
                return GestureDetector(
                  onTap: () => onToggle(c.key),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    decoration: BoxDecoration(
                      color:
                          isOn ? AppColors.accentSubtle : AppColors.bgSurface,
                      borderRadius: BorderRadius.circular(AppRadius.button),
                      border: Border.all(
                        color: isOn ? AppColors.accent : AppColors.borderMid,
                        width: isOn ? 1.5 : 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          c.icon,
                          size: 18,
                          color: isOn ? AppColors.accent : AppColors.textMuted,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          c.label,
                          style: isOn
                              ? AppTypography.unboundedBold(11, AppColors.accent)
                              : AppTypography.unboundedBold(
                                  11, AppColors.textMuted),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
