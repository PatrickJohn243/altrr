import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/database/isar_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_bar_back.dart';
import '../../../../core/widgets/badge.dart';
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

  static bool _hasSubmissionData(Quest q) =>
      q.submissionNote != null ||
      q.submissionPhotoPath != null ||
      q.submissionTimeSpent != null ||
      q.submissionWhere != null ||
      q.submissionEmotions.isNotEmpty;

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
                              switch (quest.status) {
                QuestStatus.completed => const AppBadge(
                    label: 'COMPLETED',
                    color: AppColors.accent,
                    textColor: AppColors.textInverse,
                  ),
                _ => AppBadge.active(),
              },
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
                          if (quest.hint != null && quest.hint!.isNotEmpty) ...[
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
                            padding: const EdgeInsets.symmetric(vertical: 14),
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

                    // ── Submission data (completed quests only) ───────────
                    if (quest.status == QuestStatus.completed &&
                        _hasSubmissionData(quest)) ...[
                      const SizedBox(height: AppSpacing.sectionGap),
                      _SubmissionSection(quest: quest),
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
            child:
                Icon(Icons.person_outline, size: 18, color: AppColors.accent),
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
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final dateStr = '${months[date.month - 1]} ${date.day}, ${date.year}';

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

// ── Submission section ────────────────────────────────────────────────────────

const _difficultyLabels = ['Easy', 'Easy–Mod', 'Moderate', 'Mod–Hard', 'Hard'];
const _difficultyColors = [
  Color(0xFFC8F135),
  Color(0xFFE8D31A),
  Color(0xFFFFB800),
  Color(0xFFFF8226),
  Color(0xFFFF4C4C),
];

class _SubmissionSection extends StatelessWidget {
  final Quest quest;
  const _SubmissionSection({required this.quest});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.cardPadding),
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: const Border(
          top: BorderSide(color: AppColors.borderSubtle),
          left: BorderSide(color: AppColors.borderSubtle),
          right: BorderSide(color: AppColors.borderSubtle),
          bottom: BorderSide(color: AppColors.borderSubtle, width: 3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('YOUR SUBMISSION', style: AppTypography.sectionLabel),
          const SizedBox(height: AppSpacing.md),

          // Photo
          if (quest.submissionPhotoPath != null) ...[
            GestureDetector(
              onTap: () =>
                  _showImageOverlay(context, quest.submissionPhotoPath!),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.card),
                child: Image.file(
                  File(quest.submissionPhotoPath!),
                  width: double.infinity,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
          ],

          // Note
          if (quest.submissionNote != null) ...[
            Text(
              'WHAT YOU DID —',
              style: AppTypography.outfitBold(10, AppColors.textMuted)
                  .copyWith(letterSpacing: 0.9),
            ),
            const SizedBox(height: 4),
            Text(
              quest.submissionNote!,
              style: AppTypography.outfitMedium(13, AppColors.textPrimary),
            ),
            const SizedBox(height: AppSpacing.md),
          ],

          // Time + Where
          if (quest.submissionTimeSpent != null ||
              quest.submissionWhere != null) ...[
            Row(
              children: [
                if (quest.submissionTimeSpent != null)
                  _MetaChip(
                    icon: Icons.timer_outlined,
                    label: quest.submissionTimeSpent!,
                  ),
                if (quest.submissionTimeSpent != null &&
                    quest.submissionWhere != null)
                  const SizedBox(width: AppSpacing.sm),
                if (quest.submissionWhere != null)
                  _MetaChip(
                    icon: Icons.location_on_outlined,
                    label: quest.submissionWhere!,
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
          ],

          // Difficulty
          if (quest.submissionDifficulty != null) ...[
            Row(
              children: [
                Text(
                  'DIFFICULTY',
                  style: AppTypography.unboundedBold(9, AppColors.textMuted)
                      .copyWith(letterSpacing: 0.8),
                ),
                const SizedBox(width: AppSpacing.sm),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: _difficultyColors[quest.submissionDifficulty!]
                        .withOpacity(0.15),
                    borderRadius: BorderRadius.circular(AppRadius.chip),
                  ),
                  child: Text(
                    _difficultyLabels[quest.submissionDifficulty!],
                    style: AppTypography.unboundedBold(
                      9,
                      _difficultyColors[quest.submissionDifficulty!],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
          ],

          // Emotions
          if (quest.submissionEmotions.isNotEmpty) ...[
            Text(
              'FELT',
              style: AppTypography.unboundedBold(9, AppColors.textMuted)
                  .copyWith(letterSpacing: 0.8),
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: quest.submissionEmotions
                  .map((e) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.accentSubtle,
                          borderRadius: BorderRadius.circular(AppRadius.chip),
                          border: Border.all(color: AppColors.accentDim),
                        ),
                        child: Text(
                          e,
                          style:
                              AppTypography.outfitMedium(11, AppColors.accent),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }
}

void _showImageOverlay(BuildContext context, String path) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Close',
    barrierColor: Colors.black.withOpacity(0.92),
    transitionDuration: const Duration(milliseconds: 200),
    transitionBuilder: (_, anim, __, child) => FadeTransition(
      opacity: anim,
      child: child,
    ),
    pageBuilder: (context, _, __) => _ImageOverlay(path: path),
  );
}

class _ImageOverlay extends StatelessWidget {
  final String path;
  const _ImageOverlay({required this.path});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          // Pinch-to-zoom image
          Center(
            child: InteractiveViewer(
              minScale: 1.0,
              maxScale: 4.0,
              child: Image.file(
                File(path),
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Close button
          Positioned(
            top: 12,
            right: 12,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.bgElevated,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.borderMid),
                ),
                child: const Icon(
                  Icons.close,
                  size: 16,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _MetaChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.bgElevated,
        borderRadius: BorderRadius.circular(AppRadius.chip),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: AppColors.textMuted),
          const SizedBox(width: 5),
          Text(label,
              style: AppTypography.outfitMedium(11, AppColors.textMuted)),
        ],
      ),
    );
  }
}
