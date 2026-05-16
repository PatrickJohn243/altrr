import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_bar_back.dart';
import '../../../../core/widgets/section_header.dart';
import '../../controllers/notifications_controller.dart';
import '../../widgets/notification_row.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final _ctrl = NotificationsController.instance;

  @override
  void initState() {
    super.initState();
    _ctrl.addListener(_rebuild);
    // Mark all read when screen opens
    _ctrl.markAllRead();
  }

  @override
  void dispose() {
    _ctrl.removeListener(_rebuild);
    super.dispose();
  }

  void _rebuild() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final today = _ctrl.todayItems;
    final earlier = _ctrl.earlierItems;
    final isEmpty = today.isEmpty && earlier.isEmpty;

    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarBack(),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenPadding),
              child:
                  Text('Notifications', style: AppTypography.screenTitle),
            ),
            const SizedBox(height: AppSpacing.xl),
            Expanded(
              child: isEmpty
                  ? Center(
                      child: Text(
                        'No notifications yet.',
                        style: AppTypography.bodyMedium,
                      ),
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.screenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (today.isNotEmpty) ...[
                            const SectionHeader(label: 'TODAY'),
                            const SizedBox(height: AppSpacing.md),
                            ...today.map((n) => Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: AppSpacing.sm),
                                  child: NotificationRow(
                                    icon: _iconFor(n.type),
                                    title: n.title,
                                    subtitle: n.body,
                                    time: NotificationsController
                                        .relativeTime(n.timestamp),
                                    isUnread: !n.isRead,
                                  ),
                                )),
                          ],
                          if (earlier.isNotEmpty) ...[
                            if (today.isNotEmpty)
                              const SizedBox(height: AppSpacing.xl),
                            const SectionHeader(label: 'EARLIER'),
                            const SizedBox(height: AppSpacing.md),
                            ...earlier.map((n) => Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: AppSpacing.sm),
                                  child: NotificationRow(
                                    icon: _iconFor(n.type),
                                    title: n.title,
                                    subtitle: n.body,
                                    time: NotificationsController
                                        .relativeTime(n.timestamp),
                                    isUnread: !n.isRead,
                                  ),
                                )),
                          ],
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

  static IconData _iconFor(String type) => switch (type) {
        'quest' => Icons.explore_outlined,
        'streak' => Icons.local_fire_department_outlined,
        'title' => Icons.emoji_events_outlined,
        _ => Icons.notifications_outlined,
      };
}
