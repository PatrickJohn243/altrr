import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/config/app_features.dart';
import '../../../core/services/alert_service.dart';

class LockedToggleCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String sublabel;
  final Feature feature;

  const LockedToggleCard({
    super.key,
    required this.icon,
    required this.label,
    required this.sublabel,
    required this.feature,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      decoration: const BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.card)),
        border: Border(
          top: BorderSide(color: AppColors.borderSubtle),
          left: BorderSide(color: AppColors.borderSubtle),
          right: BorderSide(color: AppColors.borderSubtle),
          bottom: BorderSide(color: AppColors.borderSubtle, width: 3),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(AppRadius.card)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.cardPaddingMd, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: AppColors.bgElevated,
                  borderRadius: BorderRadius.all(Radius.circular(AppRadius.icon)),
                ),
                child: Center(
                  child: Icon(icon, size: 18, color: AppColors.textDisabled),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(label,
                            style: AppTypography.unboundedBold(
                                12, AppColors.textDisabled)),
                        if (feature.upcoming) ...[
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.accentSubtle,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'SOON',
                              style: AppTypography.unboundedBold(8, AppColors.accent),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(sublabel, style: AppTypography.bodyMedium),
                  ],
                ),
              ),
              if (!feature.upcoming)
                Opacity(
                  opacity: 0.4,
                  child: Switch(
                    value: feature.enabled,
                    onChanged: null,
                    trackColor: WidgetStateProperty.resolveWith((states) =>
                        feature.enabled
                            ? AppColors.accent
                            : AppColors.bgElevated),
                    thumbColor: WidgetStateProperty.all(AppColors.bgPrimary),
                    trackOutlineColor:
                        WidgetStateProperty.all(Colors.transparent),
                  ),
                ),
            ],
          ),
        ),
      ),
    );

    if (feature.upcoming) {
      return GestureDetector(
        onTap: () => AlertService.upcoming(context, feature: label),
        child: card,
      );
    }

    return card;
  }
}
