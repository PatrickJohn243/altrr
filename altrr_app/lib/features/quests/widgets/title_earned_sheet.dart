import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/grid_background.dart';
import '../../../shared/models/earned_title.dart';
import '../../../shared/services/share_service.dart';
import 'title_share_card.dart';

/// Full-screen title-earned page — lime background, grid overlay.
///
/// Pass a list of [EarnedTitle] objects. When there are multiple titles
/// the user pages through them with Next / Done.
///
/// Usage:
/// ```dart
/// TitleEarnedSheet.show(context, titles: controller.lastEarnedTitles);
/// ```
class TitleEarnedSheet extends StatefulWidget {
  final List<EarnedTitle> titles;
  const TitleEarnedSheet({super.key, required this.titles});

  static Future<void> show(
    BuildContext context, {
    required List<EarnedTitle> titles,
  }) {
    if (titles.isEmpty) return Future.value();
    return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 340),
      transitionBuilder: (_, anim, __, child) {
        final curve = CurvedAnimation(
          parent: anim,
          curve: Curves.easeOutCubic,
        );
        return FadeTransition(
          opacity: curve,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.06),
              end: Offset.zero,
            ).animate(curve),
            child: child,
          ),
        );
      },
      pageBuilder: (_, __, ___) => TitleEarnedSheet(titles: titles),
    );
  }

  @override
  State<TitleEarnedSheet> createState() => _TitleEarnedSheetState();
}

class _TitleEarnedSheetState extends State<TitleEarnedSheet> {
  int _index = 0;
  bool _sharing = false;

  EarnedTitle get _current => widget.titles[_index];
  bool get _isLast => _index == widget.titles.length - 1;

  void _next() {
    if (_isLast) {
      Navigator.of(context).pop();
    } else {
      setState(() => _index++);
    }
  }

  void _viewDetails(BuildContext context) {
    Navigator.of(context).pop();
    context.push('/title', extra: _current);
  }

  Future<void> _share() async {
    setState(() => _sharing = true);
    try {
      await showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (_) => _TitleSharePreviewSheet(title: _current),
      );
    } finally {
      if (mounted) setState(() => _sharing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isGacha = _current.titleType == TitleType.gacha;

    return Scaffold(
      backgroundColor: AppColors.accent,
      body: GridBackground(
            squareSize: 28,
            lineColor: const Color(0x15121212),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenPadding,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Branding
                    Text(
                      'ALTRR',
                      textAlign: TextAlign.center,
                      style: AppTypography.unboundedBlack(
                        16,
                        AppColors.questCardTextMuted,
                      ).copyWith(letterSpacing: 4),
                    ),
                    // Title text
                    Text(
                      _current.titleText,
                      textAlign: TextAlign.center,
                      style: AppTypography.unboundedBlack(
                        34,
                        AppColors.textInverse,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),

                    // Subtext
                    _buildSubtext(isGacha),

                    // Pagination dots (only when multiple titles)
                    if (widget.titles.length > 1) ...[
                      const SizedBox(height: AppSpacing.xxxl),
                      _PaginationDots(
                        count: widget.titles.length,
                        active: _index,
                      ),
                    ],

                    const SizedBox(height: AppSpacing.xxxl),

                    // ── Actions ────────────────────────────────────────────
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.bgPrimary,
                          foregroundColor: AppColors.accent,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppRadius.button),
                          ),
                        ),
                        onPressed: _next,
                        child: Text(
                          _isLast ? 'Got it' : 'Next',
                          style: AppTypography.unboundedBold(13, AppColors.accent),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),

                    GestureDetector(
                      onTap: _sharing ? null : _share,
                      child: _sharing
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.questCardTextDim,
                              ),
                            )
                          : Text(
                              'Share',
                              style: AppTypography.outfitMedium(
                                14,
                                AppColors.questCardTextDim,
                              ).copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.questCardTextDim,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  // ── Subwidgets ─────────────────────────────────────────────────────────────

  Widget _buildSubtext(bool isGacha) {
    if (isGacha) {
      return Text(
        _current.gachaSubtext ?? '',
        textAlign: TextAlign.center,
        style: AppTypography.outfitMedium(16, AppColors.questCardTextMuted),
      );
    }
    return Column(
      children: [
        if (_current.subtextA != null)
          Text(
            _current.subtextA!,
            textAlign: TextAlign.center,
            style: AppTypography.outfitMedium(16, AppColors.questCardTextMuted)
                .copyWith(fontStyle: FontStyle.italic),
          ),
        if (_current.subtextA != null && _current.subtextB != null)
          const SizedBox(height: AppSpacing.xs),
        if (_current.subtextB != null)
          Text(
            _current.subtextB!,
            textAlign: TextAlign.center,
            style: AppTypography.outfitSemiBold(16, AppColors.textInverse),
          ),
      ],
    );
  }
}

// ── Title share preview sheet ─────────────────────────────────────────────────

class _TitleSharePreviewSheet extends StatefulWidget {
  final EarnedTitle title;
  const _TitleSharePreviewSheet({required this.title});

  @override
  State<_TitleSharePreviewSheet> createState() =>
      _TitleSharePreviewSheetState();
}

class _TitleSharePreviewSheetState extends State<_TitleSharePreviewSheet> {
  final _cardKey = GlobalKey();
  bool _exporting = false;

  Future<void> _export() async {
    setState(() => _exporting = true);
    try {
      await ShareService.shareQuestCard(
        _cardKey,
        filename: 'altrr_title.png',
      );
    } finally {
      if (mounted) setState(() => _exporting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        border: Border(
          top: BorderSide(color: AppColors.borderMid),
          left: BorderSide(color: AppColors.borderMid),
          right: BorderSide(color: AppColors.borderMid),
        ),
      ),
      padding: EdgeInsets.fromLTRB(
        AppSpacing.screenPadding,
        AppSpacing.xl,
        AppSpacing.screenPadding,
        AppSpacing.screenPadding + MediaQuery.of(context).padding.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.borderMid,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          // Label
          Row(
            children: [
              Text(
                'SHARE CARD',
                style: AppTypography.unboundedBold(9, AppColors.textMuted)
                    .copyWith(letterSpacing: 1.0),
              ),
              const SizedBox(width: AppSpacing.md),
              const Expanded(
                child: Divider(color: AppColors.borderSubtle),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),

          // Card preview
          RepaintBoundary(
            key: _cardKey,
            child: TitleShareCard(title: widget.title),
          ),

          const SizedBox(height: AppSpacing.xxl),

          // Export button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                foregroundColor: AppColors.textInverse,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppRadius.button)),
                ),
                elevation: 0,
              ),
              onPressed: _exporting ? null : _export,
              child: _exporting
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.textInverse,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.ios_share_outlined, size: 16),
                        const SizedBox(width: 8),
                        Text('Share image', style: AppTypography.ctaButton),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Pagination dots ───────────────────────────────────────────────────────────

class _PaginationDots extends StatelessWidget {
  final int count;
  final int active;

  const _PaginationDots({required this.count, required this.active});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final isActive = i == active;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(right: 6),
          width: isActive ? 20 : 6,
          height: 6,
          decoration: BoxDecoration(
            color: isActive ? AppColors.textInverse : const Color(0x40121212),
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }
}
