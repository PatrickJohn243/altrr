import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_typography.dart';
import '../../../../../core/widgets/streak_card.dart';
import '../../../../../shared/data/quest_categories.dart';

class DayColumn extends StatelessWidget {
  final StreakDay day;
  const DayColumn({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _box(),
        const SizedBox(height: 8),
        Text(
          day.label,
          style: AppTypography.outfitSemiBold(12, AppColors.textMuted),
        ),
      ],
    );
  }

  Widget _box() {
    switch (day.status) {
      case DayStatus.completed:
        return Container(
          width: 40,
          height: 44,
          decoration: const BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: day.category != null
              ? Icon(
                  QuestCategories.iconFor(day.category!),
                  size: 18,
                  color: AppColors.textInverse,
                )
              : null,
        );
      case DayStatus.current:
        return Container(
          width: 40,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: AppColors.accentDim, width: 1.5),
          ),
        );
      case DayStatus.missed:
      case DayStatus.empty:
        return Container(
          width: 40,
          height: 44,
          decoration: const BoxDecoration(
            color: AppColors.bgEmpty,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        );
    }
  }
}
