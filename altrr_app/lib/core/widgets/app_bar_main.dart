import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../controllers/user_profile_controller.dart';
import '../controllers/user_profile_provider.dart';
import '../../features/home/controllers/notifications_controller.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';

class AppBarMain extends StatefulWidget {
  final ScrollController? scrollController;
  const AppBarMain({super.key, this.scrollController});

  @override
  State<AppBarMain> createState() => _AppBarMainState();
}

class _AppBarMainState extends State<AppBarMain>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;
  bool _collapsed = false;

  static const _threshold = 40.0;

  double get _p => _anim.value;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
    widget.scrollController?.addListener(_onScroll);
  }

  @override
  void didUpdateWidget(AppBarMain old) {
    super.didUpdateWidget(old);
    if (old.scrollController != widget.scrollController) {
      old.scrollController?.removeListener(_onScroll);
      widget.scrollController?.addListener(_onScroll);
    }
  }

  void _onScroll() {
    final offset = widget.scrollController!.offset;
    final shouldCollapse = offset > _threshold;
    if (shouldCollapse && !_collapsed) {
      _collapsed = true;
      _ctrl.forward();
    } else if (!shouldCollapse && _collapsed) {
      _collapsed = false;
      _ctrl.reverse();
    }
  }

  @override
  void dispose() {
    widget.scrollController?.removeListener(_onScroll);
    _ctrl.dispose();
    super.dispose();
  }

  static String _fullGreeting() {
    final now = DateTime.now();
    final hour = now.hour;
    final seed = now.difference(DateTime(now.year, 1, 1)).inDays;
    final rng = Random(seed);

    const mornings = ['Good morning,', 'Rise and shine,', 'Morning,'];
    const afternoons = [
      'Good afternoon,',
      "Hope your day's going well,",
      'Afternoon,',
    ];
    const evenings = ['Good evening,', 'Evening,', 'Hope today was good,'];

    final List<String> pool;
    if (hour >= 5 && hour < 12) {
      pool = mornings;
    } else if (hour >= 12 && hour < 18) {
      pool = afternoons;
    } else {
      pool = evenings;
    }
    return pool[rng.nextInt(pool.length)];
  }

  @override
  Widget build(BuildContext context) {
    final profile = UserProfileProvider.of(context);
    return AnimatedBuilder(
      animation: _anim,
      builder: (context, _) => _build(context, profile),
    );
  }

  Widget _build(BuildContext context, UserProfileController profile) {
    final p = _p;

    final avatarSize = 44.0 - 12.0 * p;
    final nameOpacity = (1.0 - p * 1.5).clamp(0.0, 1.0);
    final vertPadding = AppSpacing.lg - 4.0 * p;
    final greetingSize = 12.0 + 6.0 * p;
    final greetingColor = Color.lerp(
      AppColors.textMuted,
      AppColors.textPrimary,
      p,
    )!;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.screenPadding,
        vertical: vertPadding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Greeting + username
          Expanded(
            child: Transform.translate(
              offset: Offset(0, -6 * p),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _fullGreeting(),
                    style: AppTypography.outfitMedium(greetingSize, greetingColor),
                  ),
                  ClipRect(
                    child: Align(
                      heightFactor: 1.0 - p,
                      alignment: Alignment.topLeft,
                      child: Opacity(
                        opacity: nameOpacity,
                        child: Row(
                          children: [
                            Text(profile.name, style: AppTypography.screenTitle),
                            const SizedBox(width: AppSpacing.sm),
                            _RingingBell(
                              onTap: () => context.push('/notifications'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Avatar
          GestureDetector(
            onTap: () => context.push('/profile'),
            child: Container(
              width: avatarSize,
              height: avatarSize,
              decoration: const BoxDecoration(
                color: AppColors.accent,
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.antiAlias,
              child: profile.avatarPath != null
                  ? Image.file(
                      File(profile.avatarPath!),
                      fit: BoxFit.cover,
                    )
                  : Center(
                      child: Text(
                        profile.initials,
                        style: AppTypography.unboundedExtraBold(
                          (14 - 3 * p).clamp(8, 14),
                          AppColors.textInverse,
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Ringing Bell ───────────────────────────────────────────────────────────────

class _RingingBell extends StatefulWidget {
  final VoidCallback onTap;
  const _RingingBell({required this.onTap});

  @override
  State<_RingingBell> createState() => _RingingBellState();
}

class _RingingBellState extends State<_RingingBell>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _rotation;
  Timer? _repeatTimer;
  final _notifications = NotificationsController.instance;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    );

    _rotation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.49), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 0.49, end: -0.49), weight: 30),
      TweenSequenceItem(tween: Tween(begin: -0.49, end: 0.35), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 0.35, end: -0.35), weight: 15),
      TweenSequenceItem(tween: Tween(begin: -0.35, end: 0.0), weight: 15),
    ]).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));

    _notifications.addListener(_onNotificationsChanged);
    _syncRinging();
  }

  void _onNotificationsChanged() => _syncRinging();

  void _syncRinging() {
    if (_notifications.unreadCount > 0) {
      _startRinging();
    } else {
      _stopRinging();
    }
  }

  void _startRinging() {
    if (_repeatTimer?.isActive ?? false) return;
    _ring();
    _repeatTimer = Timer.periodic(const Duration(seconds: 4), (_) => _ring());
  }

  void _stopRinging() {
    _repeatTimer?.cancel();
    _repeatTimer = null;
    _ctrl.stop();
    _ctrl.reset();
  }

  void _ring() {
    if (mounted) _ctrl.forward(from: 0);
  }

  @override
  void dispose() {
    _repeatTimer?.cancel();
    _notifications.removeListener(_onNotificationsChanged);
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _rotation,
        builder: (_, child) => Transform.rotate(
          angle: _rotation.value,
          alignment: Alignment.topCenter,
          child: child,
        ),
        child: const Icon(
          Icons.notifications_outlined,
          color: AppColors.accent,
          size: 22,
        ),
      ),
    );
  }
}
