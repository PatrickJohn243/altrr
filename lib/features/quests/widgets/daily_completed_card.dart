import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';

class DailyCompletedCard extends StatefulWidget {
  const DailyCompletedCard({super.key});

  @override
  State<DailyCompletedCard> createState() => _DailyCompletedCardState();
}

class _DailyCompletedCardState extends State<DailyCompletedCard> {
  Timer? _ticker;
  Duration _untilMidnight = Duration.zero;

  @override
  void initState() {
    super.initState();
    _update();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) => _update());
  }

  void _update() {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day + 1);
    if (mounted) setState(() => _untilMidnight = midnight.difference(now));
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  String get _countdown {
    final h = _untilMidnight.inHours;
    final m = _untilMidnight.inMinutes % 60;
    final s = _untilMidnight.inSeconds % 60;
    return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: AppColors.accentSubtle,
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppRadius.icon)),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check_rounded,
                      size: 18,
                      color: AppColors.accent,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Text(
                  'Quest complete.',
                  style: AppTypography.unboundedBold(14, AppColors.textPrimary),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'You showed up. Rest up — the next quest arrives at midnight.',
              style: AppTypography.outfitMedium(13, AppColors.textMuted),
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              children: [
                Text(
                  'NEXT QUEST IN',
                  style: AppTypography.sectionLabel,
                ),
                const SizedBox(width: AppSpacing.md),
                Text(
                  _countdown,
                  style: AppTypography.unboundedBold(12, AppColors.accent),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
