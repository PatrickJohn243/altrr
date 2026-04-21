import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/database/isar_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_bar_back.dart';
import '../../../../core/widgets/quest_detail_card.dart';
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
                  children: [
                    QuestDetailCard(
                      quest: widget.quest,
                      character: _character,
                      onStartTimer: widget.quest.status == QuestStatus.active
                          ? () => context.push('/timer')
                          : null,
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
