import 'package:flutter/material.dart';
import '../services/alert_service.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

class AppAlertDialog extends StatelessWidget {
  final String title;
  final String? message;
  final Widget? content;
  final List<AlertAction> actions;

  const AppAlertDialog({
    super.key,
    required this.title,
    required this.message,
    required this.content,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF1C1C1C),
              borderRadius: BorderRadius.all(Radius.circular(AppRadius.card)),
              border: Border(
                top:    BorderSide(color: AppColors.borderSubtle),
                left:   BorderSide(color: AppColors.borderSubtle),
                right:  BorderSide(color: AppColors.borderSubtle),
                bottom: BorderSide(color: AppColors.borderSubtle, width: 3),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(AppRadius.card)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.cardPadding,
                      AppSpacing.cardPadding,
                      AppSpacing.cardPadding,
                      AppSpacing.lg,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTypography.unboundedBold(16, AppColors.textPrimary),
                        ),
                        if (message != null) ...[
                          const SizedBox(height: AppSpacing.sm),
                          Text(
                            message!,
                            style: AppTypography.outfitMedium(13, AppColors.textMuted),
                          ),
                        ],
                        if (content != null) ...[
                          const SizedBox(height: AppSpacing.md),
                          content!,
                        ],
                      ],
                    ),
                  ),
                  if (actions.isNotEmpty)
                    const Divider(
                      color: AppColors.borderSubtle,
                      height: 1,
                      thickness: 1,
                    ),
                  if (actions.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        AppSpacing.cardPadding,
                        AppSpacing.md,
                        AppSpacing.cardPadding,
                        AppSpacing.cardPadding,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < actions.length; i++) ...[
                            if (i > 0) const SizedBox(width: AppSpacing.sm),
                            Expanded(child: AlertActionButton(action: actions[i])),
                          ],
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AlertActionButton extends StatelessWidget {
  final AlertAction action;
  const AlertActionButton({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    void handleTap() {
      if (action.dismissOnTap) Navigator.of(context).pop();
      action.onTap?.call();
    }

    final (textColor, borderColor) = switch (action.style) {
      AlertActionStyle.primary => (AppColors.accent, AppColors.accent),
      AlertActionStyle.danger  => (AppColors.danger, AppColors.danger),
      AlertActionStyle.ghost   => (AppColors.textDisabled, AppColors.borderMid),
    };

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: Colors.transparent,
        side: BorderSide(color: borderColor),
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.button)),
        ),
      ),
      onPressed: handleTap,
      child: Text(
        action.label,
        style: AppTypography.unboundedBold(11, textColor),
      ),
    );
  }
}
