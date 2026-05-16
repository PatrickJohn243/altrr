import 'dart:async';
import 'package:flutter/material.dart';
import '../../shared/data/quest_categories.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';

/// Compact card for the active challenge quest.
/// Sits under the YOUR CHALLENGE section header on Home and Quests screens.
class ChallengeQuestCard extends StatefulWidget {
  final String questTitle;
  final String description;
  final String category;
  final DateTime expiresAt;
  final VoidCallback onTap;

  const ChallengeQuestCard({
    super.key,
    required this.questTitle,
    required this.description,
    required this.category,
    required this.expiresAt,
    required this.onTap,
  });

  @override
  State<ChallengeQuestCard> createState() => _ChallengeQuestCardState();
}

class _ChallengeQuestCardState extends State<ChallengeQuestCard> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 60), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _remainingText {
    final remaining = widget.expiresAt.difference(DateTime.now());
    if (remaining.isNegative) return 'Expired';
    final d = remaining.inDays;
    final h = remaining.inHours % 24;
    if (d >= 1) return '$d day${d != 1 ? 's' : ''} ${h}h';
    if (h >= 1) return '${h}h ${remaining.inMinutes % 60}m';
    return '${remaining.inMinutes}m';
  }

  bool get _isExpiringSoon {
    final remaining = widget.expiresAt.difference(DateTime.now());
    return !remaining.isNegative && remaining.inHours < 6;
  }

  @override
  Widget build(BuildContext context) {
    final categoryIcon = QuestCategories.iconFor(widget.category);
    final categoryLabel = QuestCategories.labelFor(widget.category);

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.cardPaddingMd),
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(AppRadius.card),
          border: const Border(
            top: BorderSide(color: AppColors.borderSubtle),
            left: BorderSide(color: AppColors.borderSubtle),
            right: BorderSide(color: AppColors.borderSubtle),
            bottom: BorderSide(color: AppColors.borderSubtle, width: 3),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ── Category icon ──────────────────────────────────────────────
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.accentSubtle,
                borderRadius: BorderRadius.circular(AppRadius.icon),
              ),
              child: Icon(
                categoryIcon,
                size: 20,
                color: AppColors.accent,
              ),
            ),
            const SizedBox(width: AppSpacing.md),

            // ── Title + category ───────────────────────────────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.questTitle,
                    style: AppTypography.unboundedBold(
                        11, AppColors.textPrimary),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    categoryLabel,
                    style: AppTypography.outfitMedium(
                        11, AppColors.textMuted),
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.sm),

            // ── Time remaining ─────────────────────────────────────────────
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.access_time,
                  size: 11,
                  color: _isExpiringSoon
                      ? AppColors.accent
                      : AppColors.textMuted,
                ),
                const SizedBox(height: 2),
                Text(
                  _remainingText,
                  style: AppTypography.outfitSemiBold(
                    10,
                    _isExpiringSoon
                        ? AppColors.accent
                        : AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
