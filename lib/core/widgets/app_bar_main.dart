import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';

/// Main app bar — greeting + username on left, notification bell + avatar on right.
class AppBarMain extends StatelessWidget {
  final String greeting;
  final String username;
  final String initials;
  final VoidCallback? onAvatarTap;
  final VoidCallback? onBellTap;

  const AppBarMain({
    super.key,
    required this.greeting,
    required this.username,
    required this.initials,
    this.onAvatarTap,
    this.onBellTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenPadding,
        vertical: AppSpacing.lg,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Greeting + username
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(greeting, style: AppTypography.greeting),
                Text(username, style: AppTypography.screenTitle),
              ],
            ),
          ),
          // Bell icon
          GestureDetector(
            onTap: onBellTap,
            child: const Icon(
              Icons.notifications_outlined,
              color: AppColors.textMuted,
              size: 22,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          // Avatar
          GestureDetector(
            onTap: onAvatarTap,
            child: Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: AppColors.accent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  initials,
                  style: AppTypography.unboundedExtraBold(14, AppColors.textInverse),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
