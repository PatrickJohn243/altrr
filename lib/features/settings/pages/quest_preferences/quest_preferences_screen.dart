import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_bar_back.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/config/app_features.dart';
import '../../../../core/config/app_preferences.dart';
import '../../../../shared/data/quest_categories.dart';
import '../../widgets/locked_toggle_card.dart';

class QuestPreferencesScreen extends StatefulWidget {
  const QuestPreferencesScreen({super.key});

  @override
  State<QuestPreferencesScreen> createState() => _QuestPreferencesScreenState();
}

class _QuestPreferencesScreenState extends State<QuestPreferencesScreen> {
  late Set<String> _selected;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _selected = Set.from(AppPreferences.preferredCategories);
  }

  void _toggle(String key) {
    setState(() {
      if (_selected.contains(key)) {
        if (_selected.length > 1) _selected.remove(key);
      } else {
        _selected.add(key);
      }
    });
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    await AppPreferences.setPreferredCategories(_selected.toList());
    setState(() => _saving = false);
    if (mounted) context.pop();
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
                    horizontal: AppSpacing.screenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSpacing.xl),
                    const SectionHeader(label: 'CATEGORIES'),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Altrr assigns quests across all areas — your preferences nudge the balance.',
                      style: AppTypography.outfitMedium(12, AppColors.textMuted),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: AppSpacing.md,
                      crossAxisSpacing: AppSpacing.md,
                      childAspectRatio: 2.6,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: QuestCategories.all.map((c) {
                        final isOn = _selected.contains(c.key);
                        return GestureDetector(
                          onTap: () => _toggle(c.key),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            decoration: BoxDecoration(
                              color: isOn
                                  ? AppColors.accentSubtle
                                  : AppColors.bgSurface,
                              borderRadius:
                                  BorderRadius.circular(AppRadius.button),
                              border: Border.all(
                                color: isOn
                                    ? AppColors.accent
                                    : AppColors.borderMid,
                                width: isOn ? 1.5 : 1,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  c.icon,
                                  size: 18,
                                  color: isOn
                                      ? AppColors.accent
                                      : AppColors.textMuted,
                                ),
                                const SizedBox(width: AppSpacing.sm),
                                Text(
                                  c.label,
                                  style: isOn
                                      ? AppTypography.unboundedBold(
                                          11, AppColors.accent)
                                      : AppTypography.unboundedBold(
                                          11, AppColors.textMuted),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: AppSpacing.xxxl),
                    const SectionHeader(label: 'QUEST TYPES'),
                    const SizedBox(height: AppSpacing.md),
                    LockedToggleCard(
                      icon: Icons.link_outlined,
                      label: 'Chain quests',
                      sublabel: 'Multi-step arcs that unlock over time',
                      feature: AppFeatures.chainQuests,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    LockedToggleCard(
                      icon: Icons.bolt_outlined,
                      label: 'Challenge quests',
                      sublabel: 'Longer commitments for neglected areas',
                      feature: AppFeatures.challengeQuests,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    LockedToggleCard(
                      icon: Icons.nights_stay_outlined,
                      label: 'Break mode',
                      sublabel: 'Rest days when you need them',
                      feature: AppFeatures.breakMode,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    LockedToggleCard(
                      icon: Icons.timer_outlined,
                      label: 'Limited time quests',
                      sublabel: 'Special quests available for a short window',
                      feature: AppFeatures.limitedTimeQuests,
                    ),
                    const SizedBox(height: AppSpacing.xxxl),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _saving ? null : _save,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accent,
                          foregroundColor: AppColors.textInverse,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppRadius.button),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          _saving ? 'Saving...' : 'Save preferences',
                          style: AppTypography.ctaButton,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxl),
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
