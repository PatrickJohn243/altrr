import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import '../controllers/user_profile_provider.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';

/// Main app bar — greeting + username on left, notification bell + avatar on right.
/// Username, initials, and avatar image are read live from [UserProfileProvider].
/// Greeting is derived from device time — 3 variants per period, seeded by
/// day-of-year so it stays consistent within the same day.
class AppBarMain extends StatelessWidget {
  final VoidCallback? onAvatarTap;
  final VoidCallback? onBellTap;

  const AppBarMain({
    super.key,
    this.onAvatarTap,
    this.onBellTap,
  });

  static String _buildGreeting() {
    final now = DateTime.now();
    final hour = now.hour;
    final seed = now.difference(DateTime(now.year, 1, 1)).inDays;
    final rng = Random(seed);

    const mornings = [
      'Good morning,',
      'Rise and shine,',
      'Morning,',
    ];
    const afternoons = [
      'Good afternoon,',
      "Hope your day's going well,",
      'Afternoon,',
    ];
    const evenings = [
      'Good evening,',
      'Evening,',
      'Hope today was good,',
    ];

    final List<String> pool;
    if (hour >= 5 && hour < 12) {
      pool = mornings;
    } else if (hour >= 12 && hour < 18) {
      pool = afternoons;
    } else {
      pool = evenings;
    }

    return pool[rng.nextInt(pool.length)];
  }

  @override
  Widget build(BuildContext context) {
    final profile = UserProfileProvider.of(context);

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
                Text(_buildGreeting(), style: AppTypography.greeting),
                Row(
                  children: [
                    Text(profile.name, style: AppTypography.screenTitle),
                    const SizedBox(width: AppSpacing.sm),
                    GestureDetector(
                      onTap: onBellTap,
                      child: const Icon(
                        Icons.notifications_outlined,
                        color: AppColors.accent,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
              clipBehavior: Clip.antiAlias,
              child: profile.avatarPath != null
                  ? Image.file(
                      File(profile.avatarPath!),
                      fit: BoxFit.cover,
                    )
                  : Center(
                      child: Text(
                        profile.initials,
                        style: AppTypography.unboundedExtraBold(
                          14,
                          AppColors.textInverse,
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
