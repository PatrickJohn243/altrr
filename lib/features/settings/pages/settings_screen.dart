import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/app_bar_main.dart';
import '../../../core/widgets/navbar.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/settings_card.dart';
import '../../../core/services/alert_service.dart';
import '../controllers/settings_controller.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final SettingsController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SettingsController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: Column(
          children: [
            AppBarMain(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionHeader(label: 'PREFERENCES'),
                    const SizedBox(height: AppSpacing.md),
                    SettingsCard(
                      icon: const Icon(Icons.person_outline,
                          color: AppColors.textMuted, size: 18),
                      label: 'Edit profile',
                      sublabel: 'Update your name and details',
                      onTap: () => context.push('/edit-profile'),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    SettingsCard(
                      icon: const Icon(Icons.download_outlined,
                          color: AppColors.textMuted, size: 18),
                      label: 'Export my records',
                      sublabel: 'Download your quest history',
                      onTap: () {},
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    SettingsCard(
                      icon: const Icon(Icons.tune_outlined,
                          color: AppColors.textMuted, size: 18),
                      label: 'Quest preferences',
                      sublabel: 'Customize your quest types',
                      onTap: () {},
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    ListenableBuilder(
                      listenable: _controller,
                      builder: (context, _) => Column(
                        children: [
                          SettingsToggleCard(
                            icon: const Icon(
                                Icons.local_fire_department_outlined,
                                color: AppColors.textMuted,
                                size: 18),
                            label: 'Streak reminder',
                            sublabel: 'Get notified before your streak breaks',
                            value: _controller.streakReminder,
                            onChanged: _controller.setStreakReminder,
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          SettingsToggleCard(
                            icon: const Icon(Icons.notifications_outlined,
                                color: AppColors.textMuted, size: 18),
                            label: 'Daily reminder',
                            sublabel: 'Remind me to check my quest',
                            value: _controller.dailyReminder,
                            onChanged: _controller.setDailyReminder,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxxl),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => AlertService.show(
                          context,
                          title: 'Sign out?',
                          message: 'You will be returned to the start.',
                          actions: [
                            AlertAction(
                              label: 'Sign out',
                              style: AlertActionStyle.danger,
                              onTap: () {}, // TODO: implement sign out
                            ),
                            AlertAction(label: 'Cancel'),
                          ],
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.textDisabled,
                          side: const BorderSide(color: AppColors.borderMid),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppRadius.button),
                          ),
                        ),
                        child: Text(
                          'Sign out',
                          style: AppTypography.unboundedBold(
                              12, AppColors.textDisabled),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    Center(
                        child:
                            Text('Altrr v1.0.0', style: AppTypography.caption)),
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
