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

// ── Milestone message pools ───────────────────────────────────────────────────

const _msgDay1 = [
  'The first day is the hardest.\nYou showed up.',
  'One day in.\nEvery streak starts right here.',
  'Day one done.\nLet\'s see where this goes.',
];

const _msgEarly = [
  'Keep showing up.\nIt\'s working.',
  'The habit is forming.\nDon\'t let it slip.',
  'A few days in.\nYou\'re building something.',
];

const _msgDay10 = [
  'Ten days.\nYou\'re not stopping.',
  'Double digits.\nKeep going.',
  'Ten in a row.\nThis is getting real.',
];

const _msgDay20 = [
  'Twenty days.\nThat\'s real discipline.',
  'Three weeks of showing up.\nNice.',
  'Day twenty.\nYou\'re consistent now.',
];

const _msgDay50 = [
  'Fifty days.\nMost people quit at one.',
  'You\'ve made this part of who you are.',
  'Fifty days in.\nThis is just your life now.',
];

String _getMessage(int streak) {
  final List<String> pool;
  if (streak <= 1) {
    pool = _msgDay1;
  } else if (streak < 10) {
    pool = _msgEarly;
  } else if (streak < 20) {
    pool = _msgDay10;
  } else if (streak < 50) {
    pool = _msgDay20;
  } else {
    pool = _msgDay50;
  }
  return pool[streak % pool.length];
}

// ── Screen ────────────────────────────────────────────────────────────────────

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

    final sortedDays = completedDays.toList()..sort();

    setState(() {
      _streakCount = _computeStreak(sortedDays, now);
      _weekDays = _buildWeekDays(completedDays, now);
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

  // ── Header: 🔥 + days ────────────────────────────────────────────────────────

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

  // ── Motivational text ─────────────────────────────────────────────────────────

  Widget _buildMessage() {
    return Text(
      _getMessage(_streakCount),
      style: AppTypography.outfitMedium(15, AppColors.textMuted),
      textAlign: TextAlign.center,
    );
  }

  // ── Day bars ──────────────────────────────────────────────────────────────────

  Widget _buildDays() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _weekDays.map((d) => _DayColumn(day: d)).toList(),
    );
  }

  // ── Footer ────────────────────────────────────────────────────────────────────

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

  // ── Helpers ───────────────────────────────────────────────────────────────────

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
      Set<DateTime> completedDays, DateTime now) {
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
      return StreakDay(label: labels[i], status: status);
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

// ── Day column: rounded box + letter ─────────────────────────────────────────

class _DayColumn extends StatelessWidget {
  final StreakDay day;
  const _DayColumn({required this.day});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _box(),
        const SizedBox(height: 8),
        Text(
          day.label,
          style: AppTypography.outfitSemiBold(12, AppColors.textMuted),
        ),
      ],
    );
  }

  Widget _box() {
    switch (day.status) {
      case DayStatus.completed:
        return Container(
          width: 40,
          height: 44,
          decoration: const BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        );
      case DayStatus.current:
        return Container(
          width: 40,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: AppColors.accentDim, width: 1.5),
          ),
        );
      case DayStatus.missed:
      case DayStatus.empty:
        return Container(
          width: 40,
          height: 44,
          decoration: const BoxDecoration(
            color: AppColors.bgEmpty,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        );
    }
  }
}
