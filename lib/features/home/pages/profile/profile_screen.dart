import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import '../../../../core/controllers/user_profile_provider.dart';
import '../../../../core/database/isar_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_bar_back.dart';
import '../../../../core/widgets/profile_card.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/stat_card.dart';
import '../../../../core/widgets/title_card.dart' show TitleCategoryCard;
import '../../../../shared/models/earned_title.dart';
import '../../widgets/quest_new_row.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Isar _isar = IsarService.instance;
  Map<String, int> _categoryTitleCounts = {};

  static const _categories = [
    _CategoryDef('physical',   'Physical',  Icons.fitness_center),
    _CategoryDef('mental',     'Mental',    Icons.psychology),
    _CategoryDef('social',     'Social',    Icons.people),
    _CategoryDef('cooking',    'Cooking',   Icons.restaurant),
    _CategoryDef('learning',   'Learning',  Icons.school),
    _CategoryDef('explore',    'Explore',   Icons.travel_explore),
    _CategoryDef('hobby',      'Hobby',     Icons.palette),
    _CategoryDef('reflection', 'Reflect',   Icons.self_improvement),
  ];

  @override
  void initState() {
    super.initState();
    _loadCounts();
  }

  Future<void> _loadCounts() async {
    final allTitles = await _isar.earnedTitles.where().findAll();
    final counts = <String, int>{};
    for (final t in allTitles) {
      if (t.category != null) {
        counts[t.category!] = (counts[t.category!] ?? 0) + 1;
      }
    }
    if (mounted) setState(() => _categoryTitleCounts = counts);
  }

  @override
  Widget build(BuildContext context) {
    final profile = UserProfileProvider.of(context);

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
                      initials: profile.initials,
                      username: profile.name,
                      avatarPath: profile.avatarPath,
                      memberSince: 'Member since Jan 2025',
                      streakDays: 7,
                      flavorText: 'Someone who shows up.',
                      onEditTap: () => context.push('/edit-profile'),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    const SectionHeader(label: 'YOUR NUMBERS'),
                    const SizedBox(height: AppSpacing.md),
                    Row(
                      children: const [
                        Expanded(child: StatCard(value: '14', label: 'Quests done')),
                        SizedBox(width: AppSpacing.sm),
                        Expanded(child: StatCard(value: '1', label: 'Skips')),
                        SizedBox(width: AppSpacing.sm),
                        Expanded(child: StatCard(value: '3', label: 'Titles earned')),
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
                    SectionHeader(
                      label: 'ALL TITLES',
                      seeAll: () => context.push('/titles'),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    SizedBox(
                      height: 155,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _categories.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(width: AppSpacing.sm),
                        itemBuilder: (context, i) {
                          final cat = _categories[i];
                          final count =
                              _categoryTitleCounts[cat.key] ?? 0;
                          return TitleCategoryCard(
                            category: cat.label,
                            icon: cat.icon,
                            titleCount: count,
                            locked: count == 0,
                            onTap: () => context.push(
                              '/titles',
                              extra: cat.key,
                            ),
                          );
                        },
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

// ── Category definition ────────────────────────────────────────────────────────

class _CategoryDef {
  final String key;
  final String label;
  final IconData icon;
  const _CategoryDef(this.key, this.label, this.icon);
}
