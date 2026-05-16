import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../controllers/user_profile_controller.dart';
import '../widgets/navbar.dart';
import '../../features/home/pages/home/home_screen.dart';
import '../../features/onboarding/pages/onboarding_screen.dart';
import '../../features/quests/pages/quests_screen.dart';
import '../../features/quests/controllers/quests_controller.dart';
import '../../features/quests/controllers/quests_controller_provider.dart';
import '../../features/history/pages/history_screen.dart';
import '../../features/settings/pages/settings_screen.dart';
import '../../features/home/pages/profile/profile_screen.dart';
import '../../features/home/pages/notifications/notifications_screen.dart';
import '../../features/quests/pages/quest_detail/quest_detail_screen.dart';
import '../../features/quests/pages/timer/timer_screen.dart';
import '../../features/quests/pages/quest_submission/quest_submission_screen.dart';
import '../../features/home/pages/streak/streak_screen.dart';
import '../../features/home/pages/edit_profile/edit_profile_screen.dart';
import '../../features/home/pages/all_titles/all_titles_screen.dart';
import '../../features/quests/pages/all_quests/all_quests_screen.dart';
import '../../features/home/pages/title_detail/title_detail_screen.dart';
import '../../features/home/pages/stats/stats_screen.dart';
import '../../features/quests/pages/active_quest_detail/active_quest_detail_screen.dart';
import '../../features/quests/pages/challenge_quest/challenge_quest_screen.dart';
import '../../features/settings/pages/quest_preferences/quest_preferences_screen.dart';
import '../../features/settings/pages/pro/pro_screen.dart';
import '../../shared/models/quest.dart';
import '../../shared/models/earned_title.dart';

GoRouter createAppRouter(UserProfileController profileController) => GoRouter(
  initialLocation: profileController.isOnboarded ? '/home' : '/onboarding',
  refreshListenable: profileController,
  redirect: (context, state) {
    final onboarded = profileController.isOnboarded;
    final onOnboarding = state.matchedLocation == '/onboarding';
    if (!onboarded && !onOnboarding) return '/onboarding';
    if (onboarded && onOnboarding) return '/home';
    return null;
  },
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => _AppShell(child: child),
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomeScreen(),
          ),
        ),
        GoRoute(
          path: '/quests',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: QuestsScreen(),
          ),
        ),
        GoRoute(
          path: '/history',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HistoryScreen(),
          ),
        ),
        GoRoute(
          path: '/settings',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SettingsScreen(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationsScreen(),
    ),
    GoRoute(
      path: '/quest',
      builder: (context, state) =>
          QuestDetailScreen(quest: state.extra as Quest),
    ),
    GoRoute(
      path: '/timer',
      builder: (context, state) => const TimerScreen(),
    ),
    GoRoute(
      path: '/submit',
      builder: (context, state) =>
          QuestSubmissionScreen(quest: state.extra as Quest),
    ),
    GoRoute(
      path: '/streak',
      builder: (context, state) => const StreakScreen(),
    ),
    GoRoute(
      path: '/edit-profile',
      builder: (context, state) => const EditProfileScreen(),
    ),
    GoRoute(
      path: '/titles',
      builder: (context, state) =>
          AllTitlesScreen(initialCategory: state.extra as String?),
    ),
    GoRoute(
      path: '/all-quests',
      builder: (context, state) => const AllQuestsScreen(),
    ),
    GoRoute(
      path: '/title',
      builder: (context, state) =>
          TitleDetailScreen(title: state.extra as EarnedTitle),
    ),
    GoRoute(
      path: '/stats',
      builder: (context, state) => const StatsScreen(),
    ),
    GoRoute(
      path: '/challenge',
      builder: (context, state) =>
          ChallengeQuestScreen(quest: state.extra as Quest),
    ),
    GoRoute(
      path: '/quest-preferences',
      builder: (context, state) => const QuestPreferencesScreen(),
    ),
    GoRoute(
      path: '/active-quest',
      builder: (context, state) =>
          ActiveQuestDetailScreen(quest: state.extra as Quest),
    ),
    GoRoute(
      path: '/pro',
      builder: (context, state) => const ProScreen(),
    ),
  ],
);

// ── Shell ──────────────────────────────────────────────────────────────────────

class _AppShell extends StatefulWidget {
  final Widget child;
  const _AppShell({required this.child});

  @override
  State<_AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<_AppShell> {
  late final QuestsController _questsController;

  @override
  void initState() {
    super.initState();
    _questsController = QuestsController();
  }

  @override
  void dispose() {
    _questsController.dispose();
    super.dispose();
  }

  TabItem _tabFromLocation(String location) {
    if (location.startsWith('/quests')) return TabItem.quests;
    if (location.startsWith('/history')) return TabItem.history;
    if (location.startsWith('/settings')) return TabItem.settings;
    return TabItem.home;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    return QuestsControllerProvider(
      controller: _questsController,
      child: Scaffold(
        body: widget.child,
        bottomNavigationBar: AppNavBar(
          activeTab: _tabFromLocation(location),
          onTabSelected: (tab) {
            switch (tab) {
              case TabItem.home:
                context.go('/home');
              case TabItem.quests:
                context.go('/quests');
              case TabItem.history:
                context.go('/history');
              case TabItem.settings:
                context.go('/settings');
            }
          },
        ),
      ),
    );
  }
}
