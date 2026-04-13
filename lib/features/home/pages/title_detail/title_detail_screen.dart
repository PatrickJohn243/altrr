import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_bar_back.dart';
import '../../../../shared/models/earned_title.dart';

class TitleDetailScreen extends StatelessWidget {
  final EarnedTitle title;

  const TitleDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: Column(
          children: [
            AppBarBack(onBack: () => context.pop()),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Lime header ──────────────────────────────────────────
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSpacing.cardPadding),
                      decoration: const BoxDecoration(
                        color: AppColors.accent,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(AppRadius.card),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Type label
                          Text(
                            _typeLabel(title).toUpperCase(),
                            style: AppTypography.unboundedBold(
                              9,
                              AppColors.questCardTextMuted,
                            ).copyWith(letterSpacing: 1.2),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          // Title text
                          Text(
                            title.titleText,
                            style: AppTypography.unboundedBlack(
                              26,
                              AppColors.textInverse,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // ── Dark body ────────────────────────────────────────────
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSpacing.cardPadding),
                      decoration: const BoxDecoration(
                        color: AppColors.bgSurface,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(AppRadius.card),
                        ),
                        border: Border(
                          left: BorderSide(color: AppColors.borderSubtle),
                          right: BorderSide(color: AppColors.borderSubtle),
                          bottom: BorderSide(
                            color: AppColors.borderSubtle,
                            width: 3,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Subtext
                          if (_subtext(title) != null) ...[
                            _buildSubtext(title),
                            const SizedBox(height: AppSpacing.lg),
                            const Divider(color: AppColors.borderSubtle),
                            const SizedBox(height: AppSpacing.md),
                          ],

                          // Earned date
                          _InfoRow(
                            label: 'EARNED',
                            value: _formatDate(title.earnedAt),
                            accent: true,
                          ),

                          // Tier (quest-count only)
                          if (title.condition == TitleCondition.questCount &&
                              title.tier != null) ...[
                            const SizedBox(height: AppSpacing.sm),
                            _InfoRow(
                              label: 'TIER',
                              value: 'T${title.tier}',
                            ),
                          ],

                          // Category
                          if (title.category != null) ...[
                            const SizedBox(height: AppSpacing.sm),
                            _InfoRow(
                              label: 'CATEGORY',
                              value: title.category!,
                            ),
                          ],

                          // Condition tag (time-based)
                          if (title.conditionTag != null) ...[
                            const SizedBox(height: AppSpacing.sm),
                            _InfoRow(
                              label: 'CONDITION',
                              value: _conditionTagLabel(title.conditionTag!),
                            ),
                          ],
                        ],
                      ),
                    ),

                    const SizedBox(height: AppSpacing.sectionGap),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Helpers ────────────────────────────────────────────────────────────────

  String _typeLabel(EarnedTitle t) {
    switch (t.condition) {
      case TitleCondition.questCount:
        return 'Quest Title';
      case TitleCondition.timeBased:
        return 'Time Title';
      case TitleCondition.gacha:
        return 'Chaos Title';
    }
  }

  Widget _buildSubtext(EarnedTitle t) {
    if (t.condition == TitleCondition.gacha && t.gachaSubtext != null) {
      return Text(
        t.gachaSubtext!,
        style: AppTypography.outfitMedium(15, AppColors.textMuted)
            .copyWith(fontStyle: FontStyle.italic),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (t.subtextA != null)
          Text(
            t.subtextA!,
            style: AppTypography.outfitMedium(15, AppColors.textMuted)
                .copyWith(fontStyle: FontStyle.italic),
          ),
        if (t.subtextA != null && t.subtextB != null)
          const SizedBox(height: AppSpacing.xs),
        if (t.subtextB != null)
          Text(
            t.subtextB!,
            style: AppTypography.outfitSemiBold(15, AppColors.textPrimary),
          ),
      ],
    );
  }

  String? _subtext(EarnedTitle t) {
    if (t.condition == TitleCondition.gacha) return t.gachaSubtext;
    if (t.subtextA != null) return t.subtextA;
    return t.subtextB;
  }

  String _conditionTagLabel(String tag) {
    switch (tag) {
      case 'quickDraw':      return 'Quick Draw';
      case 'earlyBird':      return 'Early Bird';
      case 'nightOwl':       return 'Night Owl';
      case 'comeback':       return 'Comeback';
      case 'dailyBurst':     return 'Daily Burst';
      case 'weekStreak':     return 'Week Streak';
      case 'monthStreak':    return 'Month Streak';
      case 'cleanRun':       return 'Clean Run';
      case 'speedMilestone': return 'Speed Run';
      default:               return tag;
    }
  }

  String _formatDate(DateTime dt) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
  }
}

// ── Info row ──────────────────────────────────────────────────────────────────

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool accent;

  const _InfoRow({
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
