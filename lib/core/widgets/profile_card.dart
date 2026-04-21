import 'dart:io';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';

/// Lime profile card — avatar, username, member date, streak pill, flavor text.
class ProfileCard extends StatelessWidget {
  final String initials;
  final String username;
  final String memberSince;
  final int streakDays;
  final String flavorText;
  final String? avatarPath;
  final VoidCallback? onEditTap;

  const ProfileCard({
    super.key,
    required this.initials,
    required this.username,
    required this.memberSince,
    required this.streakDays,
    required this.flavorText,
    this.avatarPath,
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.cardPadding),
      decoration: const BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.card)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                // Avatar + edit badge
                GestureDetector(
                  onTap: onEditTap,
                  child: SizedBox(
                    width: 60,
                    height: 67,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColors.bgPrimary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0x80C8F135),
                            width: 2,
                          ),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: avatarPath != null
                            ? Image.file(
                                File(avatarPath!),
                                fit: BoxFit.cover,
                                width: 60,
                                height: 60,
                              )
                            : Center(
                                child: Text(
                                  initials,
                                  style: AppTypography.unboundedBlack(
                                      20, AppColors.accent),
                                ),
                              ),
                      ),
                      Positioned(
                        bottom: -1,
                        right: -1,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppColors.bgPrimary,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.accent, width: 2),
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 10,
                            color: AppColors.accent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ),
                const SizedBox(width: 16),
                // Name + streak
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.unboundedBlack(20, AppColors.textInverse),
                      ),
                      Text(
                        memberSince,
                        style: AppTypography.outfitMedium(12, AppColors.questCardTextDim),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      _StreakPill(days: streakDays),
                    ],
                  ),
                ),
              ],
            ),
          const SizedBox(height: AppSpacing.lg),
          // Flavor text box
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
            decoration: const BoxDecoration(
              color: AppColors.questCardOverlay,
              borderRadius: BorderRadius.all(Radius.circular(11)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'YOU ARE BECOMING —',
                  style: AppTypography.outfitBold(12, AppColors.questCardTextDim)
                      .copyWith(letterSpacing: 0.9),
                ),
                const SizedBox(height: 2),
                Text(
                  flavorText,
                  style: AppTypography.unboundedExtraBold(16, AppColors.textInverse),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StreakPill extends StatelessWidget {
  final int days;
  const _StreakPill({required this.days});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: const BoxDecoration(
        color: Color(0x1F121212),
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.chip)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('🔥', style: TextStyle(fontSize: 12)),
          const SizedBox(width: 4),
          Text(
            '$days',
            style: AppTypography.unboundedExtraBold(12.5, AppColors.textInverse),
          ),
          const SizedBox(width: 4),
          Text(
            'day streak',
            style: AppTypography.outfitMedium(12, const Color(0x80121212)),
          ),
        ],
      ),
    );
  }
}
