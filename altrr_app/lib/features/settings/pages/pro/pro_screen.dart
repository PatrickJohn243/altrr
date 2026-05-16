import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_bar_back.dart';

class ProScreen extends StatefulWidget {
  const ProScreen({super.key});

  @override
  State<ProScreen> createState() => _ProScreenState();
}

class _ProScreenState extends State<ProScreen> {
  bool _yearly = true;

  static const _features = [
    (
      icon: Icons.auto_awesome_outlined,
      label: 'AI Quests',
      detail: 'Personalized quests based on your history and streak',
    ),
    (
      icon: Icons.group_outlined,
      label: 'Online Groups',
      detail: 'Join groups, compare streaks, and see member activity',
    ),
    (
      icon: Icons.bar_chart_rounded,
      label: 'Advanced Stats',
      detail: '30, 90, and 365-day charts with per-category breakdowns',
    ),
    (
      icon: Icons.cloud_sync_outlined,
      label: 'Cloud Sync',
      detail: 'Access your data on any device, always up to date',
    ),
    (
      icon: Icons.shield_outlined,
      label: 'Streak Shield',
      detail: 'Protect one missed day per week without losing your streak',
    ),
    (
      icon: Icons.palette_outlined,
      label: 'Theme Editor',
      detail: 'Pick a custom accent color and alternate card styles',
    ),
    (
      icon: Icons.schedule_outlined,
      label: 'Custom Notifications',
      detail: 'Set exact reminder times and choose which days to be notified',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarBack(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSpacing.lg),

                    // ── Hero ──────────────────────────────────────────────────
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSpacing.cardPadding),
                      decoration: BoxDecoration(
                        color: AppColors.accent,
                        borderRadius: BorderRadius.circular(AppRadius.card),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColors.bgPrimary,
                              borderRadius:
                                  BorderRadius.circular(AppRadius.chip),
                            ),
                            child: Text(
                              'PRO',
                              style: AppTypography.unboundedBlack(
                                      9, AppColors.accent)
                                  .copyWith(letterSpacing: 1.5),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Text(
                            'ALTRR',
                            style:
                                AppTypography.unboundedBlack(36, AppColors.textInverse),
                          ),
                          Text(
                            'Alter more.\nAchieve more.',
                            style: AppTypography.outfitMedium(
                                14, AppColors.questCardTextMuted),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppSpacing.xl),

                    // ── Features ──────────────────────────────────────────────
                    Text(
                      "WHAT YOU GET —",
                      style: AppTypography.sectionLabel,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.bgSurface,
                        borderRadius: BorderRadius.circular(AppRadius.card),
                        border: Border(
                          top: BorderSide(
                              color: AppColors.borderSubtle, width: 1),
                          left: BorderSide(
                              color: AppColors.borderSubtle, width: 1),
                          right: BorderSide(
                              color: AppColors.borderSubtle, width: 1),
                          bottom: BorderSide(
                              color: AppColors.borderSubtle, width: 3),
                        ),
                      ),
                      child: Column(
                        children: List.generate(_features.length, (i) {
                          final f = _features[i];
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppSpacing.cardPaddingMd,
                                    vertical: AppSpacing.md),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        color: AppColors.accentSubtle,
                                        borderRadius: BorderRadius.circular(
                                            AppRadius.icon),
                                        border: Border.all(
                                            color: AppColors.accentDim),
                                      ),
                                      child: Icon(f.icon,
                                          size: 16,
                                          color: AppColors.accent),
                                    ),
                                    const SizedBox(width: AppSpacing.md),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(f.label,
                                              style:
                                                  AppTypography.unboundedBold(
                                                      11,
                                                      AppColors.textPrimary)),
                                          const SizedBox(height: 2),
                                          Text(f.detail,
                                              style: AppTypography.outfitMedium(
                                                  12, AppColors.textMuted)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (i < _features.length - 1)
                                const Divider(
                                    color: AppColors.borderSubtle,
                                    height: 1,
                                    thickness: 1),
                            ],
                          );
                        }),
                      ),
                    ),

                    const SizedBox(height: AppSpacing.xl),

                    // ── Pricing toggle ────────────────────────────────────────
                    Text('CHOOSE A PLAN —', style: AppTypography.sectionLabel),
                    const SizedBox(height: AppSpacing.md),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.bgSurface,
                        borderRadius: BorderRadius.circular(AppRadius.button + 4),
                        border: Border.all(color: AppColors.borderSubtle),
                      ),
                      child: Row(
                        children: [
                          _PlanTab(
                            label: 'Monthly',
                            sublabel: '₱149 / mo',
                            selected: !_yearly,
                            onTap: () => setState(() => _yearly = false),
                          ),
                          _PlanTab(
                            label: 'Yearly',
                            sublabel: '₱999 / yr',
                            selected: _yearly,
                            onTap: () => setState(() => _yearly = true),
                            badge: 'BEST VALUE',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppSpacing.sm),
                    if (_yearly)
                      Center(
                        child: Text(
                          'Save ₱789 compared to monthly',
                          style: AppTypography.outfitMedium(
                              12, AppColors.textMuted),
                        ),
                      ),

                    const SizedBox(height: AppSpacing.xxl),

                    // ── CTA ───────────────────────────────────────────────────
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accent,
                          foregroundColor: AppColors.textInverse,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppRadius.button),
                          ),
                          elevation: 0,
                        ),
                        onPressed: null,
                        child: Text(
                          'Coming Soon',
                          style: AppTypography.ctaButton,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Center(
                      child: TextButton(
                        onPressed: null,
                        child: Text(
                          'Restore purchases',
                          style: AppTypography.outfitMedium(
                              12, AppColors.textMuted),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxl),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanTab extends StatelessWidget {
  final String label;
  final String sublabel;
  final bool selected;
  final VoidCallback onTap;
  final String? badge;

  const _PlanTab({
    required this.label,
    required this.sublabel,
    required this.selected,
    required this.onTap,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: selected ? AppColors.accent : Colors.transparent,
            borderRadius: BorderRadius.circular(AppRadius.button),
          ),
          child: Column(
            children: [
              if (badge != null) ...[
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: selected
                        ? AppColors.bgPrimary
                        : AppColors.accentSubtle,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    badge!,
                    style: AppTypography.unboundedBlack(
                            7,
                            selected
                                ? AppColors.accent
                                : AppColors.accent)
                        .copyWith(letterSpacing: 0.5),
                  ),
                ),
                const SizedBox(height: 4),
              ],
              Text(
                label,
                style: AppTypography.unboundedBold(
                  11,
                  selected ? AppColors.textInverse : AppColors.textMuted,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                sublabel,
                style: AppTypography.outfitMedium(
                  12,
                  selected ? AppColors.textInverse : AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
