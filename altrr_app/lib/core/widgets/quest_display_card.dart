import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../../shared/generation/tooltip/tooltip_phrases.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';
import 'grid_background.dart';
import 'quest_tooltip.dart';

class QuestDisplayCard extends StatefulWidget {
  final String questTitle;
  final String description;
  final DateTime expiresAt;
  final String category;
  final int questsInCategory;
  final String? characterName;
  final VoidCallback? onComplete;
  final VoidCallback? onSkip;
  final VoidCallback? onTap;

  const QuestDisplayCard({
    super.key,
    required this.questTitle,
    required this.description,
    required this.expiresAt,
    required this.category,
    this.questsInCategory = 0,
    this.characterName,
    this.onComplete,
    this.onSkip,
    this.onTap,
  });

  @override
  State<QuestDisplayCard> createState() => _QuestDisplayCardState();
}

class _QuestDisplayCardState extends State<QuestDisplayCard> {
  final _tooltipKey = GlobalKey<TooltipState>();
  final _random = Random();
  TooltipContent _content =
      TooltipContent.encouragement(TooltipPhrases.encouragement[0]);
  Timer? _timer;

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

  String get _expiryText {
    final remaining = widget.expiresAt.difference(DateTime.now());
    if (remaining.isNegative) return 'Expired';
    final h = remaining.inHours;
    final m = remaining.inMinutes % 60;
    final s = remaining.inSeconds % 60;
    if (h >= 1) return 'Expires in ${h}h ${m}m';
    if (m >= 1) return 'Expires in ${m}m ${s}s';
    return 'Expires in ${s}s';
  }

  void _onInfoTap() {
    final type = _random.nextInt(3);
    final content = switch (type) {
      0 => TooltipContent.encouragement(TooltipPhrases.encouragement[
          _random.nextInt(TooltipPhrases.encouragement.length)]),
      1 => TooltipContent.progress(
          category: widget.category,
          count: widget.questsInCategory,
        ),
      _ => TooltipContent.skip(TooltipPhrases.skipReminders[
          _random.nextInt(TooltipPhrases.skipReminders.length)]),
    };
    setState(() => _content = content);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tooltipKey.currentState?.ensureTooltipVisible();
    });
  }

  Widget _buildTooltipContent() {
    return switch (_content.type) {
      TooltipContentType.encouragement => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_content.phrase!,
                style: AppTypography.outfitMedium(12, AppColors.textPrimary)),
            const SizedBox(height: 4),
            Text('— altrr',
                style: AppTypography.outfitMedium(11, AppColors.textMuted)),
          ],
        ),
      TooltipContentType.progress => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "You've completed ${_content.count} ${_content.category!.toLowerCase()} quests.",
              style: AppTypography.outfitMedium(12, AppColors.textPrimary),
            ),
            const SizedBox(height: 4),
            Text(
              TooltipPhrases.categoryPostText(_content.count),
              style: AppTypography.outfitMedium(12, AppColors.textMuted),
            ),
          ],
        ),
      TooltipContentType.skip => RichText(
          text: TextSpan(
            style: AppTypography.outfitMedium(12, AppColors.textMuted),
            children: _buildSkipSpans(_content.phrase!),
          ),
        ),
    };
  }

  List<TextSpan> _buildSkipSpans(String text) {
    final spans = <TextSpan>[];
    final regex = RegExp(r'[Ss]kip\w*');
    int last = 0;
    for (final match in regex.allMatches(text)) {
      if (match.start > last)
        spans.add(TextSpan(text: text.substring(last, match.start)));
      spans.add(TextSpan(
        text: match.group(0),
        style: const TextStyle(color: AppColors.danger),
      ));
      last = match.end;
    }
    if (last < text.length) spans.add(TextSpan(text: text.substring(last)));
    return spans;
  }

  @override
  Widget build(BuildContext context) {
    final expired = widget.expiresAt.isBefore(DateTime.now());

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.card)),
      child: Container(
        width: double.infinity,
        color: AppColors.accent,
        child: GridBackground(
          squareSize: 28,
          lineColor: const Color(0x15121212),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.cardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: widget.onTap,
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
                            widget.characterName != null
                                ? 'Assigned by ${widget.characterName}'
                                : 'Anonymously assigned',
                            style: AppTypography.outfitSemiBold(
                                10, AppColors.questCardTextMuted),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(widget.questTitle, style: AppTypography.questTitle),
                      const SizedBox(height: AppSpacing.lg),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 11),
                        decoration: const BoxDecoration(
                          color: AppColors.questCardOverlay,
                          borderRadius:
                              BorderRadius.all(Radius.circular(11)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "WHAT YOU'RE DOING —",
                              style: AppTypography.outfitBold(
                                      12, AppColors.questCardTextDim)
                                  .copyWith(letterSpacing: 0.9),
                            ),
                            const SizedBox(height: 3),
                            Text(widget.description,
                                style: AppTypography.questDescription),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      expired
                          ? Icons.timer_off_outlined
                          : Icons.access_time,
                      size: 12,
                      color: expired
                          ? AppColors.textInverse
                          : AppColors.textInverse,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        _expiryText,
                        style: AppTypography.outfitMedium(
                            12,
                            expired
                                ? AppColors.textInverse
                                : AppColors.textInverse),
                      ),
                    ),
                    Tooltip(
                      key: _tooltipKey,
                      triggerMode: TooltipTriggerMode.manual,
                      preferBelow: false,
                      showDuration: const Duration(seconds: 4),
                      decoration: BoxDecoration(
                        color: AppColors.bgSurface,
                        borderRadius:
                            BorderRadius.circular(AppRadius.card),
                        border:
                            Border.all(color: AppColors.borderSubtle),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x33000000),
                            blurRadius: 16,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(AppSpacing.cardPaddingMd),
                      richMessage: WidgetSpan(
                        child: SizedBox(
                            width: 220,
                            child: _buildTooltipContent()),
                      ),
                      child: GestureDetector(
                        onTap: _onInfoTap,
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: AppColors.bgElevated,
                            borderRadius: const BorderRadius.all(
                                Radius.circular(14)),
                            border:
                                Border.all(color: AppColors.borderMid),
                          ),
                          child: const Icon(Icons.info_outline,
                              size: 12, color: AppColors.textMuted),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.bgPrimary,
                        foregroundColor: AppColors.accent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 9),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppRadius.button)),
                        ),
                        elevation: 0,
                      ),
                      onPressed: widget.onComplete,
                      child: Text(
                        'Complete',
                        style: AppTypography.ctaButton
                            .copyWith(color: AppColors.accent),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
