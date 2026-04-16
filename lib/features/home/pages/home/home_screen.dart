import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_bar_main.dart';
import '../../../../core/widgets/quest_display_card.dart';
import '../../../../core/widgets/streak_card.dart';
import '../../../../core/widgets/title_card.dart' show TitleCategoryCard;
import '../../../../core/widgets/quest_row_card.dart';
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
            const AppBarMain(),
            Expanded(
              child: ListenableBuilder(
                listenable: homeCtrl,
                builder: (context, _) {
                  final activeQuest = questsCtrl.activeQuest;
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.screenPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ── Active quest ─────────────────────────────────────
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
                          child: activeQuest == null
                              ? const SizedBox.shrink()
                              : QuestDisplayCard(
                                  key: ValueKey(activeQuest.id),
                                  questTitle: activeQuest.title,
                                  description: activeQuest.description,
                                  expiryText:
                                      _expiryText(activeQuest.expiresAt),
                                  category: activeQuest.category,
                                  questsInCategory: homeCtrl
                                          .categoryQuestCounts[
                                              activeQuest.category] ??
                                      0,
                                  assignedByAltrr: activeQuest.assignedByAltrr,
                                  onComplete: () async {
                                    final quest = questsCtrl.activeQuest;
                                    if (quest == null) return;
                                    final saved = await context.push<bool>(
                                      '/submit',
                                      extra: quest,
                                    );
                                    if (saved == true)
                                      questsCtrl.completeQuest();
                                  },
                                  onSkip: questsCtrl.skipQuest,
                                ),
                        ),
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

                        // ── YOUR TITLES ──────────────────────────────────────
                        SectionHeader(
                            label: 'YOUR TITLES',
                            seeAll: () => context.push('/titles')),
                        const SizedBox(height: AppSpacing.itemGap),
                        SizedBox(
                          height: 155,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            clipBehavior: Clip.none,
                            itemCount: _categories.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: AppSpacing.itemGap),
                            itemBuilder: (context, i) {
                              final cat = _categories[i];
                              final count =
                                  homeCtrl.categoryTitleCounts[cat.key] ?? 0;
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
                        const SizedBox(height: AppSpacing.sectionGap),

                        // ── RECENT QUESTS ────────────────────────────────────
                        SectionHeader(
                            label: 'RECENT QUESTS',
                            seeAll: () => context.push('/all-quests')),
                        const SizedBox(height: AppSpacing.itemGap),
                        if (homeCtrl.recentQuests.isEmpty)
                          const SizedBox.shrink()
                        else
                          ...homeCtrl.recentQuests.map((q) => Padding(
                                padding: const EdgeInsets.only(
                                    bottom: AppSpacing.itemGap),
                                child: QuestRowCard(
                                  icon: Icon(
                                    _iconForCategory(q.category),
                                    size: 18,
                                    color: AppColors.textMuted,
                                  ),
                                  category: q.category,
                                  questTitle: q.title,
                                  date: _formatDate(
                                      q.completedAt ?? q.assignedAt),
                                  onTap: () => context.push('/quest', extra: q),
                                ),
                              )),
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

  // ── Category definitions ───────────────────────────────────────────────────

  static const _categories = [
    _CategoryDef('physical', 'Physical', Icons.fitness_center),
    _CategoryDef('mental', 'Mental', Icons.psychology),
    _CategoryDef('social', 'Social', Icons.people),
    _CategoryDef('cooking', 'Cooking', Icons.restaurant),
    _CategoryDef('learning', 'Learning', Icons.school),
    _CategoryDef('explore', 'Explore', Icons.travel_explore),
    _CategoryDef('hobby', 'Hobby', Icons.palette),
    _CategoryDef('reflection', 'Reflect', Icons.self_improvement),
  ];

  static String _expiryText(DateTime expiresAt) {
    final remaining = expiresAt.difference(DateTime.now());
    if (remaining.isNegative) return 'Expired';
    final hours = remaining.inHours;
    if (hours < 1) return 'Expires in ${remaining.inMinutes}m';
    return 'Expires in ${hours}h';
  }

  static String _formatDate(DateTime dt) {
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
      'Dec'
    ];
    return '${months[dt.month - 1]} ${dt.day}';
  }

  static IconData _iconForCategory(String category) {
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
}

// ── Category definition ────────────────────────────────────────────────────────

class _CategoryDef {
  final String key;
  final String label;
  final IconData icon;
  const _CategoryDef(this.key, this.label, this.icon);
}
