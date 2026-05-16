import 'package:flutter/material.dart';

class QuestCompletionTransition extends StatefulWidget {
  final Widget questArea;
  final Widget completedCard;
  final bool showCompleted;

  const QuestCompletionTransition({
    super.key,
    required this.questArea,
    required this.completedCard,
    required this.showCompleted,
  });

  @override
  State<QuestCompletionTransition> createState() =>
      _QuestCompletionTransitionState();
}

class _QuestCompletionTransitionState extends State<QuestCompletionTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _exitOpacity;
  late final Animation<double> _exitSize;
  late final Animation<double> _enterOpacity;
  late final Animation<Offset> _enterSlide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _exitOpacity = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );
    _exitSize = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.25, 0.85, curve: Curves.easeInOut),
      ),
    );
    _enterOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.3, 0.75, curve: Curves.easeOut),
      ),
    );
    _enterSlide = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.3, 0.85, curve: Curves.easeOutCubic),
      ),
    );

    if (widget.showCompleted) _ctrl.value = 1.0;
  }

  @override
  void didUpdateWidget(QuestCompletionTransition old) {
    super.didUpdateWidget(old);
    if (!old.showCompleted && widget.showCompleted) {
      _ctrl.forward();
    } else if (old.showCompleted && !widget.showCompleted) {
      _ctrl.reset();
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.showCompleted && _ctrl.value == 0.0) return widget.questArea;
    if (widget.showCompleted && _ctrl.value == 1.0) return widget.completedCard;

    return AnimatedBuilder(
      animation: _ctrl,
      builder: (context, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizeTransition(
              sizeFactor: _exitSize,
              axisAlignment: -1.0,
              child: IgnorePointer(
                child: FadeTransition(
                  opacity: _exitOpacity,
                  child: widget.questArea,
                ),
              ),
            ),
            FadeTransition(
              opacity: _enterOpacity,
              child: SlideTransition(
                position: _enterSlide,
                child: widget.completedCard,
              ),
            ),
          ],
        );
      },
    );
  }
}
