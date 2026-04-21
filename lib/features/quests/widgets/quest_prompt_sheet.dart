import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/generation/quest/prompts.dart';

/// Bottom sheet that asks the user a yes/no or options prompt before showing
/// a quest that requires certain conditions (e.g. owning a bike, gym access).
class QuestPromptSheet extends StatefulWidget {
  final String requiresKey;
  final QuestPrompt prompt;
  final VoidCallback onConfirm;
  final VoidCallback onDecline;

  const QuestPromptSheet._({
    required this.requiresKey,
    required this.prompt,
    required this.onConfirm,
    required this.onDecline,
  });

  static Future<void> show(
    BuildContext context, {
    required String requiresKey,
    required QuestPrompt prompt,
    required VoidCallback onConfirm,
    required VoidCallback onDecline,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      builder: (_) => QuestPromptSheet._(
        requiresKey: requiresKey,
        prompt: prompt,
        onConfirm: onConfirm,
        onDecline: onDecline,
      ),
    );
  }

  @override
  State<QuestPromptSheet> createState() => _QuestPromptSheetState();
}

class _QuestPromptSheetState extends State<QuestPromptSheet> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    final isOptions = widget.prompt.type == PromptType.options;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border.all(color: AppColors.borderMid),
      ),
      padding: EdgeInsets.fromLTRB(
        AppSpacing.screenPadding,
        AppSpacing.xl,
        AppSpacing.screenPadding,
        AppSpacing.screenPadding +
            MediaQuery.of(context).viewInsets.bottom +
            MediaQuery.of(context).padding.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Handle ──────────────────────────────────────────────────────
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.borderMid,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          // ── Before your quest… label ─────────────────────────────────────
          Text(
            'QUICK CHECK',
            style: AppTypography.unboundedBold(9, AppColors.textMuted)
                .copyWith(letterSpacing: 1.2),
          ),
          const SizedBox(height: AppSpacing.md),

          Text(
            widget.prompt.question,
            style: AppTypography.unboundedBlack(18, AppColors.textPrimary),
          ),
          const SizedBox(height: AppSpacing.xl),

          // ── Options (for PromptType.options) ─────────────────────────────
          if (isOptions && widget.prompt.options != null) ...[
            ...widget.prompt.options!.map((opt) {
              final selected = _selectedOption == opt;
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: GestureDetector(
                  onTap: () => setState(() => _selectedOption = opt),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg, vertical: 14),
                    decoration: BoxDecoration(
                      color: selected ? AppColors.accent : AppColors.bgElevated,
                      borderRadius: BorderRadius.circular(AppRadius.button),
                      border: Border.all(
                        color: selected ? AppColors.accent : AppColors.borderMid,
                      ),
                    ),
                    child: Text(
                      opt,
                      style: AppTypography.outfitSemiBold(
                        14,
                        selected ? AppColors.textInverse : AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: AppSpacing.md),
            SizedBox(
              width: double.infinity,
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
                onPressed: _selectedOption == null
                    ? null
                    : () {
                        Navigator.pop(context);
                        widget.onConfirm();
                      },
                child: Text('Got it', style: AppTypography.ctaButton),
              ),
            ),
          ],

          // ── Yes / No (for PromptType.yesNo) ──────────────────────────────
          if (!isOptions) ...[
            SizedBox(
              width: double.infinity,
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
                onPressed: () {
                  Navigator.pop(context);
                  widget.onConfirm();
                },
                child: Text('Yes', style: AppTypography.ctaButton),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            SizedBox(
              width: double.infinity,
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
                onPressed: () {
                  Navigator.pop(context);
                  widget.onDecline();
                },
                child: Text(
                  'No — give me another',
                  style:
                      AppTypography.unboundedBold(12, AppColors.textDisabled),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
