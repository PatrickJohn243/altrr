import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/quest_row_card.dart';
import '../../../core/widgets/section_header.dart';
import '../controllers/history_controller.dart';

class DateSectionWidget extends StatelessWidget {
  final HistorySection section;

  const DateSectionWidget({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(label: section.label),
        const SizedBox(height: AppSpacing.itemGap),
        ...section.quests.map((entry) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.itemGap),
              child: QuestRowCard(
                icon: Icon(entry.icon, size: 18, color: AppColors.textMuted),
                category: entry.category,
                questTitle: entry.title,
                date: entry.date,
                onTap: () => context.push('/quest', extra: entry.quest),
              ),
            )),
        const SizedBox(height: AppSpacing.sm),
      ],
    );
  }
}
