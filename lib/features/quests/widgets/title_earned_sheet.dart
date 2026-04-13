import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/grid_background.dart';
import '../../../shared/models/earned_title.dart';

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

  void _share() {
    // TODO: share title
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

                // ── Actions ──────────────────────────────────────────────────
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
                  onTap: _share,
                  child: Text(
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
