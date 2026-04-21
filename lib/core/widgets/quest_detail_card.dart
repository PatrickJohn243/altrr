import 'dart:io';
import 'package:flutter/material.dart';
import '../../shared/data/quest_categories.dart';
import '../../shared/models/character.dart';
import '../../shared/models/quest.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

/// Shared quest detail card — used by QuestDetailScreen and any future screen
/// that needs to show full quest details.
class QuestDetailCard extends StatelessWidget {
  final Quest quest;
  final Character? character;

  /// Pass a callback to show the Start Timer button (active quests only).
  final VoidCallback? onStartTimer;

  const QuestDetailCard({
    super.key,
    required this.quest,
    this.character,
    this.onStartTimer,
  });

  static bool hasSubmissionData(Quest q) =>
      q.submissionNote != null ||
      q.submissionPhotoPath != null ||
      q.submissionTimeSpent != null ||
      q.submissionWhere != null ||
      q.submissionEmotions.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final categoryLabel = QuestCategories.labelFor(quest.category);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Lime header ──────────────────────────────────────────────────
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
              // Assigned-by + status row
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
                  borderRadius: BorderRadius.circular(AppRadius.chip),
                ),
                child: Text(
                  categoryLabel.toUpperCase(),
                  style: AppTypography.unboundedBold(
                          9, AppColors.textInverse)
                      .copyWith(letterSpacing: 0.5),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),

              // Quest title
              Text(quest.title, style: AppTypography.questTitle),
            ],
          ),
        ),

        // ── Dark body ────────────────────────────────────────────────────
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
              bottom:
                  BorderSide(color: AppColors.borderSubtle, width: 3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Description label
              Text(
                "WHAT YOU'RE DOING —",
                style: AppTypography.outfitBold(
                        10, const Color(0x73C8F135))
                    .copyWith(letterSpacing: 0.9),
              ),
              const SizedBox(height: AppSpacing.xs),

              // Description
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
              const Divider(color: AppColors.borderSubtle, height: 1),
              const SizedBox(height: AppSpacing.md),

              // Character row
              if (character != null) ...[
                _CharacterRow(character: character!),
                const SizedBox(height: AppSpacing.md),
                const Divider(color: AppColors.borderSubtle, height: 1),
                const SizedBox(height: AppSpacing.md),
              ],

              // Dates
              _DateRow(label: 'ASSIGNED', date: quest.assignedAt),
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

        // ── Start Timer ──────────────────────────────────────────────────
        if (quest.status == QuestStatus.active && onStartTimer != null) ...[
          const SizedBox(height: AppSpacing.sectionGap),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.accent,
                side: const BorderSide(color: AppColors.accentDim),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(AppRadius.button)),
                ),
              ),
              onPressed: onStartTimer,
              icon: const Icon(Icons.timer_outlined, size: 16),
              label: Text(
                'Start Timer',
                style: AppTypography.unboundedBold(12, AppColors.accent),
              ),
            ),
          ),
        ],

        // ── Submission ───────────────────────────────────────────────────
        if (quest.status == QuestStatus.completed &&
            hasSubmissionData(quest)) ...[
          const SizedBox(height: AppSpacing.sectionGap),
          _SubmissionSection(quest: quest),
        ],
      ],
    );
  }
}

// ── Status pill ───────────────────────────────────────────────────────────────

class _StatusPill extends StatelessWidget {
  final QuestStatus status;
  const _StatusPill({required this.status});

  @override
  Widget build(BuildContext context) {
    final label = switch (status) {
      QuestStatus.completed => 'COMPLETED',
      QuestStatus.active => 'ACTIVE',
      _ => '',
    };
    if (label.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.questCardOverlay,
        borderRadius: BorderRadius.circular(AppRadius.chip),
      ),
      child: Text(
        label,
        style: AppTypography.unboundedBold(8, AppColors.questCardTextMuted)
            .copyWith(letterSpacing: 1.0),
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
            borderRadius:
                BorderRadius.all(Radius.circular(AppRadius.icon)),
            border: Border.fromBorderSide(
                BorderSide(color: AppColors.accentDim)),
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
              Text(character.name,
                  style: AppTypography.unboundedBold(
                      12, AppColors.textPrimary)),
              Text(character.epithet,
                  style: AppTypography.outfitMedium(
                      11, AppColors.textMuted)),
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
    final str =
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
          child: Container(height: 1, color: AppColors.borderSubtle),
        ),
        const SizedBox(width: AppSpacing.md),
        Text(
          str,
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

const _difficultyLabels = [
  'Easy', 'Easy–Mod', 'Moderate', 'Mod–Hard', 'Hard'
];
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
      decoration: const BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.card)),
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
          Text('YOUR SUBMISSION', style: AppTypography.sectionLabel),
          const SizedBox(height: AppSpacing.md),

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

          if (quest.submissionNote != null) ...[
            Text(
              'WHAT YOU DID',
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 3),
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
                          borderRadius:
                              BorderRadius.circular(AppRadius.chip),
                          border: Border.all(color: AppColors.accentDim),
                        ),
                        child: Text(
                          e,
                          style: AppTypography.outfitMedium(
                              11, AppColors.accent),
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

// ── Image overlay ─────────────────────────────────────────────────────────────

void _showImageOverlay(BuildContext context, String path) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Close',
    barrierColor: Colors.black.withOpacity(0.92),
    transitionDuration: const Duration(milliseconds: 200),
    transitionBuilder: (_, anim, __, child) =>
        FadeTransition(opacity: anim, child: child),
    pageBuilder: (context, _, __) => SafeArea(
      child: Stack(
        children: [
          Center(
            child: InteractiveViewer(
              minScale: 1.0,
              maxScale: 4.0,
              child: Image.file(File(path), fit: BoxFit.contain),
            ),
          ),
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
                child: const Icon(Icons.close,
                    size: 16, color: AppColors.textPrimary),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

// ── Meta chip ─────────────────────────────────────────────────────────────────

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
