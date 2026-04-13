import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

// ── Action style ──────────────────────────────────────────────────────────────

enum AlertActionStyle {
  /// Lime background, dark text — primary CTA.
  primary,

  /// Red (#FF5454) background, white text — destructive action.
  danger,

  /// Outlined border, muted text — secondary / cancel.
  ghost,
}

// ── Action model ──────────────────────────────────────────────────────────────

class AlertAction {
  final String label;
  final AlertActionStyle style;

  /// Called when the button is tapped. The dialog is dismissed automatically
  /// before [onTap] runs unless [dismissOnTap] is false.
  final VoidCallback? onTap;

  /// Whether to pop the dialog before calling [onTap]. Defaults to true.
  final bool dismissOnTap;

  const AlertAction({
    required this.label,
    this.style = AlertActionStyle.ghost,
    this.onTap,
    this.dismissOnTap = true,
  });
}

// ── Service ───────────────────────────────────────────────────────────────────

class AlertService {
  AlertService._();

  // ── Presets ───────────────────────────────────────────────────────────────

  static Future<void> skipCancel(
    BuildContext context, {
    required String title,
    String? message,
    Widget? content,
    VoidCallback? onSkip,
  }) =>
      show(
        context,
        title: title,
        message: message,
        content: content,
        actions: [
          AlertAction(
            label: 'Skip',
            style: AlertActionStyle.danger,
            onTap: onSkip,
          ),
          AlertAction(label: 'Cancel'),
        ],
      );

  static Future<void> ok(
    BuildContext context, {
    required String title,
    String? message,
    Widget? content,
    VoidCallback? onOk,
  }) =>
      show(
        context,
        title: title,
        message: message,
        content: content,
        actions: [
          AlertAction(
            label: 'OK',
            style: AlertActionStyle.primary,
            onTap: onOk,
          ),
        ],
      );

  static Future<void> gotIt(
    BuildContext context, {
    required String title,
    String? message,
    Widget? content,
    VoidCallback? onGotIt,
  }) =>
      show(
        context,
        title: title,
        message: message,
        content: content,
        actions: [
          AlertAction(
            label: 'Got it',
            onTap: onGotIt,
          ),
        ],
      );

  static Future<void> show(
    BuildContext context, {
    required String title,
    String? message,
    Widget? content,
    required List<AlertAction> actions,
    bool barrierDismissible = true,
  }) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: 'Alert',
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 220),
      transitionBuilder: (_, anim, __, child) {
        final curve = CurvedAnimation(parent: anim, curve: Curves.easeOutCubic);
        return FadeTransition(
          opacity: curve,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.94, end: 1.0).animate(curve),
            child: child,
          ),
        );
      },
      pageBuilder: (dialogContext, _, __) => _AlertDialog(
        title: title,
        message: message,
        content: content,
        actions: actions,
      ),
    );
  }
}

// ── Dialog widget ─────────────────────────────────────────────────────────────

class _AlertDialog extends StatelessWidget {
  final String title;
  final String? message;
  final Widget? content;
  final List<AlertAction> actions;

  const _AlertDialog({
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
              top: BorderSide(color: AppColors.borderSubtle),
              left: BorderSide(color: AppColors.borderSubtle),
              right: BorderSide(color: AppColors.borderSubtle),
              bottom: BorderSide(color: AppColors.borderSubtle, width: 3),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(AppRadius.card)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Text content ──────────────────────────────────────────
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

                // ── Divider ───────────────────────────────────────────────
                if (actions.isNotEmpty)
                  const Divider(
                    color: AppColors.borderSubtle,
                    height: 1,
                    thickness: 1,
                  ),

                // ── Actions row ───────────────────────────────────────────
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
                          _ActionButton(action: actions[i]),
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

// ── Action button ─────────────────────────────────────────────────────────────

class _ActionButton extends StatelessWidget {
  final AlertAction action;

  const _ActionButton({required this.action});

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
