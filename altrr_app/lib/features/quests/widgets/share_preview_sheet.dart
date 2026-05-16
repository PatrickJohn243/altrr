import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/models/quest.dart';
import '../../../shared/services/share_service.dart';
import 'quest_share_card.dart';

class SharePreviewSheet extends StatefulWidget {
  final Quest quest;
  final String? timeSpent;
  final String? where;
  final List<String> emotions;

  const SharePreviewSheet({
    super.key,
    required this.quest,
    this.timeSpent,
    this.where,
    this.emotions = const [],
  });

  @override
  State<SharePreviewSheet> createState() => _SharePreviewSheetState();
}

class _SharePreviewSheetState extends State<SharePreviewSheet> {
  final _cardKey = GlobalKey();
  bool _exporting = false;

  Future<void> _export() async {
    setState(() => _exporting = true);
    try {
      await ShareService.shareQuestCard(_cardKey);
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
          RepaintBoundary(
            key: _cardKey,
            child: QuestShareCard(
              title: widget.quest.title,
              description: widget.quest.description,
              category: widget.quest.category,
              completedAt: widget.quest.completedAt ?? DateTime.now(),
              timeSpent: widget.timeSpent,
              where: widget.where,
              emotions: widget.emotions,
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
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
