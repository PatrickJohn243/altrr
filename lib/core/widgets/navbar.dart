import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

enum TabItem { home, quests, history, settings }

class AppNavBar extends StatelessWidget {
  final TabItem activeTab;
  final ValueChanged<TabItem>? onTabSelected;

  const AppNavBar({
    super.key,
    required this.activeTab,
    this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83,
      decoration: const BoxDecoration(
        color: AppColors.bgSurface,
        border: Border(top: BorderSide(color: AppColors.borderSubtle)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavTab(
            icon: Icons.home_outlined,
            activeIcon: Icons.home,
            label: 'Home',
            tab: TabItem.home,
            activeTab: activeTab,
            onTap: onTabSelected,
          ),
          _NavTab(
            icon: Icons.explore_outlined,
            activeIcon: Icons.explore,
            label: 'Quests',
            tab: TabItem.quests,
            activeTab: activeTab,
            onTap: onTabSelected,
          ),
          _NavTab(
            icon: Icons.history_outlined,
            activeIcon: Icons.history,
            label: 'History',
            tab: TabItem.history,
            activeTab: activeTab,
            onTap: onTabSelected,
          ),
          _NavTab(
            icon: Icons.settings_outlined,
            activeIcon: Icons.settings,
            label: 'Settings',
            tab: TabItem.settings,
            activeTab: activeTab,
            onTap: onTabSelected,
          ),
        ],
      ),
    );
  }
}

class _NavTab extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final TabItem tab;
  final TabItem activeTab;
  final ValueChanged<TabItem>? onTap;

  const _NavTab({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.tab,
    required this.activeTab,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = tab == activeTab;

    return GestureDetector(
      onTap: () => onTap?.call(tab),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 64,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon with optional pill highlight
            Stack(
              alignment: Alignment.center,
              children: [
                if (isActive)
                  Container(
                    width: 64,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: AppColors.accentSubtle,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                Icon(
                  isActive ? activeIcon : icon,
                  size: 20,
                  color: isActive ? AppColors.accent : AppColors.textDisabled,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: isActive
                  ? AppTypography.unboundedBold(9, AppColors.accent)
                  : AppTypography.outfitSemiBold(9, AppColors.textDisabled),
            ),
          ],
        ),
      ),
    );
  }
}
