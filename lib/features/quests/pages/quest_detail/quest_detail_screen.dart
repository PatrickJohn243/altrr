import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/database/isar_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_bar_back.dart';
import '../../../../shared/models/character.dart';
import '../../../../shared/models/quest.dart';

class QuestDetailScreen extends StatefulWidget {
  final Quest quest;

  const QuestDetailScreen({super.key, required this.quest});

  @override
  State<QuestDetailScreen> createState() => _QuestDetailScreenState();
}

class _QuestDetailScreenState extends State<QuestDetailScreen> {
  Character? _character;

  @override
  void initState() {
    super.initState();
    _loadCharacter();
  }

  Future<void> _loadCharacter() async {
    final id = widget.quest.characterId;
    if (id == null) return;
    final character = await IsarService.instance.characters.get(id);
    if (mounted) setState(() => _character = character);
  }

  @override
  Widget build(BuildContext context) {
    final quest = widget.quest;

    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: Column(
          children: [
            AppBarBack(onBack: () => context.pop()),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Lime header ─────────────────────────────────────────
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSpacing.cardPadding),
                      decoration: const BoxDecoration(
                        color: AppColors.accent,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(AppRadius.card),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Assigned-by row
                          Row(
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: AppColors.questCardTextMuted,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                quest.assignedByAltrr
                                    ? 'Assigned by ALTRR'
                                    : 'Anonymously assigned',
                                style: AppTypography.outfitSemiBold(
                                    10, AppColors.questCardTextMuted),
                              ),
                              const Spacer(),
                              _StatusPill(status: quest.status),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          // Category chip
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColors.questCardOverlay,
                              borderRadius:
                                  BorderRadius.circular(AppRadius.chip),
                            ),
                            child: Text(
                              quest.category.toUpperCase(),
                              style: AppTypography.unboundedBold(
                                      9, AppColors.textInverse)
                                  .copyWith(letterSpacing: 0.5),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          // Quest title
                          Text(
                            quest.title,
                            style: AppTypography.questTitle,
                          ),
                        ],
                      ),
                    ),

                    // ── Dark body ────────────────────────────────────────────
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSpacing.cardPadding),
                      decoration: const BoxDecoration(
                        color: AppColors.bgSurface,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(AppRadius.card),
                        ),
                        border: Border(
                          left: BorderSide(color: AppColors.borderSubtle),
                          right: BorderSide(color: AppColors.borderSubtle),
                          bottom: BorderSide(
                              color: AppColors.borderSubtle, width: 3),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // "WHAT YOU'RE DOING"
                          Text(
                            "WHAT YOU'RE DOING —",
                            style: AppTypography.outfitBold(
                                    10, const Color(0x73C8F135))
                                .copyWith(letterSpacing: 0.9),
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            quest.description,
                            style: AppTypography.outfitSemiBold(
                                18, AppColors.textPrimary),
                          ),

                          // Hint
                          if (quest.hint != null &&
                              quest.hint!.isNotEmpty) ...[
                            const SizedBox(height: AppSpacing.md),
                            Container(
                              padding: const EdgeInsets.only(left: 14),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                      color: Color(0x4DC8F135), width: 2),
                                ),
                              ),
                              child: Text(quest.hint!,
                                  style: AppTypography.bodyMedium),
                            ),
                          ],

                          const SizedBox(height: AppSpacing.lg),
                          const Divider(color: AppColors.borderSubtle),
                          const SizedBox(height: AppSpacing.md),

                          // Character row
                          if (_character != null) ...[
                            _CharacterRow(character: _character!),
                            const SizedBox(height: AppSpacing.md),
                            const Divider(color: AppColors.borderSubtle),
                            const SizedBox(height: AppSpacing.md),
                          ],

                          // Dates
                          _DateRow(
                            label: 'ASSIGNED',
                            date: quest.assignedAt,
                          ),
                          if (quest.completedAt != null) ...[
                            const SizedBox(height: AppSpacing.sm),
                            _DateRow(
                              label: 'COMPLETED',
                              date: quest.completedAt!,
                              accent: true,
                            ),
                          ],
                        ],
                      ),
                    ),

                    const SizedBox(height: AppSpacing.sectionGap),

                    // ── Timer (active quests only) ────────────────────────
                    if (quest.status == QuestStatus.active)
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.accent,
                            side: const BorderSide(
                                color: AppColors.accentDim, width: 1),
                            padding:
                                const EdgeInsets.symmetric(vertical: 14),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(AppRadius.button)),
                            ),
                          ),
                          onPressed: () => context.push('/timer'),
                          icon: const Icon(Icons.timer_outlined, size: 16),
                          label: Text(
                            'Start Timer',
                            style: AppTypography.unboundedBold(
                                12, AppColors.accent),
                          ),
                        ),
                      ),

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

// ── Status pill ───────────────────────────────────────────────────────────────

class _StatusPill extends StatelessWidget {
  final QuestStatus status;

  const _StatusPill({required this.status});

  @override
  Widget build(BuildContext context) {
    final (label, bg, fg) = switch (status) {
      QuestStatus.active => (
          'ACTIVE',
          AppColors.accentSubtle,
          AppColors.accent,
        ),
      QuestStatus.completed => (
          'COMPLETED',
          AppColors.accent,
          AppColors.textInverse,
        ),
      _ => (
          'ACTIVE',
          AppColors.accentSubtle,
          AppColors.accent,
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppRadius.chip),
      ),
      child: Text(
        label,
        style:
            AppTypography.unboundedBold(8, fg).copyWith(letterSpacing: 0.5),
      ),
    );
  }
}

// ── Character row ─────────────────────────────────────────────────────────────

class _CharacterRow extends StatelessWidget {
  final Character character;

  const _CharacterRow({required this.character});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: const BoxDecoration(
            color: AppColors.accentSubtle,
            borderRadius: BorderRadius.all(Radius.circular(AppRadius.icon)),
            border: Border.fromBorderSide(
              BorderSide(color: AppColors.accentDim),
            ),
          ),
          child: const Center(
            child: Icon(Icons.person_outline,
                size: 18, color: AppColors.accent),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                character.name,
                style: AppTypography.unboundedBold(12, AppColors.textPrimary),
              ),
              Text(
                character.epithet,
                style: AppTypography.outfitMedium(11, AppColors.textMuted),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Date row ──────────────────────────────────────────────────────────────────

class _DateRow extends StatelessWidget {
  final String label;
  final DateTime date;
  final bool accent;

  const _DateRow({
    required this.label,
    required this.date,
    this.accent = false,
  });

  @override
  Widget build(BuildContext context) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    final dateStr =
        '${months[date.month - 1]} ${date.day}, ${date.year}';

    return Row(
      children: [
        Text(
          label,
          style: AppTypography.unboundedBold(9, AppColors.textMuted)
              .copyWith(letterSpacing: 0.8),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.borderSubtle,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Text(
          dateStr,
          style: AppTypography.outfitSemiBold(
            11,
            accent ? AppColors.accent : AppColors.textMuted,
          ),
        ),
      ],
    );
  }
}
