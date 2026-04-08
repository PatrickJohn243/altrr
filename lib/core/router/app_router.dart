import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/navbar.dart';
import '../../features/home/home_screen.dart';
import '../../features/quests/quests_screen.dart';
import '../../features/history/history_screen.dart';
import '../../features/settings/settings_screen.dart';
import '../../features/profile/profile_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
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
    // Profile is outside the shell (no navbar)
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);

class _AppShell extends StatelessWidget {
  final Widget child;

  const _AppShell({required this.child});

  TabItem _tabFromLocation(String location) {
    if (location.startsWith('/quests')) return TabItem.quests;
    if (location.startsWith('/history')) return TabItem.history;
    if (location.startsWith('/settings')) return TabItem.settings;
    return TabItem.home;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    return Scaffold(
      body: child,
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
    );
  }
}
