import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/app_bar_main.dart';
import '../../../core/widgets/quest_card.dart';
import '../../../core/widgets/quest_row_card.dart';
import '../../../core/widgets/stat_card.dart';
import '../../../core/widgets/section_header.dart';
import '../../../shared/data/quest_categories.dart';
import '../controllers/quests_controller.dart';
import '../controllers/quests_controller_provider.dart';
import '../widgets/title_earned_sheet.dart';

class QuestsScreen extends StatefulWidget {
  const QuestsScreen({super.key});

  @override
  State<QuestsScreen> createState() => _QuestsScreenState();
}

class _QuestsScreenState extends State<QuestsScreen> {
  QuestsController? _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final next = QuestsControllerProvider.of(context);
    if (next != _controller) {
      _controller?.removeListener(_onControllerChanged);
      _controller = next;
      _controller!.addListener(_onControllerChanged);
    }
  }

  @override
  void dispose() {
    _controller?.removeListener(_onControllerChanged);
    super.dispose();
  }

  void _onControllerChanged() {
    final c = _controller;
    if (c == null || c.lastEarnedTitles.isEmpty) return;
    final titles = List.of(c.lastEarnedTitles);
    c.clearLastEarnedTitles();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      TitleEarnedSheet.show(context, titles: titles);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = QuestsControllerProvider.of(context);
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarMain(),
            Expanded(
              child: ListenableBuilder(
                listenable: controller,
                builder: (context, _) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.screenPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ── Active quest ────────────────────────────────────
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 350),
                          transitionBuilder: (child, animation) =>
                              FadeTransition(
                            opacity: animation,
                            child: ScaleTransition(
                              scale: Tween(begin: 0.95, end: 1.0).animate(
                                CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeOutBack,
                                ),
                              ),
                              child: child,
                            ),
                          ),
                          child: controller.activeQuest == null
                              ? const SizedBox.shrink()
                              : QuestCard(
                                  key: ValueKey(controller.activeQuest!.id),
                                  questTitle: controller.activeQuest!.title,
                                  description:
                                      controller.activeQuest!.description,
                                  hint: controller.activeQuest!.hint,
                                  expiryText: 'Expires midnight',
                                  assignedByAltrr: true,
                                  onComplete: () async {
                                    final quest = controller.activeQuest;
                                    if (quest == null) return;
                                    final saved = await context.push<bool>(
                                      '/submit',
                                      extra: quest,
                                    );
                                    if (saved == true)
                                      controller.completeQuest();
                                  },
                                  onSkip: controller.skipQuest,
                                ),
                        ),
                        const SizedBox(height: AppSpacing.sm),

                        // ── Debug chip: character + category ────────────────
                        _DebugChip(controller: controller),
                        const SizedBox(height: AppSpacing.md),

                        // ── Generate quest button ───────────────────────────
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.accent,
                              side: const BorderSide(
                                  color: AppColors.accent, width: 1),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(AppRadius.button)),
                              ),
                            ),
                            onPressed: controller.generateQuest,
                            icon: const Icon(Icons.refresh, size: 16),
                            label: Text(
                              'Generate Quest',
                              style: AppTypography.unboundedBold(
                                  12, AppColors.accent),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),

                        // ── TEST: Generate title button ─────────────────────
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.textDisabled,
                              side:
                                  const BorderSide(color: AppColors.borderMid),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(AppRadius.button)),
                              ),
                            ),
                            onPressed: controller.debugGenerateTitle,
                            icon: const Icon(Icons.workspace_premium_outlined,
                                size: 16),
                            label: Text(
                              'Test Title',
                              style: AppTypography.unboundedBold(
                                  12, AppColors.textDisabled),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),

                        // ── TEST: Timer button ──────────────────────────────
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.textDisabled,
                              side:
                                  const BorderSide(color: AppColors.borderMid),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(AppRadius.button)),
                              ),
                            ),
                            onPressed: () => context.push('/timer'),
                            icon: const Icon(Icons.timer_outlined, size: 16),
                            label: Text(
                              'Test Timer',
                              style: AppTypography.unboundedBold(
                                  12, AppColors.textDisabled),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),

                        // ── TEST: Onboarding button ─────────────────────────
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.textDisabled,
                              side:
                                  const BorderSide(color: AppColors.borderMid),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(AppRadius.button)),
                              ),
                            ),
                            onPressed: () => context.push('/onboarding'),
                            icon:
                                const Icon(Icons.play_circle_outline, size: 16),
                            label: Text(
                              'Test Onboarding',
                              style: AppTypography.unboundedBold(
                                  12, AppColors.textDisabled),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sectionGap),

                        // ── YOUR NUMBERS ────────────────────────────────────
                        const SectionHeader(label: 'YOUR NUMBERS'),
                        const SizedBox(height: AppSpacing.itemGap),
                        Row(
                          children: [
                            Expanded(
                                child: StatCard(
                                    value: controller.completedCount,
                                    label: 'Quests Done')),
                            const SizedBox(width: AppSpacing.sm),
                            Expanded(
                                child: StatCard(value: 0, label: 'Skips')),
                            const SizedBox(width: AppSpacing.sm),
                            Expanded(
                                child: StatCard(
                                    value: controller.titlesEarnedCount,
                                    label: 'Titles Earned')),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.sectionGap),

                        // ── COMPLETED ───────────────────────────────────────
                        SectionHeader(
                          label: 'COMPLETED',
                          seeAll: () => context.push('/all-quests'),
                        ),
                        const SizedBox(height: AppSpacing.itemGap),
                        if (controller.recentCompleted.isEmpty)
                          const SizedBox.shrink()
                        else
                          ...controller.recentCompleted.map((q) => Padding(
                                padding: const EdgeInsets.only(
                                    bottom: AppSpacing.itemGap),
                                child: QuestRowCard(
                                  icon: Icon(
                                    QuestCategories.iconFor(q.category),
                                    size: 18,
                                    color: AppColors.textMuted,
                                  ),
                                  category: q.category,
                                  questTitle: q.title,
                                  date: _formatDate(
                                      q.completedAt ?? q.assignedAt),
                                  onTap: () => context.push('/quest', extra: q),
                                ),
                              )),
                        const SizedBox(height: AppSpacing.sectionGap),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _formatDate(DateTime dt) {
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
  return '${months[dt.month - 1]} ${dt.day}';
}

class _DebugChip extends StatelessWidget {
  final QuestsController controller;
  const _DebugChip({required this.controller});

  @override
  Widget build(BuildContext context) {
    final balance = controller.currentBalance;
    if (balance == null) return const SizedBox.shrink();

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.accentSubtle,
            borderRadius: BorderRadius.circular(AppRadius.chip),
            border: Border.all(color: AppColors.accentDim),
          ),
          child: Text(
            '${balance.character!.name}  ·  ${balance.category}',
            style: AppTypography.unboundedBold(9, AppColors.accent)
                .copyWith(letterSpacing: 0.5),
          ),
        ),
      ],
    );
  }
}
