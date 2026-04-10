import 'package:flutter/material.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_bar_back.dart';
import '../../../../core/widgets/section_header.dart';
import '../../widgets/notification_row.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarBack(),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenPadding),
              child: Text('Notifications', style: AppTypography.screenTitle),
            ),
            const SizedBox(height: AppSpacing.xl),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionHeader(label: 'TODAY'),
                    const SizedBox(height: AppSpacing.md),
                    const NotificationRow(
                      icon: Icons.explore_outlined,
                      title: 'New quest assigned',
                      subtitle:
                          "Your quest for today is ready — don't let it expire.",
                      time: '2m ago',
                      isUnread: true,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    const NotificationRow(
                      icon: Icons.local_fire_department_outlined,
                      title: 'Streak at risk',
                      subtitle:
                          'You have 2 hours left to keep your 7-day streak alive.',
                      time: '1h ago',
                      isUnread: true,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    const NotificationRow(
                      icon: Icons.emoji_events_outlined,
                      title: 'Title earned',
                      subtitle:
                          'You unlocked "The Connector" — People category.',
                      time: '3h ago',
                      isUnread: false,
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    const SectionHeader(label: 'EARLIER'),
                    const SizedBox(height: AppSpacing.md),
                    const NotificationRow(
                      icon: Icons.timer_outlined,
                      title: 'Quest expiring soon',
                      subtitle:
                          '"Strike up a conversation" was expiring — hope you did it.',
                      time: 'Yesterday',
                      isUnread: false,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    const NotificationRow(
                      icon: Icons.explore_outlined,
                      title: 'New quest assigned',
                      subtitle: 'A new quest was waiting for you yesterday.',
                      time: 'Yesterday',
                      isUnread: false,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    const NotificationRow(
                      icon: Icons.local_fire_department_outlined,
                      title: '7-day streak reached',
                      subtitle:
                          "You've been showing up for 7 days straight. Keep going.",
                      time: '2 days ago',
                      isUnread: false,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    const NotificationRow(
                      icon: Icons.emoji_events_outlined,
                      title: 'Title earned',
                      subtitle: 'You unlocked "The Taster" — Food category.',
                      time: '3 days ago',
                      isUnread: false,
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

const _bg = Color(0xFF121212);
