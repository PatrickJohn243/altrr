import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/app_bar_main.dart';
import '../../../core/widgets/break_state_card.dart';
import '../../../core/widgets/challenge_quest_card.dart';
import '../../../core/widgets/quest_card.dart';
import '../../../core/widgets/quest_row_card.dart';
import '../../../core/widgets/stat_card.dart';
import '../../../core/widgets/section_header.dart';
import '../../../shared/data/quest_categories.dart';
import '../controllers/quests_controller.dart';
import '../controllers/quests_controller_provider.dart';
import '../widgets/break_offer_sheet.dart';
import '../widgets/challenge_offer_sheet.dart';
import '../widgets/chain_offer_sheet.dart';
import '../widgets/quest_prompt_sheet.dart';
import '../widgets/daily_completed_card.dart';
import '../widgets/title_earned_sheet.dart';
import '../../../shared/generation/quest/prompts.dart';

class QuestsScreen extends StatefulWidget {
  const QuestsScreen({super.key});

  @override
  State<QuestsScreen> createState() => _QuestsScreenState();
}

class _QuestsScreenState extends State<QuestsScreen> {
  QuestsController? _controller;
  final _scrollController = ScrollController();
  bool _showingChallengeOffer = false;
  bool _showingChainOffer = false;
  bool _showingBreakOffer = false;
  bool _showingPrompt = false;

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
    _scrollController.dispose();
    super.dispose();
  }

  void _onControllerChanged() {
    final c = _controller;
    if (c == null) return;

    if (c.lastEarnedTitles.isNotEmpty) {
      final titles = List.of(c.lastEarnedTitles);
      c.clearLastEarnedTitles();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        TitleEarnedSheet.show(context, titles: titles);
      });
    }

    if (c.pendingBreakOffer && !_showingBreakOffer) {
      _showingBreakOffer = true;
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (!mounted) return;
        await BreakOfferSheet.show(
          context,
          onRest: c.activateBreakMode,
          onKeepGoing: c.declineBreakOffer,
        );
        _showingBreakOffer = false;
      });
    }

    if (c.pendingChallengeOffer != null && !_showingChallengeOffer) {
      _showingChallengeOffer = true;
      final offer = c.pendingChallengeOffer!;
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (!mounted) return;
        await ChallengeOfferSheet.show(
          context,
          offer: offer,
          onAccept: (days) => c.acceptChallenge(days: days),
          onDecline: c.declineChallenge,
        );
        _showingChallengeOffer = false;
      });
    }

    if (c.pendingChainOffer != null && !_showingChainOffer) {
      _showingChainOffer = true;
      final offer = c.pendingChainOffer!;
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (!mounted) return;
        await ChainOfferSheet.show(
          context,
          offer: offer,
          onAccept: c.acceptChain,
          onDecline: c.declineChain,
        );
        _showingChainOffer = false;
      });
    }

    if (c.needsPrompt && !_showingPrompt) {
      final requiresKey = c.pendingRequiresKey;
      final prompt = requiresKey != null ? promptFor(requiresKey) : null;
      if (requiresKey != null && prompt != null) {
        _showingPrompt = true;
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          if (!mounted) return;
          await QuestPromptSheet.show(
            context,
            requiresKey: requiresKey,
            prompt: prompt,
            onConfirm: c.confirmPrompt,
            onDecline: c.declinePrompt,
          );
          _showingPrompt = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = QuestsControllerProvider.of(context);
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: Column(
          children: [
            AppBarMain(scrollController: _scrollController),
            Expanded(
              child: ListenableBuilder(
                listenable: controller,
                builder: (context, _) {
                  return SingleChildScrollView(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.screenPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ── Active quest / break state ───────────────────────
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
                          child: controller.isBreakActive
                              ? BreakStateCard(
                                  key: const ValueKey('break'),
                                  onEndEarly: controller.endBreakEarly,
                                )
                              : controller.isDailyDoneToday
                                  ? const DailyCompletedCard(
                                      key: ValueKey('daily-done'))
                                  : controller.activeQuest == null
                                      ? const SizedBox.shrink()
                                      : QuestCard(
                                          key: ValueKey(
                                              controller.activeQuest!.id),
                                          questTitle:
                                              controller.activeQuest!.title,
                                          description:
                                              controller.activeQuest!.description,
                                          hint: controller.activeQuest!.hint,
                                          expiresAt:
                                              controller.activeQuest!.expiresAt,
                                          category:
                                              controller.activeQuest!.category,
                                          questsInCategory:
                                              controller.completedCount,
                                          assignedByAltrr: true,
                                          onComplete: () async {
                                            final quest = controller.activeQuest;
                                            if (quest == null) return;
                                            final saved =
                                                await context.push<bool>(
                                              '/submit',
                                              extra: quest,
                                            );
                                            if (saved == true)
                                              controller.completeQuest();
                                          },
                                          onSkip: controller.skipQuest,
                                        ),
                        ),
                        // ── Active chain quest ───────────────────────────────
                        if (controller.activeChainQuest != null) ...[
                          const SizedBox(height: AppSpacing.sectionGap),
                          SectionHeader(
                            label: 'CHAIN · STEP '
                                '${controller.activeChainQuest!.chainStep ?? 1}'
                                ' OF '
                                '${controller.activeChainQuest!.chainTotal ?? 2}',
                          ),
                          const SizedBox(height: AppSpacing.itemGap),
                          ChallengeQuestCard(
                            key: ValueKey(
                                'chain-${controller.activeChainQuest!.id}'),
                            questTitle: controller.activeChainQuest!.title,
                            description:
                                controller.activeChainQuest!.description,
                            category: controller.activeChainQuest!.category,
                            expiresAt: controller.activeChainQuest!.expiresAt,
                            onTap: () async {
                              final result = await context.push<String>(
                                '/challenge',
                                extra: controller.activeChainQuest,
                              );
                              if (result == 'complete') {
                                controller.completeChainStep();
                              }
                              if (result == 'abandon') {
                                controller.abandonChain();
                              }
                            },
                          ),
                        ],

                        // ── Active challenge quest ───────────────────────────
                        if (controller.activeChallengeQuest != null) ...[
                          const SizedBox(height: AppSpacing.sectionGap),
                          const SectionHeader(label: 'YOUR CHALLENGE'),
                          const SizedBox(height: AppSpacing.itemGap),
                          ChallengeQuestCard(
                            key: ValueKey(
                                'challenge-${controller.activeChallengeQuest!.id}'),
                            questTitle:
                                controller.activeChallengeQuest!.title,
                            description:
                                controller.activeChallengeQuest!.description,
                            category:
                                controller.activeChallengeQuest!.category,
                            expiresAt:
                                controller.activeChallengeQuest!.expiresAt,
                            onTap: () async {
                              final result = await context.push<String>(
                                '/challenge',
                                extra: controller.activeChallengeQuest,
                              );
                              if (result == 'complete') controller.completeChallenge();
                              if (result == 'abandon') controller.abandonChallenge();
                            },
                          ),
                        ],

                        const SizedBox(height: AppSpacing.sm),

                        // ── Debug chip: character + category ────────────────
                        _DebugChip(controller: controller),
                        const SizedBox(height: AppSpacing.md),

                        // ── DEBUG: Generate quest button ────────────────────
                        if (kDebugMode)
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.accent,
                                side: const BorderSide(
                                    color: AppColors.accent, width: 1),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
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
                        if (kDebugMode) const SizedBox(height: AppSpacing.sm),

                        // ── DEBUG: Set expiry ───────────────────────────────
                        if (kDebugMode)
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.purple,
                                side: const BorderSide(color: Colors.purple),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(AppRadius.button)),
                                ),
                              ),
                              onPressed: () =>
                                  _showSetExpiryDialog(context, controller),
                              icon: const Icon(Icons.timer_outlined, size: 16),
                              label: Text(
                                'Set Expiry',
                                style: AppTypography.unboundedBold(
                                    12, Colors.purple),
                              ),
                            ),
                          ),
                        if (kDebugMode) const SizedBox(height: AppSpacing.sm),

                        // ── DEBUG: Test challenge offer ─────────────────────
                        if (kDebugMode)
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.orange,
                                side:
                                    const BorderSide(color: Colors.orange),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(AppRadius.button)),
                                ),
                              ),
                              onPressed:
                                  controller.debugTriggerChallengeOffer,
                              icon: const Icon(Icons.flag_rounded, size: 16),
                              label: Text(
                                'Test Challenge',
                                style: AppTypography.unboundedBold(
                                    12, Colors.orange),
                              ),
                            ),
                          ),
                        if (kDebugMode) const SizedBox(height: AppSpacing.sm),

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

