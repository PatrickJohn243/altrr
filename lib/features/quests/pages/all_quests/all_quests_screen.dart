import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_bar_back.dart';
import '../../../../core/widgets/quest_row_card.dart';
import '../../controllers/all_quests_controller.dart';
import '../../../../shared/data/quest_categories.dart';
import '../../widgets/quests_empty_state.dart';

class AllQuestsScreen extends StatefulWidget {
  const AllQuestsScreen({super.key});

  @override
  State<AllQuestsScreen> createState() => _AllQuestsScreenState();
}

class _AllQuestsScreenState extends State<AllQuestsScreen> {
  late final AllQuestsController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AllQuestsController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarBack(),

            // ── Screen title + count ───────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenPadding,
              ),
              child: Text(
                'COMPLETED',
                style: AppTypography.unboundedBlack(22, AppColors.textPrimary),
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // ── Search bar ─────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenPadding,
              ),
              child: Container(
                height: 44,
                decoration: const BoxDecoration(
                  color: AppColors.bgSurface,
                  borderRadius: BorderRadius.all(Radius.circular(AppRadius.card)),
                  border: Border.fromBorderSide(
                    BorderSide(color: AppColors.borderSubtle),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: AppSpacing.cardPaddingMd),
                    const Icon(Icons.search, color: AppColors.textMuted, size: 18),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: TextField(
                        controller: _controller.searchController,
                        onChanged: _controller.onSearchChanged,
                        style: AppTypography.outfitMedium(14, AppColors.textPrimary),
                        cursorColor: AppColors.accent,
                        decoration: InputDecoration(
                          hintText: 'Search completed quests...',
                          hintStyle: AppTypography.outfitMedium(14, AppColors.textMuted),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.cardPaddingMd),
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // ── List ───────────────────────────────────────────────────────
            Expanded(
              child: ListenableBuilder(
                listenable: _controller,
                builder: (context, _) {
                  final quests = _controller.filtered;
                  if (quests.isEmpty) {
                    return RefreshIndicator(
                      color: AppColors.accent,
                      backgroundColor: AppColors.bgSurface,
                      displacement: 24,
                      onRefresh: _controller.reload,
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: QuestsEmptyState(query: _controller.query),
                        ),
                      ),
                    );
                  }
                  return RefreshIndicator(
                    color: AppColors.accent,
                    backgroundColor: AppColors.bgSurface,
                    displacement: 24,
                    onRefresh: _controller.reload,
                    child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(
                        left: AppSpacing.screenPadding,
                        right: AppSpacing.screenPadding,
                        bottom: AppSpacing.xxl,
                      ),
                      itemCount: quests.length,
                      separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
                      itemBuilder: (context, i) {
                        final q = quests[i];
                        return QuestRowCard(
                          icon: Icon(
                            QuestCategories.iconFor(q.category),
                            size: 18,
                            color: AppColors.textMuted,
                          ),
                          category: q.category,
                          questTitle: q.title,
                          date: _formatDate(q.completedAt ?? q.assignedAt),
                          onTap: () => context.push('/quest', extra: q),
                        );
                      },
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

  String _formatDate(DateTime dt) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[dt.month - 1]} ${dt.day}';
  }
}
