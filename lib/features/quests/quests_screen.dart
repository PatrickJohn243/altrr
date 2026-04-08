import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/widgets/app_bar_main.dart';
import '../../core/widgets/quest_card.dart';
import '../../core/widgets/stat_card.dart';
import '../../core/widgets/side_quest_card.dart';
import '../../core/widgets/title_card.dart';
import '../../core/widgets/section_header.dart';

class QuestsScreen extends StatelessWidget {
  const QuestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Active quest — two-tone card
                    QuestCard(
                      questTitle: "The Wanderer's Walk",
                      description:
                          'Walk outside for 20 minutes, clear your mind.',
                      hint: "You've been taking the same route for weeks.",
                      expiryText: 'Expires midnight',
                      assignedByAltrr: false,
                      onComplete: () {},
                      onSkip: () {},
                    ),
                    const SizedBox(height: AppSpacing.sectionGap),

                    // YOUR NUMBERS — 3 stat cards
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

                    // QUESTS + SEE ALL — side quest cards
                    SectionHeader(label: 'QUESTS', seeAll: () {}),
                    const SizedBox(height: AppSpacing.itemGap),
                    SideQuestCard(
                      icon: const Icon(Icons.restaurant,
                          size: 20, color: AppColors.textMuted),
                      category: 'Food',
                      questTitle: "A Cook's First Attempt",
                      description: "Create a dish you've never eaten before.",
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

                    // TITLES + SEE ALL — horizontal title cards
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
                                size: 20, color: AppColors.textInverse),
                            category: 'Food',
                            titleName: 'Conversationalist',
                            questCount: 2,
                          ),
                          SizedBox(width: AppSpacing.itemGap),
                          TitleCard(
                            icon: Icon(Icons.people,
                                size: 20, color: AppColors.textInverse),
                            category: 'People',
                            titleName: 'The Wanderer',
                            questCount: 3,
                          ),
                          SizedBox(width: AppSpacing.itemGap),
                          TitleCard(
                            icon: Icon(Icons.fitness_center,
                                size: 20, color: AppColors.textInverse),
                            category: 'Gym',
                            titleName: 'Iron Will',
                            questCount: 1,
                          ),
                          SizedBox(width: AppSpacing.itemGap),
                          TitleCard(
                            icon: Icon(Icons.travel_explore,
                                size: 20, color: AppColors.textInverse),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
