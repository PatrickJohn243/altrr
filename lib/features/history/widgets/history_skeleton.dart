import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';

class HistorySkeleton extends StatefulWidget {
  const HistorySkeleton({super.key});

  @override
  State<HistorySkeleton> createState() => _HistorySkeletonState();
}

class _HistorySkeletonState extends State<HistorySkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _anim;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _anim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    _opacity = Tween(begin: 0.3, end: 0.7).animate(
      CurvedAnimation(parent: _anim, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _anim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacity,
      builder: (context, _) => Opacity(
        opacity: _opacity.value,
        child: ListView(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenPadding, vertical: AppSpacing.sm),
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            _SectionSkeleton(rows: 3),
            SizedBox(height: AppSpacing.lg),
            _SectionSkeleton(rows: 2),
            SizedBox(height: AppSpacing.lg),
            _SectionSkeleton(rows: 4),
          ],
        ),
      ),
    );
  }
}

class _SectionSkeleton extends StatelessWidget {
  final int rows;
  const _SectionSkeleton({required this.rows});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section label bar
        Row(
          children: [
            _Pill(width: 64, height: 10),
            const SizedBox(width: AppSpacing.md),
            const Expanded(child: _Pill(width: double.infinity, height: 1)),
          ],
        ),
        const SizedBox(height: AppSpacing.itemGap),
        for (int i = 0; i < rows; i++) ...[
          _QuestRowSkeleton(),
          if (i < rows - 1) const SizedBox(height: AppSpacing.itemGap),
        ],
      ],
    );
  }
}

class _QuestRowSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border(
          top: BorderSide(color: AppColors.borderSubtle),
          left: BorderSide(color: AppColors.borderSubtle),
          right: BorderSide(color: AppColors.borderSubtle),
          bottom: BorderSide(color: AppColors.borderSubtle, width: 3),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          // Icon box
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.bgElevated,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(width: 12),
          // Text lines
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Pill(width: 72, height: 8),
                const SizedBox(height: 6),
                _Pill(width: double.infinity, height: 10),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Date pill
          _Pill(width: 40, height: 8),
        ],
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  final double width;
  final double height;
  const _Pill({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.bgElevated,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
