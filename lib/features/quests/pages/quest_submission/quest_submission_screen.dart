import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/database/isar_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_bar_back.dart';
import '../../../../shared/models/quest.dart';

// ── Difficulty ────────────────────────────────────────────────────────────────

enum _Difficulty { easy, easyMod, moderate, modHard, hard }

const _difficultyLabels = ['Easy', '', 'Moderate', '', 'Hard'];

const _difficultyColors = [
  Color(0xFFC8F135),
  Color(0xFFE8D31A),
  Color(0xFFFFB800),
  Color(0xFFFF8226),
  Color(0xFFFF4C4C),
];

// ── Emotion ───────────────────────────────────────────────────────────────────

class _Emotion {
  final String label;
  final IconData icon;
  const _Emotion(this.label, this.icon);
}

const _emotions = [
  _Emotion('Happy', Icons.sentiment_satisfied_alt),
  _Emotion('Proud', Icons.military_tech),
  _Emotion('Energized', Icons.bolt),
  _Emotion('Calm', Icons.self_improvement),
  _Emotion('Tired', Icons.bedtime_outlined),
  _Emotion('Challenged', Icons.psychology),
  _Emotion('Grateful', Icons.favorite_border),
  _Emotion('Stressed', Icons.sentiment_dissatisfied),
];

// ── Screen ────────────────────────────────────────────────────────────────────

class QuestSubmissionScreen extends StatefulWidget {
  final Quest quest;
  const QuestSubmissionScreen({super.key, required this.quest});

  @override
  State<QuestSubmissionScreen> createState() => _QuestSubmissionScreenState();
}

class _QuestSubmissionScreenState extends State<QuestSubmissionScreen> {
  final _whatController = TextEditingController();
  final _timeController = TextEditingController();
  final _whereController = TextEditingController();

  _Difficulty _difficulty = _Difficulty.easy;
  final Set<int> _selectedEmotions = {};
  XFile? _photo;
  final _picker = ImagePicker();

  @override
  void dispose() {
    _whatController.dispose();
    _timeController.dispose();
    _whereController.dispose();
    super.dispose();
  }

  Future<void> _pickPhoto() async {
    final photo = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (photo != null) setState(() => _photo = photo);
  }

  void _removePhoto() => setState(() => _photo = null);

  void _toggleEmotion(int index) => setState(() {
        if (_selectedEmotions.contains(index)) {
          _selectedEmotions.remove(index);
        } else {
          _selectedEmotions.add(index);
        }
      });

  Future<void> _save() async {
    final isar = IsarService.instance;

    await isar.writeTxn(() async {
      final quest = await isar.quests.get(widget.quest.id);
      if (quest == null) return;
      final note = _whatController.text.trim();
      final time = _timeController.text.trim();
      final where = _whereController.text.trim();
      quest.submissionNote = note.isEmpty ? null : note;
      quest.submissionTimeSpent = time.isEmpty ? null : time;
      quest.submissionWhere = where.isEmpty ? null : where;
      quest.submissionDifficulty = _difficulty.index;
      quest.submissionEmotions =
          _selectedEmotions.map((i) => _emotions[i].label).toList();
      quest.submissionPhotoPath = _photo?.path;
      await isar.quests.put(quest);
    });

    if (mounted) context.pop(true);
  }

