import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_bar_back.dart';
import '../../../../core/widgets/profile_card.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/stat_card.dart';
import '../../../../core/widgets/title_card.dart';
import '../../widgets/quest_new_row.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: Column(
          children: [
            AppBarBack(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileCard(
                      initials: 'PJ',
                      username: 'Adventurer',
                      memberSince: 'Member since Jan 2025',
                      streakDays: 7,
                      flavorText: 'Someone who shows up.',
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    const SectionHeader(label: 'YOUR NUMBERS'),
                    const SizedBox(height: AppSpacing.md),
                    GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: AppSpacing.sm,
                      crossAxisSpacing: AppSpacing.sm,
                      childAspectRatio: 1.4,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        StatCard(value: '14', label: 'Quests done'),
                        StatCard(value: '1', label: 'Skips'),
                        StatCard(value: '3', label: 'Titles earned'),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    const SectionHeader(label: 'RECENT TITLES'),
                    const SizedBox(height: AppSpacing.md),
                    const QuestNewRow(
                      icon: Icons.restaurant_outlined,
                      category: 'Food',
                      questTitle: 'Try a new cuisine',
                      isNew: true,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    const QuestNewRow(
                      icon: Icons.directions_walk_outlined,
                      category: 'People',
                      questTitle: 'Strike up a conversation',
                      isNew: true,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    const QuestNewRow(
                      icon: Icons.fitness_center_outlined,
                      category: 'Gym',
                      questTitle: 'Hit the gym early',
                      isNew: false,
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    SectionHeader(label: 'ALL TITLES', seeAll: () {}),
                    const SizedBox(height: AppSpacing.md),
                    SizedBox(
                      height: 155,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          TitleCard(
                            icon: const Icon(Icons.restaurant_outlined,
                                size: 18, color: AppColors.textMuted),
                            category: 'Food',
                            titleName: 'The Taster',
                            questCount: 3,
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          TitleCard(
                            icon: const Icon(Icons.people_outline,
                                size: 18, color: AppColors.textMuted),
                            category: 'People',
                            titleName: 'The Connector',
                            questCount: 2,
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          TitleCard(
                            icon: const Icon(Icons.fitness_center_outlined,
                                size: 18, color: AppColors.textMuted),
                            category: 'Gym',
                            titleName: 'The Lifter',
                            questCount: 5,
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          TitleCard(
                            icon: const Icon(Icons.flight_outlined,
                                size: 18, color: AppColors.textMuted),
                            category: 'Travel',
                            titleName: 'The Wanderer',
                            questCount: 1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxl),
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
