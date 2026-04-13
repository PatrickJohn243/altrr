import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_bar_main.dart';
import '../../../../core/widgets/quest_display_card.dart';
import '../../../../core/widgets/streak_card.dart';
import '../../../../core/widgets/title_card.dart';
import '../../../../core/widgets/quest_row_card.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../shared/models/quest.dart';
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
            AppBarMain(
              onAvatarTap: () => context.push('/profile'),
              onBellTap: () => context.push('/notifications'),
            ),
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
                        if (activeQuest != null)
                          QuestDisplayCard(
                            questTitle: activeQuest.title,
                            description: activeQuest.description,
                            expiryText: _expiryText(activeQuest.expiresAt),
                            assignedByAltrr: activeQuest.assignedByAltrr,
                            onComplete: () async {
                              final quest = questsCtrl.activeQuest;
                              if (quest == null) return;
                              final saved = await context.push<bool>(
                                '/submit',
                                extra: quest,
                              );
                              if (saved == true) questsCtrl.completeQuest();
                            },
                            onSkip: questsCtrl.skipQuest,
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
                        SectionHeader(label: 'YOUR TITLES', seeAll: () => context.push('/titles')),
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
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sectionGap),

                        // ── RECENT QUESTS ────────────────────────────────────
                        SectionHeader(label: 'RECENT QUESTS', seeAll: () => context.push('/all-quests')),
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
