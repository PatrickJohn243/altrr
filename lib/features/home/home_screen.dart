import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/widgets/app_bar_main.dart';
import '../../core/widgets/quest_display_card.dart';
import '../../core/widgets/streak_card.dart';
import '../../core/widgets/title_card.dart';
import '../../core/widgets/quest_row_card.dart';
import '../../core/widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                    QuestDisplayCard(
                      questTitle: "The Wanderer's Walk",
                      description: 'Walk outside for 20 minutes, clear your mind.',
                      expiryText: 'Expires in 30 minutes',
                      assignedByAltrr: true,
                      onComplete: () {},
                      onSkip: () {},
                    ),
                    const SizedBox(height: AppSpacing.sectionGap),

                    const SectionHeader(label: 'THIS WEEK'),
                    const SizedBox(height: AppSpacing.itemGap),
                    StreakCard(
                      streakCount: 12,
                      days: const [
                        StreakDay(label: 'M', status: DayStatus.completed),
                        StreakDay(label: 'T', status: DayStatus.completed),
                        StreakDay(label: 'W', status: DayStatus.completed),
                        StreakDay(label: 'T', status: DayStatus.current),
                        StreakDay(label: 'F', status: DayStatus.empty),
                        StreakDay(label: 'S', status: DayStatus.empty),
                        StreakDay(label: 'S', status: DayStatus.empty),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sectionGap),

                    SectionHeader(label: 'YOUR TITLES', seeAll: () {}),
                    const SizedBox(height: AppSpacing.itemGap),
                    SizedBox(
                      height: 155,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        children: const [
                          TitleCard(
                            icon: Icon(Icons.restaurant, size: 20, color: AppColors.textInverse),
                            category: 'Food',
                            titleName: 'Conversationalist',
                            questCount: 2,
                          ),
                          SizedBox(width: AppSpacing.itemGap),
                          TitleCard(
                            icon: Icon(Icons.people, size: 20, color: AppColors.textInverse),
                            category: 'People',
                            titleName: 'The Wanderer',
                            questCount: 3,
                          ),
                          SizedBox(width: AppSpacing.itemGap),
                          TitleCard(
                            icon: Icon(Icons.fitness_center, size: 20, color: AppColors.textInverse),
                            category: 'Gym',
                            titleName: 'Iron Will',
                            questCount: 1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sectionGap),

                    SectionHeader(label: 'RECENT QUESTS', seeAll: () {}),
                    const SizedBox(height: AppSpacing.itemGap),
                    const QuestRowCard(
                      icon: Icon(Icons.restaurant, size: 18, color: AppColors.textMuted),
                      category: 'Food',
                      questTitle: "A Cook's First Attempt",
                      date: 'Mar 15',
                    ),
                    const SizedBox(height: AppSpacing.itemGap),
                    const QuestRowCard(
                      icon: Icon(Icons.people, size: 18, color: AppColors.textMuted),
                      category: 'People',
                      questTitle: 'Conversationalist',
                      date: 'Mar 14',
                    ),
                    const SizedBox(height: AppSpacing.itemGap),
                    const QuestRowCard(
                      icon: Icon(Icons.directions_walk, size: 18, color: AppColors.textMuted),
                      category: 'Travel',
                      questTitle: "The Wanderer's Walk",
                      date: 'Mar 13',
                      isSkipped: true,
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
