import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_bar_back.dart';
import 'controllers/stats_controller.dart';
import 'controllers/stats_graph_controller.dart';
import 'widgets/quest_line_chart.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  late final StatsController _controller;
  late final StatsGraphController _graphController;
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = StatsController();
    _graphController = StatsGraphController();
    _pageController = PageController(viewportFraction: 0.65);
  }

  @override
  void dispose() {
    _controller.dispose();
    _graphController.dispose();
    _pageController.dispose();
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
            const AppBarBack(),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenPadding),
              child: Text(
                'YOUR STATS',
                style: AppTypography.unboundedBlack(22, AppColors.textPrimary),
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Expanded(
              child: ListenableBuilder(
                listenable: _controller,
                builder: (context, _) {
                  if (_controller.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.accent,
                        strokeWidth: 2,
                      ),
                    );
                  }

                  final stats = _controller.stats;
                  if (stats.isEmpty) return const SizedBox.shrink();
                  final n = stats.length;

                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ── Carousel ───────────────────────────────────────
                        SizedBox(
                          height: 190,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: n,
                            onPageChanged: (i) =>
                                setState(() => _currentPage = i),
                            itemBuilder: (context, i) {
                              return AnimatedBuilder(
                                animation: _pageController,
                                builder: (context, child) {
                                  double scale = i == 0 ? 1.0 : 0.80;
                                  if (_pageController.position.haveDimensions) {
                                    final page =
                                        _pageController.page ?? i.toDouble();
                                    final diff = (i - page).abs();
                                    scale =
                                        (1.0 - diff * 0.20).clamp(0.80, 1.0);
                                  }
                                  return Transform.scale(
                                    scale: scale,
                                    child: child,
                                  );
                                },
                                child: _StatCard(
                                  item: stats[i],
                                  isCenter: i == _currentPage,
                                ),
                              );
                            },
                          ),
                        ),

                        // ── Page dots ──────────────────────────────────────
                        const SizedBox(height: AppSpacing.md),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(n, (i) {
                            final active = i == _currentPage;
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              width: active ? 20 : 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: active
                                    ? AppColors.accent
                                    : AppColors.bgElevated,
                                borderRadius: BorderRadius.circular(3),
                              ),
                            );
                          }),
                        ),

                        // ── Description ────────────────────────────────────
                        const SizedBox(height: AppSpacing.xxl),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.screenPadding),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 250),
                            transitionBuilder: (child, anim) => FadeTransition(
                              opacity: anim,
                              child: SlideTransition(
                                position: Tween(
                                  begin: const Offset(0, 0.08),
                                  end: Offset.zero,
                                ).animate(CurvedAnimation(
                                    parent: anim, curve: Curves.easeOut)),
                                child: child,
                              ),
                            ),
                            child: _DescriptionCard(
                              key: ValueKey(_currentPage),
                              item: stats[_currentPage.clamp(0, n - 1)],
                            ),
                          ),
                        ),

                        // ── Activity chart ─────────────────────────────────
                        const SizedBox(height: AppSpacing.xxl),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.screenPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('ACTIVITY',
                                      style: AppTypography.sectionLabel),
                                  const SizedBox(width: AppSpacing.md),
                                  const Expanded(
                                    child: Divider(
                                        color: AppColors.borderSubtle,
                                        thickness: 1),
                                  ),
                                ],
                              ),
                              const SizedBox(height: AppSpacing.lg),
                              ListenableBuilder(
                                listenable: _graphController,
                                builder: (context, _) => _ActivityCard(
                                  controller: _graphController,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: AppSpacing.xxl),
                      ],
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
}

// ── Stat carousel card ─────────────────────────────────────────────────────────

class _StatCard extends StatelessWidget {
  final StatItem item;
  final bool isCenter;
  const _StatCard({required this.item, required this.isCenter});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TweenAnimationBuilder<int>(
            key: ValueKey('${item.key}-$isCenter'),
            tween: IntTween(begin: 0, end: item.value),
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOut,
            builder: (_, v, __) => Text(
              '$v',
              style: AppTypography.unboundedBlack(
                52,
                isCenter ? AppColors.accent : AppColors.textMuted,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              item.label,
              style: AppTypography.outfitSemiBold(
                12,
                isCenter ? AppColors.textPrimary : AppColors.textMuted,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Description card ───────────────────────────────────────────────────────────

class _DescriptionCard extends StatelessWidget {
  final StatItem item;
  const _DescriptionCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.cardPadding),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.label.toUpperCase(),
            style: AppTypography.sectionLabel,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            item.description,
            style: AppTypography.outfitMedium(14, AppColors.textPrimary)
                .copyWith(height: 1.6),
          ),
        ],
      ),
    );
  }
}

// ── Activity card ──────────────────────────────────────────────────────────────

class _ActivityCard extends StatelessWidget {
  final StatsGraphController controller;
  const _ActivityCard({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.cardPadding),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('THIS WEEK', style: AppTypography.sectionLabel),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          SizedBox(
            height: 160,
            child: controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.accent,
                      strokeWidth: 2,
                    ),
                  )
                : QuestLineChart(
                    spots: controller.spots,
                    labels: controller.labels,
                    maxY: controller.maxY,
                  ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Quests completed per day',
            style: AppTypography.outfitMedium(10, AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}
