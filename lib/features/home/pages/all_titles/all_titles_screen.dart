import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_bar_back.dart';
import '../../../../core/widgets/title_row_card.dart';
import '../../../../shared/models/earned_title.dart';
import '../../controllers/all_titles_controller.dart';
import '../../widgets/titles_empty_state.dart';
import '../../../quests/widgets/title_earned_sheet.dart';

class AllTitlesScreen extends StatefulWidget {
  final String? initialCategory;
  const AllTitlesScreen({super.key, this.initialCategory});

  @override
  State<AllTitlesScreen> createState() => _AllTitlesScreenState();
}

class _AllTitlesScreenState extends State<AllTitlesScreen> {
  late final AllTitlesController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AllTitlesController(initialCategory: widget.initialCategory);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarBack(),

            // ── Screen title + count ───────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenPadding,
              ),
              child: ListenableBuilder(
                listenable: _controller,
                builder: (context, _) => Text(
                  'YOUR TITLES',
                  style:
                      AppTypography.unboundedBlack(22, AppColors.textPrimary),
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // ── Search bar ─────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenPadding,
              ),
              child: Container(
                height: 44,
                decoration: const BoxDecoration(
                  color: AppColors.bgSurface,
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppRadius.card)),
                  border: Border.fromBorderSide(
                    BorderSide(color: AppColors.borderSubtle),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: AppSpacing.cardPaddingMd),
                    const Icon(Icons.search,
                        color: AppColors.textMuted, size: 18),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: TextField(
                        controller: _controller.searchController,
                        onChanged: _controller.onSearchChanged,
                        style: AppTypography.outfitMedium(
                            14, AppColors.textPrimary),
                        cursorColor: AppColors.accent,
                        decoration: InputDecoration(
                          hintText: 'Search titles...',
                          hintStyle: AppTypography.outfitMedium(
                              14, AppColors.textMuted),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.cardPaddingMd),
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.md),

            // ── Filter chips ───────────────────────────────────────────────
            ListenableBuilder(
              listenable: _controller,
              builder: (context, _) => SizedBox(
                height: 34,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenPadding,
                  ),
                  children: [
                    // Active category chip (shown when navigated from category card)
                    if (_controller.categoryFilter != null) ...[
                      GestureDetector(
                        onTap: _controller.clearCategoryFilter,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.accentSubtle,
                            borderRadius: BorderRadius.circular(AppRadius.chip),
                            border: Border.all(color: AppColors.accentDim),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _controller.categoryFilter!.toUpperCase(),
                                style: AppTypography.unboundedBold(
                                    10, AppColors.accent),
                              ),
                              const SizedBox(width: 6),
                              const Icon(Icons.close,
                                  size: 10, color: AppColors.accent),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                    ],
                    // Type filter chips
                    ...TitleFilter.values.map((f) {
                      final isActive = _controller.filter == f;
                      return Padding(
                        padding: const EdgeInsets.only(right: AppSpacing.sm),
                        child: GestureDetector(
                          onTap: () => _controller.onFilterChanged(f),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              color: isActive
                                  ? AppColors.accent
                                  : AppColors.bgSurface,
                              borderRadius:
                                  BorderRadius.circular(AppRadius.chip),
                              border: Border.all(
                                color: isActive
                                    ? AppColors.accent
                                    : AppColors.borderMid,
                              ),
                            ),
                            child: Text(
                              f.label,
                              style: AppTypography.unboundedBold(
                                10,
                                isActive
                                    ? AppColors.textInverse
                                    : AppColors.textMuted,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // ── List ───────────────────────────────────────────────────────
            Expanded(
              child: ListenableBuilder(
                listenable: _controller,
                builder: (context, _) {
                  final titles = _controller.filtered;
                  if (titles.isEmpty) {
                    return RefreshIndicator(
                      color: AppColors.accent,
                      backgroundColor: AppColors.bgSurface,
                      displacement: 24,
                      onRefresh: _controller.reload,
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: TitlesEmptyState(query: _controller.query),
                        ),
                      ),
                    );
                  }
                  return RefreshIndicator(
                    color: AppColors.accent,
                    backgroundColor: AppColors.bgSurface,
                    onRefresh: _controller.reload,
                    child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(
                        left: AppSpacing.screenPadding,
                        right: AppSpacing.screenPadding,
                        bottom: AppSpacing.xxl,
                      ),
                      itemCount: titles.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: AppSpacing.sm),
                      itemBuilder: (context, i) {
                        final t = titles[i];
                        return TitleRowCard(
                          icon: Icon(
                            _iconForTitle(t),
                            size: 18,
                            color: AppColors.textMuted,
                          ),
                          titleName: t.titleText,
                          subtitle: _formatDate(t.earnedAt),
                          isNew: !t.isSeen,
                          onTap: () =>
                              TitleEarnedSheet.show(context, titles: [t]),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Helpers ────────────────────────────────────────────────────────────────

  IconData _iconForTitle(EarnedTitle t) {
    if (t.condition == TitleCondition.gacha) return Icons.auto_awesome;
    if (t.condition == TitleCondition.timeBased) {
      return _iconForConditionTag(t.conditionTag ?? '');
    }
    return _iconForCategory(t.category ?? '');
  }

  IconData _iconForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'physical':
        return Icons.fitness_center;
      case 'mental':
        return Icons.psychology;
      case 'social':
        return Icons.people;
      case 'cooking':
        return Icons.restaurant;
      case 'learning':
        return Icons.school;
      case 'explore':
        return Icons.travel_explore;
      case 'hobby':
        return Icons.palette;
      case 'reflection':
        return Icons.self_improvement;
      default:
        return Icons.star_outline;
    }
  }

  IconData _iconForConditionTag(String tag) {
    switch (tag) {
      case 'quickDraw':
        return Icons.bolt;
      case 'earlyBird':
        return Icons.wb_sunny_outlined;
      case 'nightOwl':
        return Icons.nightlight_round;
      case 'comeback':
        return Icons.replay;
      case 'dailyBurst':
        return Icons.local_fire_department;
      case 'weekStreak':
      case 'monthStreak':
        return Icons.calendar_today_outlined;
      case 'cleanRun':
        return Icons.check_circle_outline;
      case 'speedMilestone':
        return Icons.speed;
      default:
        return Icons.timer_outlined;
    }
  }

  String _formatDate(DateTime dt) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[dt.month - 1]} ${dt.day}';
  }
}
