import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import '../../../../core/database/isar_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_bar_back.dart';
import '../../../../core/widgets/streak_card.dart';
import '../../../../shared/models/quest.dart';
import 'widgets/day_column.dart';
import 'widgets/streak_messages.dart';

class StreakScreen extends StatefulWidget {
  const StreakScreen({super.key});

  @override
  State<StreakScreen> createState() => _StreakScreenState();
}

class _StreakScreenState extends State<StreakScreen> {
  final Isar _isar = IsarService.instance;

  bool _loading = true;
  int _streakCount = 0;
  List<StreakDay> _weekDays = _emptyWeek();

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final now = DateTime.now();

    final completed = await _isar.quests
        .filter()
        .statusEqualTo(QuestStatus.completed)
        .sortByCompletedAtDesc()
        .findAll();

    final completedDays = completed
        .where((q) => q.completedAt != null)
        .map((q) => _day(q.completedAt!))
        .toSet();

    final dailyCategoryByDay = <DateTime, String>{};
    for (final q in completed) {
      if (q.completedAt == null) continue;
      if (q.questType != QuestType.daily) continue;
      final d = _day(q.completedAt!);
      dailyCategoryByDay.putIfAbsent(d, () => q.category);
    }

    final sortedDays = completedDays.toList()..sort();

    setState(() {
      _streakCount = _computeStreak(sortedDays, now);
      _weekDays = _buildWeekDays(completedDays, dailyCategoryByDay, now);
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: Column(
          children: [
            AppBarBack(onBack: () => context.pop()),
            Expanded(
              child: _loading
                  ? const SizedBox.shrink()
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.screenPadding,
                          ),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: constraints.maxHeight,
                            ),
                            child: IntrinsicHeight(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: AppSpacing.xl),
                                  _buildHeader(),
                                  const SizedBox(height: AppSpacing.lg),
                                  _buildMessage(),
                                  const SizedBox(height: AppSpacing.xxxl),
                                  _buildDays(),
                                  const Spacer(),
                                  _buildFooter(),
                                  const SizedBox(height: AppSpacing.xxl),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.local_fire_department,
            size: 64, color: AppColors.textMuted),
        const SizedBox(width: AppSpacing.md),
        Text(
          '$_streakCount',
          style: AppTypography.unboundedBlack(52, AppColors.accent),
        ),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            _streakCount == 1 ? 'day' : 'days',
            style: AppTypography.outfitMedium(16, AppColors.textMuted),
          ),
        ),
      ],
    );
  }

  Widget _buildMessage() {
    return Text(
      streakMessage(_streakCount),
      style: AppTypography.outfitMedium(15, AppColors.textMuted),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildDays() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _weekDays.map((d) => DayColumn(day: d)).toList(),
    );
  }

  Widget _buildFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'ALTRR',
          style: AppTypography.unboundedBlack(32, AppColors.textPrimary),
        ),
        const SizedBox(height: 4),
        Text(
          'Alter your reality, one day at a time.',
          style: AppTypography.outfitMedium(13, AppColors.textMuted),
        ),
      ],
    );
  }

  static int _computeStreak(List<DateTime> sortedDays, DateTime now) {
    if (sortedDays.isEmpty) return 0;

    final today = _day(now);
    final yesterday = today.subtract(const Duration(days: 1));

    final newest = sortedDays.last;
    if (newest != today && newest != yesterday) return 0;

    int streak = 1;
    for (int i = sortedDays.length - 2; i >= 0; i--) {
      if (sortedDays[i + 1].difference(sortedDays[i]).inDays == 1) {
        streak++;
      } else {
        break;
      }
    }
    return streak;
  }

  static List<StreakDay> _buildWeekDays(
      Set<DateTime> completedDays,
      Map<DateTime, String> dailyCategoryByDay,
      DateTime now) {
    final today = _day(now);
    final monday = today.subtract(Duration(days: today.weekday - 1));
    const labels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return List.generate(7, (i) {
      final d = monday.add(Duration(days: i));
      final DayStatus status;
      if (d.isAfter(today)) {
        status = DayStatus.empty;
      } else if (d == today) {
        status =
            completedDays.contains(d) ? DayStatus.completed : DayStatus.current;
      } else {
        status =
            completedDays.contains(d) ? DayStatus.completed : DayStatus.missed;
      }
      return StreakDay(
        label: labels[i],
        status: status,
        category: dailyCategoryByDay[d],
      );
    });
  }

  static List<StreakDay> _emptyWeek() {
    const labels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    return labels
        .map((l) => StreakDay(label: l, status: DayStatus.empty))
        .toList();
  }

  static DateTime _day(DateTime dt) => DateTime(dt.year, dt.month, dt.day);
}
