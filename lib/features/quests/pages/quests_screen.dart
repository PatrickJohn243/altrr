import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/app_bar_main.dart';
import '../../../core/widgets/quest_card.dart';
import '../../../core/widgets/stat_card.dart';
import '../../../core/widgets/side_quest_card.dart';
import '../../../core/widgets/title_card.dart';
import '../../../core/widgets/section_header.dart';
import '../controllers/quests_controller.dart';
import '../controllers/quests_controller_provider.dart';

class QuestsScreen extends StatelessWidget {
  const QuestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = QuestsControllerProvider.of(context);
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: Column(
          children: [
            AppBarMain(
              greeting: 'Good evening,',
              username: 'Adventurer',
              initials: 'AV',
              onAvatarTap: () => context.push('/profile'),
              onBellTap: () {},
            ),
            Expanded(
              child: ListenableBuilder(
                listenable: controller,
                builder: (context, _) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.screenPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ── Active quest ────────────────────────────────────
                        controller.activeQuest == null
                            ? const SizedBox.shrink()
                            : QuestCard(
                                questTitle: controller.activeQuest!.title,
                                description:
                                    controller.activeQuest!.description,
                                hint: controller.activeQuest!.hint,
                                expiryText: 'Expires midnight',
                                assignedByAltrr: true,
                                onComplete: () async {
                                  final quest = controller.activeQuest;
                                  if (quest == null) return;
                                  final saved = await context.push<bool>(
                                    '/submit',
                                    extra: quest,
                                  );
                                  if (saved == true) controller.completeQuest();
                                },
                                onSkip: controller.skipQuest,
                              ),
                        const SizedBox(height: AppSpacing.sm),

                        // ── Debug chip: character + category ────────────────
                        _DebugChip(controller: controller),
                        const SizedBox(height: AppSpacing.md),

                        // ── Generate button ─────────────────────────────────
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.accent,
                              side: const BorderSide(
                                  color: AppColors.accent, width: 1),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(AppRadius.button)),
                              ),
                            ),
                            onPressed: controller.generateQuest,
                            icon: const Icon(Icons.refresh, size: 16),
                            label: Text(
                              'Generate Quest',
                              style: AppTypography.unboundedBold(
                                  12, AppColors.accent),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),

                        // ── TEST: Timer button ──────────────────────────────
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.textDisabled,
                              side:
                                  const BorderSide(color: AppColors.borderMid),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(AppRadius.button)),
                              ),
                            ),
                            onPressed: () => context.push('/timer'),
                            icon: const Icon(Icons.timer_outlined, size: 16),
                            label: Text(
                              'Test Timer',
                              style: AppTypography.unboundedBold(
                                  12, AppColors.textDisabled),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sectionGap),

                        // ── YOUR NUMBERS ────────────────────────────────────
                        const SectionHeader(label: 'YOUR NUMBERS'),
                        const SizedBox(height: AppSpacing.itemGap),
                        GridView.count(
                          crossAxisCount: 3,
                          mainAxisSpacing: AppSpacing.sm,
                          crossAxisSpacing: AppSpacing.sm,
                          childAspectRatio: 1.7,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: const [
                            StatCard(value: '14', label: 'Quests Done'),
                            StatCard(value: '1', label: 'Skips'),
                            StatCard(value: '3', label: 'Titles Earned'),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.sectionGap),

                        // ── QUESTS ──────────────────────────────────────────
                        SectionHeader(label: 'QUESTS', seeAll: () {}),
                        const SizedBox(height: AppSpacing.itemGap),
                        SideQuestCard(
                          icon: const Icon(Icons.restaurant,
                              size: 20, color: AppColors.textMuted),
                          category: 'Food',
                          questTitle: "A Cook's First Attempt",
                          description:
                              "Create a dish you've never eaten before.",
                          date: 'Today',
                          totalDots: 3,
                          activeDot: 0,
                          onStart: () {},
                        ),
                        const SizedBox(height: AppSpacing.itemGap),
                        SideQuestCard(
                          icon: const Icon(Icons.directions_walk,
                              size: 20, color: AppColors.textMuted),
                          category: 'Travel',
                          questTitle: 'City Explorer',
                          description:
                              'Visit a part of the city you have never been to.',
                          date: 'Tomorrow',
                          totalDots: 3,
                          activeDot: 1,
                          onStart: () {},
                        ),
                        const SizedBox(height: AppSpacing.sectionGap),

                        // ── TITLES ──────────────────────────────────────────
                        SectionHeader(label: 'TITLES', seeAll: () {}),
                        const SizedBox(height: AppSpacing.itemGap),
                        SizedBox(
                          height: 155,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            clipBehavior: Clip.none,
                            children: const [
                              TitleCard(
                                icon: Icon(Icons.restaurant,
                                    size: 20, color: AppColors.accent),
                                category: 'Food',
                                titleName: 'Conversationalist',
                                questCount: 2,
                              ),
                              SizedBox(width: AppSpacing.itemGap),
                              TitleCard(
                                icon: Icon(Icons.people,
                                    size: 20, color: AppColors.accent),
                                category: 'People',
                                titleName: 'The Wanderer',
                                questCount: 3,
                              ),
                              SizedBox(width: AppSpacing.itemGap),
                              TitleCard(
                                icon: Icon(Icons.fitness_center,
                                    size: 20, color: AppColors.accent),
                                category: 'Gym',
                                titleName: 'Iron Will',
                                questCount: 1,
                              ),
                              SizedBox(width: AppSpacing.itemGap),
                              TitleCard(
                                icon: Icon(Icons.travel_explore,
                                    size: 20, color: AppColors.accent),
                                category: 'Travel',
                                titleName: 'Pathfinder',
                                questCount: 2,
                              ),
                            ],
                          ),
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

// ── Debug chip ────────────────────────────────────────────────────────────────
// Shows which character + category produced the current quest.
// Remove this widget once generation is wired to the real balance tracker.

class _DebugChip extends StatelessWidget {
  final QuestsController controller;
  const _DebugChip({required this.controller});

  @override
  Widget build(BuildContext context) {
    final balance = controller.currentBalance;
    if (balance == null) return const SizedBox.shrink();

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.accentSubtle,
            borderRadius: BorderRadius.circular(AppRadius.chip),
            border: Border.all(color: AppColors.accentDim),
          ),
          child: Text(
            '${balance.character!.name}  ·  ${balance.category}',
            style: AppTypography.unboundedBold(9, AppColors.accent)
                .copyWith(letterSpacing: 0.5),
          ),
        ),
      ],
    );
  }
}
