import 'dart:async';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';
import 'grid_background.dart';

class BreakStateCard extends StatefulWidget {
  final VoidCallback? onEndEarly;

  const BreakStateCard({super.key, this.onEndEarly});

  @override
  State<BreakStateCard> createState() => _BreakStateCardState();
}

class _BreakStateCardState extends State<BreakStateCard> {
  Timer? _timer;

  static const _restTitles = [
    'Rest, fully.',
    'Let the day pass quietly.',
    'Be still for now.',
    'Today belongs to recovery.',
    'Take this time for yourself.',
  ];

  static const _restDescriptions = [
    "You've been carrying a lot. Set it down for today. The quests will wait.",
    "Recovery isn't weakness — it's how you return stronger. Give yourself this.",
    "Some days the bravest thing is to rest. This is one of those days.",
    "There is nothing to prove today. Simply exist, breathe, and let yourself recover.",
    "Stillness is its own kind of progress. Let today be gentle.",
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _nextQuestText {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day + 1);
    final remaining = midnight.difference(now);
    final h = remaining.inHours;
    final m = remaining.inMinutes % 60;
    if (h >= 1) return 'Next quest in ${h}h ${m}m';
    return 'Next quest in ${m}m';
  }

  @override
  Widget build(BuildContext context) {
    final dayIndex = DateTime.now().day % _restTitles.length;
    final restTitle = _restTitles[dayIndex];
    final restDesc = _restDescriptions[dayIndex];

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.card)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Lime top (Lyra's assignment) ──────────────────────────────
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.accent,
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(AppRadius.card)),
            ),
            child: GridBackground(
              squareSize: 28,
              lineColor: AppColors.questCardOverlay,
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.cardPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: AppColors.questCardTextMuted,
                            borderRadius: BorderRadius.all(
                                Radius.circular(AppRadius.dot)),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Assigned by Lyra',
                          style: AppTypography.outfitSemiBold(
                              12, AppColors.questCardTextMuted),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(restTitle, style: AppTypography.questTitle),
                  ],
                ),
              ),
            ),
          ),
          // ── Dark bottom ───────────────────────────────────────────────
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.cardPadding),
            decoration: const BoxDecoration(
              color: AppColors.bgPrimary,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(AppRadius.card)),
              border: Border(
                top: BorderSide(color: AppColors.borderSubtle),
                left: BorderSide(color: AppColors.borderSubtle),
                right: BorderSide(color: AppColors.borderSubtle),
                bottom: BorderSide(color: AppColors.borderSubtle, width: 3),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'REST MODE',
                  style: AppTypography.outfitBold(10, const Color(0x73C8F135))
                      .copyWith(letterSpacing: 0.9),
                ),
                const SizedBox(height: 4),
                Text(restDesc,
                    style:
                        AppTypography.outfitSemiBold(16, AppColors.textPrimary)),
                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    const Icon(Icons.access_time,
                        size: 12, color: AppColors.textMuted),
                    const SizedBox(width: 5),
                    Text(_nextQuestText, style: AppTypography.bodyMedium),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                if (widget.onEndEarly != null)
                  GestureDetector(
                    onTap: widget.onEndEarly,
                    child: Text(
                      'End break early',
                      style: AppTypography.outfitSemiBold(
                              12, AppColors.textMuted)
                          .copyWith(decoration: TextDecoration.underline),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
