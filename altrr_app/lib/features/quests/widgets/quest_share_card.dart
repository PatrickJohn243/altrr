import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/data/quest_categories.dart';

class QuestShareCard extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final DateTime completedAt;
  final String? timeSpent;
  final String? where;
  final List<String> emotions;

  const QuestShareCard({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    required this.completedAt,
    this.timeSpent,
    this.where,
    this.emotions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Transparent outer padding → shows as empty space in PNG
      color: Colors.transparent,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Lime header ──────────────────────────────────────────────────
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 22),
            decoration: const BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(AppRadius.card),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0x1A121212),
                    borderRadius: BorderRadius.circular(AppRadius.chip),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        QuestCategories.iconFor(category),
                        size: 10,
                        color: AppColors.questCardTextMuted,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        category.toUpperCase(),
                        style: AppTypography.unboundedBold(8, AppColors.questCardTextMuted)
                            .copyWith(letterSpacing: 0.8),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                // Quest title
                Text(
                  title,
                  style: AppTypography.unboundedBlack(20, AppColors.textInverse),
                ),
                const SizedBox(height: 8),
                // Description
                Text(
                  description,
                  style: AppTypography.outfitMedium(13, AppColors.questCardTextMuted),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // ── Dark body ────────────────────────────────────────────────────
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: AppColors.bgSurface,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(AppRadius.card),
              ),
              border: Border(
                left: BorderSide(color: AppColors.borderSubtle),
                right: BorderSide(color: AppColors.borderSubtle),
                bottom: BorderSide(color: AppColors.borderSubtle, width: 3),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Completion row
                Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: const BoxDecoration(
                        color: AppColors.accentSubtle,
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppRadius.icon)),
                      ),
                      child: const Icon(
                        Icons.check_rounded,
                        size: 14,
                        color: AppColors.accent,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'COMPLETED',
                          style: AppTypography.unboundedBold(8, AppColors.textMuted)
                              .copyWith(letterSpacing: 0.8),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          _formatDate(completedAt),
                          style: AppTypography.outfitSemiBold(12, AppColors.accent),
                        ),
                      ],
                    ),
                  ],
                ),

                // Time + where
                if (timeSpent != null || where != null) ...[
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      if (timeSpent != null) ...[
                        const Icon(Icons.timer_outlined,
                            size: 13, color: AppColors.textMuted),
                        const SizedBox(width: 5),
                        Text(
                          timeSpent!,
                          style: AppTypography.outfitMedium(12, AppColors.textMuted),
                        ),
                      ],
                      if (timeSpent != null && where != null)
                        const SizedBox(width: 16),
                      if (where != null) ...[
                        const Icon(Icons.location_on_outlined,
                            size: 13, color: AppColors.textMuted),
                        const SizedBox(width: 5),
                        Text(
                          where!,
                          style: AppTypography.outfitMedium(12, AppColors.textMuted),
                        ),
                      ],
                    ],
                  ),
                ],

                // Emotions
                if (emotions.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: emotions.map((e) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.accentSubtle,
                        borderRadius: BorderRadius.circular(AppRadius.chip),
                        border: Border.all(color: AppColors.accentDim),
                      ),
                      child: Text(
                        e,
                        style: AppTypography.outfitMedium(11, AppColors.accent),
                      ),
                    )).toList(),
                  ),
                ],

                // Branding
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'altrr',
                      style: AppTypography.unboundedBold(10, AppColors.textMuted)
                          .copyWith(letterSpacing: 1.2),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime dt) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
  }
}