void _showSetExpiryDialog(BuildContext context, QuestsController controller) {
  final textController = TextEditingController(text: '10');
  showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      backgroundColor: AppColors.bgSurface,
      title: Text('Set expiry (debug)',
          style: AppTypography.unboundedBold(13, AppColors.textPrimary)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [5, 10, 30, 60].map((s) {
              return GestureDetector(
                onTap: () {
                  controller.debugSetExpiry(s);
                  Navigator.pop(dialogContext);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.bgElevated,
                    borderRadius: BorderRadius.circular(AppRadius.button),
                    border: Border.all(color: AppColors.borderMid),
                  ),
                  child: Text('${s}s',
                      style:
                          AppTypography.unboundedBold(10, AppColors.textPrimary)),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: textController,
            keyboardType: TextInputType.number,
            style: AppTypography.outfitMedium(14, AppColors.textPrimary),
            cursorColor: AppColors.accent,
            decoration: InputDecoration(
              hintText: 'Custom seconds',
              hintStyle: AppTypography.outfitMedium(14, AppColors.textMuted),
              filled: true,
              fillColor: AppColors.bgElevated,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.button),
                borderSide: const BorderSide(color: AppColors.borderMid),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.button),
                borderSide: const BorderSide(color: AppColors.borderMid),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.button),
                borderSide:
                    const BorderSide(color: AppColors.accent, width: 1.5),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext),
          child: Text('Cancel',
              style: AppTypography.outfitMedium(13, AppColors.textMuted)),
        ),
        TextButton(
          onPressed: () {
            final s = int.tryParse(textController.text);
            if (s != null && s > 0) controller.debugSetExpiry(s);
            Navigator.pop(dialogContext);
          },
          child: Text('Set',
              style: AppTypography.outfitMedium(13, AppColors.accent)),
        ),
      ],
    ),
  );
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
