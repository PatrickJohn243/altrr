import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/database/isar_service.dart';
import '../../../../core/services/alert_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_bar_back.dart';
import '../../../../core/widgets/quest_detail_card.dart';
import '../../../../shared/models/character.dart';
import '../../../../shared/models/quest.dart';

class ActiveQuestDetailScreen extends StatefulWidget {
  final Quest quest;
  const ActiveQuestDetailScreen({super.key, required this.quest});

  @override
  State<ActiveQuestDetailScreen> createState() =>
      _ActiveQuestDetailScreenState();
}

class _ActiveQuestDetailScreenState extends State<ActiveQuestDetailScreen> {
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

  Future<void> _onComplete() async {
    final saved = await context.push<bool>('/submit', extra: widget.quest);
    if (saved == true && mounted) context.pop('complete');
  }

  void _onSkip() {
    AlertService.show(
      context,
      title: 'Skip this quest?',
      message: 'The quest will be removed and a new one assigned tomorrow.',
      actions: [
        AlertAction(
          label: 'Skip',
          style: AlertActionStyle.danger,
          onTap: () => context.pop('skip'),
        ),
        AlertAction(
          label: 'Keep going',
          style: AlertActionStyle.ghost,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarBack(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenPadding,
                ),
                child: Column(
                  children: [
                    QuestDetailCard(
                      quest: widget.quest,
                      character: _character,
                      onStartTimer: () => context.push('/timer'),
                    ),
                    const SizedBox(height: AppSpacing.sectionGap),
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
        border: Border(top: BorderSide(color: AppColors.borderSubtle)),
      ),
      child: Row(
        children: [
          Expanded(
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
              onPressed: _onComplete,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_circle_outline, size: 16),
                  const SizedBox(width: 7),
                  Text('Complete', style: AppTypography.ctaButton),
                ],
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.textDisabled,
                side: const BorderSide(color: AppColors.borderMid),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppRadius.button)),
                ),
              ),
              onPressed: _onSkip,
              child: Text(
                'Skip',
                style: AppTypography.unboundedBold(12, AppColors.textDisabled),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
