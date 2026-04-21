import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_bar_main.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/break_state_card.dart';
import '../../../../core/widgets/challenge_quest_card.dart';
import '../../../../core/widgets/quest_display_card.dart';
import '../../../../core/widgets/streak_card.dart';
import '../../../../core/widgets/section_header.dart';
import '../../controllers/home_controller.dart';
import '../../../quests/controllers/quests_controller_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController? _homeController;
  final _scrollController = ScrollController();
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      final questsController = QuestsControllerProvider.of(context);
      _homeController = HomeController(questsController);
      _initialized = true;
    }
  }

  @override
  void dispose() {
    _homeController?.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeCtrl = _homeController;
    if (homeCtrl == null) return const SizedBox.shrink();

    final questsCtrl = QuestsControllerProvider.of(context);

    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: Column(
          children: [
            AppBarMain(scrollController: _scrollController),
            Expanded(
              child: ListenableBuilder(
                listenable: homeCtrl,
                builder: (context, _) {
                  final activeQuest = questsCtrl.activeQuest;
                  return SingleChildScrollView(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.screenPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ── Active quest / break state ───────────────────────
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 350),
                          transitionBuilder: (child, animation) =>
                              FadeTransition(
                            opacity: animation,
                            child: ScaleTransition(
                              scale: Tween(begin: 0.95, end: 1.0).animate(
                                CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeOutBack,
                                ),
                              ),
                              child: child,
                            ),
                          ),
                          child: questsCtrl.isBreakActive
                              ? BreakStateCard(
                                  key: const ValueKey('break'),
                                  onEndEarly: questsCtrl.endBreakEarly,
                                )
                              : activeQuest == null
                                  ? const SizedBox.shrink()
                                  : QuestDisplayCard(
                                      key: ValueKey(activeQuest.id),
                                      questTitle: activeQuest.title,
                                      description: activeQuest.description,
                                      expiresAt: activeQuest.expiresAt,
                                      category: activeQuest.category,
                                      questsInCategory: homeCtrl
                                              .categoryQuestCounts[
                                                  activeQuest.category] ??
                                          0,
                                      assignedByAltrr:
                                          activeQuest.assignedByAltrr,
                                      onComplete: () async {
                                        final quest = questsCtrl.activeQuest;
                                        if (quest == null) return;
                                        final saved =
                                            await context.push<bool>(
                                          '/submit',
                                          extra: quest,
                                        );
                                        if (saved == true)
                                          questsCtrl.completeQuest();
                                      },
                                      onSkip: questsCtrl.skipQuest,
                                    ),
                        ),
                        // ── Active challenge quest ───────────────────────────
                        if (questsCtrl.activeChallengeQuest != null) ...[
                          const SizedBox(height: AppSpacing.sectionGap),
                          const SectionHeader(label: 'YOUR CHALLENGE'),
                          const SizedBox(height: AppSpacing.itemGap),
                          ChallengeQuestCard(
                            key: ValueKey(
                                'challenge-${questsCtrl.activeChallengeQuest!.id}'),
                            questTitle:
                                questsCtrl.activeChallengeQuest!.title,
                            description:
                                questsCtrl.activeChallengeQuest!.description,
                            category:
                                questsCtrl.activeChallengeQuest!.category,
                            expiresAt:
                                questsCtrl.activeChallengeQuest!.expiresAt,
                            onTap: () async {
                              final result = await context.push<String>(
                                '/challenge',
                                extra: questsCtrl.activeChallengeQuest,
                              );
                              if (result == 'complete') questsCtrl.completeChallenge();
                              if (result == 'abandon') questsCtrl.abandonChallenge();
                            },
                          ),
                        ],

                        const SizedBox(height: AppSpacing.sectionGap),

                        // ── THIS WEEK streak ─────────────────────────────────
                        const SectionHeader(label: 'THIS WEEK'),
                        const SizedBox(height: AppSpacing.itemGap),
                        GestureDetector(
                          onTap: () => context.push('/streak'),
                          child: StreakCard(
                            streakCount: homeCtrl.streakCount,
                            days: homeCtrl.streakDays,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sectionGap),

                        // ── STATS ────────────────────────────────────────────
                        const SectionHeader(label: 'YOUR PROGRESS'),
                        const SizedBox(height: AppSpacing.itemGap),
                        _StatsAccessCard(
                          onTap: () => context.push('/stats'),
                        ),
                        const SizedBox(height: AppSpacing.sectionGap),
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

// ── Stats access card ──────────────────────────────────────────────────────────

class _StatsAccessCard extends StatelessWidget {
  final VoidCallback onTap;
  const _StatsAccessCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.accentSubtle,
                borderRadius: BorderRadius.circular(AppRadius.icon),
              ),
              child: const Icon(
                Icons.show_chart_rounded,
                color: AppColors.accent,
                size: 22,
              ),
            ),
            const SizedBox(width: AppSpacing.lg),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'See how far you\'ve come.',
                    style: AppTypography.unboundedBold(12, AppColors.textPrimary),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Quests, streaks, and growth — all in one place.',
                    style: AppTypography.outfitMedium(12, AppColors.textMuted),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

