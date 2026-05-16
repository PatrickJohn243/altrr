import 'package:flutter/material.dart';
import '../widgets/alert_dialog.dart';

enum AlertActionStyle { primary, danger, ghost }

class AlertAction {
  final String label;
  final AlertActionStyle style;
  final VoidCallback? onTap;
  final bool dismissOnTap;

  const AlertAction({
    required this.label,
    this.style = AlertActionStyle.ghost,
    this.onTap,
    this.dismissOnTap = true,
  });
}

class AlertService {
  AlertService._();

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
          AlertAction(label: 'Skip', style: AlertActionStyle.danger, onTap: onSkip),
          const AlertAction(label: 'Cancel'),
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
          AlertAction(label: 'OK', style: AlertActionStyle.primary, onTap: onOk),
        ],
      );

  static Future<void> upcoming(
    BuildContext context, {
    required String feature,
  }) =>
      show(
        context,
        title: 'Coming soon',
        message: '$feature isn\'t available yet — it\'s on the way.',
        actions: [
          const AlertAction(label: 'Got it'),
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
          AlertAction(label: 'Got it', onTap: onGotIt),
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
      pageBuilder: (dialogContext, _, __) => AppAlertDialog(
        title: title,
        message: message,
        content: content,
        actions: actions,
      ),
    );
  }
}
