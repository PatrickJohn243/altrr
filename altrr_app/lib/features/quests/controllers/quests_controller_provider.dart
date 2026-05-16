import 'package:flutter/widgets.dart';
import 'quests_controller.dart';

/// Provides a single [QuestsController] instance to the widget subtree.
///
/// Created once in [_AppShell] so home and quests screens always share
/// the same controller — completing on home reflects immediately on quests.
class QuestsControllerProvider extends InheritedWidget {
  final QuestsController controller;

  const QuestsControllerProvider({
    super.key,
    required this.controller,
    required super.child,
  });

  static QuestsController of(BuildContext context) {
    final p = context
        .dependOnInheritedWidgetOfExactType<QuestsControllerProvider>();
    assert(p != null, 'QuestsControllerProvider not found in widget tree');
    return p!.controller;
  }

  @override
  bool updateShouldNotify(QuestsControllerProvider old) => false;
}
