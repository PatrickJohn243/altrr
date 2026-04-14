import 'dart:math';
import 'package:flutter/material.dart';
import '../../shared/generation/tooltip/tooltip_phrases.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';
import 'grid_background.dart';

/// Lime quest display card — shown on home screen.
class QuestDisplayCard extends StatefulWidget {
  final String questTitle;
  final String description;
  final String expiryText;
  final String category;
  final int questsInCategory;
  final bool assignedByAltrr;
  final VoidCallback? onComplete;
  final VoidCallback? onSkip;

  const QuestDisplayCard({
    super.key,
    required this.questTitle,
    required this.description,
    required this.expiryText,
    required this.category,
    this.questsInCategory = 0,
    this.assignedByAltrr = true,
    this.onComplete,
    this.onSkip,
  });

  @override
  State<QuestDisplayCard> createState() => _QuestDisplayCardState();
}

class _QuestDisplayCardState extends State<QuestDisplayCard> {
  final _infoKey = GlobalKey();
  final _random = Random();

  OverlayEntry? _overlay;
  _TooltipContent? _content;

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _onInfoTap() {
    // Pick a random type (0=encouragement, 1=progress, 2=skip).
    final type = _random.nextInt(3);
    _content = switch (type) {
      0 => _TooltipContent.encouragement(
          TooltipPhrases.encouragement[
              _random.nextInt(TooltipPhrases.encouragement.length)],
        ),
      1 => _TooltipContent.progress(
          category: widget.category,
          count: widget.questsInCategory,
        ),
      _ => _TooltipContent.skip(
          TooltipPhrases.skipReminders[
              _random.nextInt(TooltipPhrases.skipReminders.length)],
        ),
    };
    _showTooltip();
  }

  void _showTooltip() {
    _removeOverlay();

    final box = _infoKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) return;

    final offset = box.localToGlobal(Offset.zero);
    final btnSize = box.size;
    final screen = MediaQuery.of(context).size;
    const tooltipWidth = 248.0;

    final rawLeft = offset.dx + btnSize.width - tooltipWidth;
    final left = rawLeft.clamp(12.0, screen.width - tooltipWidth - 12);
    final bottom = screen.height - offset.dy + 10;

    _overlay = OverlayEntry(
      builder: (_) => Stack(
        children: [
          // Barrier — dismiss on tap outside
          Positioned.fill(
            child: GestureDetector(
              onTap: _removeOverlay,
              behavior: HitTestBehavior.opaque,
              child: const SizedBox.expand(),
            ),
          ),
          // Tooltip card
          Positioned(
            left: left,
            bottom: bottom,
            width: tooltipWidth,
            child: Material(
              color: Colors.transparent,
              child: _TooltipCard(content: _content!),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlay!);
  }

  void _removeOverlay() {
    _overlay?.remove();
    _overlay = null;
  }

  @override
  Widget build(BuildContext context) {
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
                // Assigned-by indicator
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: AppColors.questCardTextMuted,
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppRadius.dot)),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.assignedByAltrr
                          ? 'Assigned by ALTRR'
                          : 'Anonymously assigned',
                      style: AppTypography.outfitSemiBold(
                          10, AppColors.questCardTextMuted),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                // Quest title
                Text(
                  widget.questTitle,
                  style: AppTypography.questTitle,
                ),
                const SizedBox(height: AppSpacing.lg),
                // "What you're doing" box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 11),
                  decoration: const BoxDecoration(
                    color: AppColors.questCardOverlay,
                    borderRadius: BorderRadius.all(Radius.circular(11)),
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
                      Text(
                        widget.description,
                        style: AppTypography.questDescription,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                // Footer: expiry + info + complete
                Row(
                  children: [
                    const Icon(Icons.access_time,
                        size: 12, color: AppColors.textInverse),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        widget.expiryText,
                        style: AppTypography.outfitMedium(
                            12, AppColors.textInverse),
                      ),
                    ),
                    // Info button
                    GestureDetector(
                      key: _infoKey,
                      onTap: _onInfoTap,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: AppColors.bgElevated,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(14)),
                          border: Border.all(color: AppColors.borderMid),
                        ),
                        child: const Icon(Icons.info_outline,
                            size: 12, color: AppColors.textMuted),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    // Complete button
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

// ── Tooltip content model ─────────────────────────────────────────────────────

enum _ContentType { encouragement, progress, skip }

class _TooltipContent {
  final _ContentType type;
  final String? phrase;
  final String? category;
  final int count;

  const _TooltipContent._({
    required this.type,
    this.phrase,
    this.category,
    this.count = 0,
  });

  factory _TooltipContent.encouragement(String phrase) =>
      _TooltipContent._(type: _ContentType.encouragement, phrase: phrase);

  factory _TooltipContent.progress({
    required String category,
    required int count,
  }) =>
      _TooltipContent._(
          type: _ContentType.progress, category: category, count: count);

  factory _TooltipContent.skip(String phrase) =>
      _TooltipContent._(type: _ContentType.skip, phrase: phrase);
}

// ── Tooltip card ──────────────────────────────────────────────────────────────

class _TooltipCard extends StatelessWidget {
  final _TooltipContent content;

  const _TooltipCard({required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.cardPaddingMd),
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: AppColors.borderSubtle),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 16,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: switch (content.type) {
        _ContentType.encouragement => _buildEncouragement(),
        _ContentType.progress      => _buildProgress(),
        _ContentType.skip          => _buildSkip(),
      },
    );
  }

  Widget _buildEncouragement() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            content.phrase!,
            style: AppTypography.outfitMedium(12, AppColors.textPrimary),
          ),
          const SizedBox(height: 4),
          Text(
            '— altrr',
            style: AppTypography.outfitMedium(11, AppColors.textMuted),
          ),
        ],
      );

  Widget _buildProgress() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "You've completed ${content.count} ${content.category!.toLowerCase()} quests.",
            style: AppTypography.outfitMedium(12, AppColors.textPrimary),
          ),
          const SizedBox(height: 4),
          Text(
            TooltipPhrases.categoryPostText(content.count),
            style: AppTypography.outfitMedium(12, AppColors.textMuted),
          ),
        ],
      );

  Widget _buildSkip() => RichText(
        text: TextSpan(
          style: AppTypography.outfitMedium(12, AppColors.textMuted),
          children: _buildSkipSpans(content.phrase!),
        ),
      );

  List<TextSpan> _buildSkipSpans(String text) {
    final spans = <TextSpan>[];
    final regex = RegExp(r'[Ss]kip\w*');
    int last = 0;
    for (final match in regex.allMatches(text)) {
      if (match.start > last) {
        spans.add(TextSpan(text: text.substring(last, match.start)));
      }
      spans.add(TextSpan(
        text: match.group(0),
        style: const TextStyle(color: AppColors.danger),
      ));
      last = match.end;
    }
    if (last < text.length) {
      spans.add(TextSpan(text: text.substring(last)));
    }
    return spans;
  }
}
