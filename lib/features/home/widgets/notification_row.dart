import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';

class NotificationRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;
  final bool isUnread;

  const NotificationRow({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.isUnread,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isUnread ? AppColors.accentSubtle : AppColors.bgSurface,
        borderRadius: const BorderRadius.all(Radius.circular(AppRadius.card)),
        border: Border(
          top: const BorderSide(color: AppColors.borderSubtle),
          left: BorderSide(
            color: isUnread ? AppColors.accentDim : AppColors.borderSubtle,
            width: isUnread ? 2 : 1,
          ),
          right: const BorderSide(color: AppColors.borderSubtle),
          bottom: const BorderSide(color: AppColors.borderSubtle, width: 3),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.cardPaddingMd,
          vertical: 14,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon box
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: isUnread
                    ? const Color(0x1AC8F135)
                    : AppColors.bgElevated,
                borderRadius:
                    const BorderRadius.all(Radius.circular(AppRadius.icon)),
              ),
              child: Icon(
                icon,
                size: 18,
                color: isUnread ? AppColors.accent : AppColors.textMuted,
              ),
            ),
            const SizedBox(width: 14),
            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: isUnread
                              ? AppTypography.unboundedBold(
                                  12, AppColors.textPrimary)
                              : AppTypography.cardTitle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        time,
                        style: AppTypography.outfitMedium(
                            10, AppColors.textMuted),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(subtitle, style: AppTypography.bodyMedium),
                ],
              ),
            ),
            if (isUnread) ...[
              const SizedBox(width: 8),
              Container(
                width: 6,
                height: 6,
                margin: const EdgeInsets.only(top: 4),
                decoration: const BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
