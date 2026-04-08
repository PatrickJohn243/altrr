import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';

/// Dark settings row with a chevron trailing arrow.
class SettingsCard extends StatelessWidget {
  final Widget icon;
  final String label;
  final String sublabel;
  final VoidCallback? onTap;

  const SettingsCard({
    super.key,
    required this.icon,
    required this.label,
    required this.sublabel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _CardShell(
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(AppRadius.card)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.cardPaddingMd,
            vertical: 14,
          ),
          child: Row(
            children: [
              _IconBox(child: icon),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label, style: AppTypography.cardTitle),
                    const SizedBox(height: 2),
                    Text(sublabel, style: AppTypography.bodyMedium),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.textMuted, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}

/// Dark settings row with a toggle switch trailing.
class SettingsToggleCard extends StatelessWidget {
  final Widget icon;
  final String label;
  final String sublabel;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingsToggleCard({
    super.key,
    required this.icon,
    required this.label,
    required this.sublabel,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _CardShell(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.cardPaddingMd,
          vertical: 14,
        ),
        child: Row(
          children: [
            _IconBox(child: icon),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: AppTypography.cardTitle),
                  const SizedBox(height: 2),
                  Text(sublabel, style: AppTypography.bodyMedium),
                ],
              ),
            ),
            Switch(
              value: value,
              onChanged: onChanged,
              activeColor: AppColors.accent,
              activeTrackColor: AppColors.accent,
              inactiveTrackColor: AppColors.bgElevated,
              thumbColor: WidgetStateProperty.all(AppColors.bgPrimary),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardShell extends StatelessWidget {
  final Widget child;
  const _CardShell({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: child,
      ),
    );
  }
}

class _IconBox extends StatelessWidget {
  final Widget child;
  const _IconBox({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: const BoxDecoration(
        color: AppColors.bgElevated,
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.icon)),
      ),
      child: Center(child: child),
    );
  }
}