  void _share() {
    // TODO: share quest completion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: Column(
          children: [
            AppBarBack(onBack: () => context.pop()),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.screenPadding,
                  0,
                  AppSpacing.screenPadding,
                  AppSpacing.xxl,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPhotoSection(),
                    const SizedBox(height: AppSpacing.sectionGap),
                    _buildQuestCard(),
                    const SizedBox(height: AppSpacing.sectionGap),
                    _buildWhatSection(),
                    const SizedBox(height: AppSpacing.sectionGap),
                    _buildTimeAndWhereSection(),
                    const SizedBox(height: AppSpacing.sectionGap),
                    _buildDifficultySection(),
                    const SizedBox(height: AppSpacing.sectionGap),
                    _buildEmotionsSection(),
                  ],
                ),
              ),
            ),
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }

  // ── Photo picker ─────────────────────────────────────────────────────────────

  Widget _buildPhotoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel('PHOTO'),
        const SizedBox(height: AppSpacing.md),
        _photo != null
            ? _PhotoThumbnail(
                file: File(_photo!.path),
                onRemove: _removePhoto,
              )
            : GestureDetector(
                onTap: _pickPhoto,
                child: Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    color: AppColors.bgSurface,
                    borderRadius: BorderRadius.circular(AppRadius.card),
                    border: Border.all(color: AppColors.borderMid),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 32,
                        color: AppColors.textMuted,
                      ),
                      const SizedBox(height: 8),
                      Text('Add photo', style: AppTypography.caption),
                    ],
                  ),
                ),
              ),
      ],
    );
  }

  // ── Quest card ───────────────────────────────────────────────────────────────

  Widget _buildQuestCard() {
    final date = widget.quest.completedAt ?? DateTime.now();
    final dateStr = '${_monthName(date.month)} ${date.day}, ${date.year}';

    return Container(
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
      child: Row(
        children: [
          // Icon box
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.bgElevated,
              borderRadius: BorderRadius.circular(AppRadius.icon),
            ),
            child: Icon(
              _categoryIcon(widget.quest.category),
              size: 20,
              color: AppColors.accent,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          // Category + title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.quest.category.toUpperCase(),
                  style: AppTypography.categoryLabel,
                ),
                const SizedBox(height: 3),
                Text(
                  widget.quest.title,
                  style: AppTypography.cardTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          // Completion date
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Completed',
                style: AppTypography.caption,
              ),
              const SizedBox(height: 3),
              Text(
                dateStr,
                style: AppTypography.outfitMedium(10, AppColors.accent),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── What did you do ──────────────────────────────────────────────────────────

  Widget _buildWhatSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel('WHAT DID YOU DO'),
        const SizedBox(height: AppSpacing.md),
        Container(
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
          child: TextField(
            controller: _whatController,
            maxLines: 4,
            style: AppTypography.outfitMedium(13, AppColors.textPrimary),
            decoration: InputDecoration(
              hintText: 'Describe what you did...',
              hintStyle: AppTypography.bodyMedium,
              contentPadding: const EdgeInsets.all(AppSpacing.cardPadding),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  // ── Time + Where ─────────────────────────────────────────────────────────────

  Widget _buildTimeAndWhereSection() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SectionLabel('TIME SPENT'),
              const SizedBox(height: AppSpacing.md),
              _InputCard(
                controller: _timeController,
                hint: 'e.g. 30 min',
                icon: Icons.timer_outlined,
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SectionLabel('WHERE'),
              const SizedBox(height: AppSpacing.md),
              _InputCard(
                controller: _whereController,
                hint: 'e.g. Home',
                icon: Icons.location_on_outlined,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ── Difficulty ───────────────────────────────────────────────────────────────

  Widget _buildDifficultySection() {
    final idx = _difficulty.index;
    final activeColor = _difficultyColors[idx];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel('DIFFICULTY'),
        const SizedBox(height: AppSpacing.md),
        Container(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.cardPaddingMd,
            AppSpacing.md,
            AppSpacing.cardPaddingMd,
            AppSpacing.cardPaddingMd,
          ),
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
            children: [
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: activeColor,
                  inactiveTrackColor: AppColors.bgEmpty,
                  thumbColor: activeColor,
                  overlayColor: activeColor.withOpacity(0.15),
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 10),
                  trackHeight: 4,
                  tickMarkShape: SliderTickMarkShape.noTickMark,
                ),
                child: Slider(
                  value: idx.toDouble(),
                  min: 0,
                  max: 4,
                  divisions: 4,
                  onChanged: (v) => setState(
                    () => _difficulty = _Difficulty.values[v.round()],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    5,
                    (i) => SizedBox(
                      width: 52,
                      child: Text(
                        _difficultyLabels[i],
                        style: AppTypography.outfitMedium(
                          11,
                          i == idx ? _difficultyColors[i] : AppColors.textMuted,
                        ),
                        textAlign: i == 0
                            ? TextAlign.left
                            : i == 4
                                ? TextAlign.right
                                : TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ── Emotions ─────────────────────────────────────────────────────────────────

  Widget _buildEmotionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel('HOW DID YOU FEEL'),
        const SizedBox(height: AppSpacing.md),
        SizedBox(
          height: 90,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _emotions.length,
            separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.sm),
            itemBuilder: (_, i) {
              final selected = _selectedEmotions.contains(i);
              return GestureDetector(
                onTap: () => _toggleEmotion(i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 74,
                  decoration: BoxDecoration(
                    color:
                        selected ? AppColors.accentSubtle : AppColors.bgSurface,
                    borderRadius: BorderRadius.circular(AppRadius.card),
                    border: Border.all(
                      color:
                          selected ? AppColors.accent : AppColors.borderSubtle,
                      width: selected ? 1.5 : 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _emotions[i].icon,
                        size: 26,
                        color:
                            selected ? AppColors.accent : AppColors.textMuted,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        _emotions[i].label,
                        style: AppTypography.outfitMedium(
                          10,
                          selected ? AppColors.accent : AppColors.textMuted,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ── Bottom bar ───────────────────────────────────────────────────────────────

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.screenPadding,
        AppSpacing.md,
        AppSpacing.screenPadding,
        AppSpacing.screenPadding,
      ),
      decoration: const BoxDecoration(
        color: AppColors.bgPrimary,
        border: Border(
          top: BorderSide(color: AppColors.borderSubtle),
        ),
      ),
      child: Row(
        children: [
          // Save button
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                foregroundColor: AppColors.textInverse,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.button),
                ),
                elevation: 0,
              ),
              onPressed: _save,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_circle_outline, size: 17),
                  const SizedBox(width: 7),
                  Text('Save this activity', style: AppTypography.ctaButton),
                ],
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          // Share icon button
          GestureDetector(
            onTap: _share,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.bgSurface,
                borderRadius: BorderRadius.circular(AppRadius.button),
                border: Border.all(color: AppColors.borderMid),
              ),
              child: const Icon(
                Icons.ios_share_outlined,
                size: 20,
                color: AppColors.textMuted,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Helpers ──────────────────────────────────────────────────────────────────

  static String _monthName(int month) {
    const m = [
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
    return m[month - 1];
  }

  static IconData _categoryIcon(String category) {
    return switch (category.toLowerCase()) {
      'food' || 'cooking' => Icons.restaurant_outlined,
      'gym' || 'physical' => Icons.fitness_center_outlined,
      'travel' || 'explore' => Icons.explore_outlined,
      'people' || 'social' => Icons.people_outlined,
      'mental' => Icons.psychology_outlined,
      'learning' => Icons.menu_book_outlined,
      'hobby' => Icons.palette_outlined,
      'reflection' => Icons.self_improvement_outlined,
      _ => Icons.star_outline,
    };
  }
}

// ── Subwidgets ────────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: AppTypography.sectionLabel),
        const SizedBox(width: AppSpacing.md),
        const Expanded(
          child: Divider(color: AppColors.borderSubtle, thickness: 1),
        ),
      ],
    );
  }
}

class _InputCard extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;

  const _InputCard({
    required this.controller,
    required this.hint,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: TextField(
        controller: controller,
        style: AppTypography.outfitMedium(13, AppColors.textPrimary),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, size: 16, color: AppColors.textMuted),
          hintText: hint,
          hintStyle: AppTypography.bodyMedium,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class _PhotoThumbnail extends StatelessWidget {
  final File file;
  final VoidCallback onRemove;

  const _PhotoThumbnail({required this.file, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.card),
          child: Image.file(
            file,
            width: double.infinity,
            height: 160,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: onRemove,
            child: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: AppColors.bgElevated,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.close,
                size: 13,
                color: AppColors.textMuted,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
