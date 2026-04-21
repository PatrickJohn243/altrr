import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/database/isar_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/services/alert_service.dart';
import '../../../../core/widgets/app_bar_back.dart';
import '../../../../shared/models/character.dart';
import '../../../../shared/models/quest.dart';

class ChallengeQuestScreen extends StatefulWidget {
  final Quest quest;

  const ChallengeQuestScreen({super.key, required this.quest});

  @override
  State<ChallengeQuestScreen> createState() => _ChallengeQuestScreenState();
}

class _ChallengeQuestScreenState extends State<ChallengeQuestScreen> {
  Character? _character;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _loadCharacter();
    _timer = Timer.periodic(const Duration(seconds: 60), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _loadCharacter() async {
    final cid = widget.quest.characterId;
    if (cid == null) return;
    final character = await IsarService.instance.characters.get(cid);
    if (mounted) setState(() => _character = character);
  }

  String get _remainingText {
    final remaining = widget.quest.expiresAt.difference(DateTime.now());
    if (remaining.isNegative) return 'Expired';
    final d = remaining.inDays;
    final h = remaining.inHours % 24;
    if (d >= 1) return '$d day${d != 1 ? 's' : ''} ${h}h remaining';
    final m = remaining.inMinutes % 60;
    if (h >= 1) return '${h}h ${m}m remaining';
    return '${remaining.inMinutes}m remaining';
  }

  String _formatDate(DateTime dt) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
  }

  @override
  Widget build(BuildContext context) {
    final quest = widget.quest;

    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarBack(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Lime header ────────────────────────────────────────
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSpacing.cardPadding),
                      decoration: const BoxDecoration(
                        color: AppColors.accent,
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(AppRadius.card)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: AppColors.questCardOverlay,
                                  borderRadius:
                                      BorderRadius.circular(AppRadius.chip),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.flag_rounded,
                                        size: 10,
                                        color: AppColors.questCardTextMuted),
                                    const SizedBox(width: 4),
                                    Text(
                                      'CHALLENGE',
                                      style: AppTypography.unboundedBold(
                                              8,
                                              AppColors.questCardTextMuted)
                                          .copyWith(letterSpacing: 1.0),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: AppColors.questCardOverlay,
                                  borderRadius:
                                      BorderRadius.circular(AppRadius.chip),
                                ),
                                child: Text(
                                  quest.category.toUpperCase(),
                                  style: AppTypography.unboundedBold(
                                          8, AppColors.questCardTextMuted)
                                      .copyWith(letterSpacing: 0.5),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Text(quest.title,
                              style: AppTypography.questTitle),
                          const SizedBox(height: AppSpacing.sm),
                          Row(
                            children: [
                              const Icon(Icons.access_time,
                                  size: 12,
                                  color: AppColors.questCardTextMuted),
                              const SizedBox(width: 5),
                              Text(
                                _remainingText,
                                style: AppTypography.outfitSemiBold(
                                    12, AppColors.questCardTextMuted),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // ── Dark body ──────────────────────────────────────────
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSpacing.cardPadding),
                      decoration: const BoxDecoration(
                        color: AppColors.bgSurface,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(AppRadius.card)),
                        border: Border(
                          top: BorderSide(color: AppColors.borderSubtle),
                          left: BorderSide(color: AppColors.borderSubtle),
                          right: BorderSide(color: AppColors.borderSubtle),
                          bottom: BorderSide(
                              color: AppColors.borderSubtle, width: 3),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            quest.description,
                            style: AppTypography.outfitSemiBold(
                                15, AppColors.textPrimary),
                          ),
                          if (quest.hint != null &&
                              quest.hint!.isNotEmpty) ...[
                            const SizedBox(height: AppSpacing.md),
                            Container(
                              padding: const EdgeInsets.only(left: 14),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                      color: AppColors.accentDim,
                                      width: 2),
                                ),
                              ),
                              child: Text(quest.hint!,
                                  style: AppTypography.bodyMedium),
                            ),
                          ],
                          const SizedBox(height: AppSpacing.lg),
                          if (_character != null) ...[
                            Text(
                              _character!.name,
                              style: AppTypography.unboundedBold(
                                  11, AppColors.textPrimary),
                            ),
                            Text(
                              _character!.epithet,
                              style:
                                  AppTypography.outfitMedium(
                                      11, AppColors.textMuted),
                            ),
                            const SizedBox(height: AppSpacing.lg),
                          ],
                          _InfoRow(
                            label: 'Assigned',
                            value: _formatDate(quest.assignedAt),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          _InfoRow(
                            label: 'Expires',
                            value: _formatDate(quest.expiresAt),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxl),

                    // ── Actions ────────────────────────────────────────────
                    if (quest.status == QuestStatus.active) ...[
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accent,
                            foregroundColor: AppColors.textInverse,
                            padding:
                                const EdgeInsets.symmetric(vertical: 14),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(AppRadius.button)),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () => context.pop('complete'),
                          child: Text('Complete Challenge',
                              style: AppTypography.ctaButton),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.textDisabled,
                            side: const BorderSide(
                                color: AppColors.borderMid),
                            padding:
                                const EdgeInsets.symmetric(vertical: 14),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(AppRadius.button)),
                            ),
                          ),
                          onPressed: () => AlertService.show(
                            context,
                            title: 'Abandon challenge?',
                            message:
                                'Your progress will be lost and the challenge will be removed.',
                            actions: [
                              AlertAction(
                                label: 'Abandon',
                                style: AlertActionStyle.danger,
                                onTap: () => context.pop('abandon'),
                              ),
                              AlertAction(
                                label: 'Keep going',
                                style: AlertActionStyle.ghost,
                              ),
                            ],
                          ),
                          child: Text(
                            'Abandon',
                            style: AppTypography.unboundedBold(
                                12, AppColors.textDisabled),
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: AppSpacing.sectionGap),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label,
            style: AppTypography.outfitMedium(12, AppColors.textMuted)),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.borderSubtle,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Text(value,
            style: AppTypography.outfitSemiBold(12, AppColors.textPrimary)),
      ],
    );
  }
}
