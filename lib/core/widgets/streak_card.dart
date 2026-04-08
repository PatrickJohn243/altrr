import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';

enum DayStatus { completed, current, missed, empty }

class StreakDay {
  final String label;
  final DayStatus status;

  const StreakDay({required this.label, required this.status});
}

/// Weekly streak bar chart card — M T W T F S S bars with flame + count.
class StreakCard extends StatelessWidget {
  final List<StreakDay> days;
  final int streakCount;

  const StreakCard({
    super.key,
    required this.days,
    required this.streakCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.cardPadding),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: "Keep it up!" + streak count
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Keep it up!',
                style: AppTypography.unboundedExtraBold(12, AppColors.textPrimary),
              ),
              Row(
                children: [
                  const Text('🔥', style: TextStyle(fontSize: 12)),
                  const SizedBox(width: 4),
                  Text(
                    '$streakCount day streak',
                    style: AppTypography.outfitSemiBold(12, AppColors.accent),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          // Bars
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: days.map((day) => _DayBar(day: day)).toList(),
          ),
        ],
      ),
    );
  }
}

class _DayBar extends StatelessWidget {
  final StreakDay day;

  const _DayBar({required this.day});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _Bar(status: day.status),
        const SizedBox(height: 6),
        Text(day.label, style: AppTypography.caption),
      ],
    );
  }
}

class _Bar extends StatelessWidget {
  final DayStatus status;

  const _Bar({required this.status});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case DayStatus.completed:
        return Container(
          width: 28,
          height: 28,
          decoration: const BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        );
      case DayStatus.current:
        return Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: AppColors.accentDim, width: 1.5),
          ),
        );
      case DayStatus.missed:
      case DayStatus.empty:
        return Container(
          width: 28,
          height: 28,
          decoration: const BoxDecoration(
            color: AppColors.bgEmpty,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        );
    }
  }
}
