import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// A widget that paints a subtle grid pattern behind its [child].
///
/// Usage — full screen background:
/// ```dart
/// GridBackground(
///   squareSize: 24,
///   child: Scaffold(...),
/// )
/// ```
///
/// Usage — section background:
/// ```dart
/// GridBackground(
///   squareSize: 40,
///   lineColor: AppColors.borderSubtle,
///   child: Container(...),
/// )
/// ```
class GridBackground extends StatelessWidget {
  /// Size of each grid cell in logical pixels.
  final double squareSize;

  /// Color of the grid lines. Defaults to [AppColors.borderSubtle].
  final Color lineColor;

  /// Width of each grid line. Defaults to 1.
  final double lineWidth;

  /// Widget painted on top of the grid.
  final Widget? child;

  const GridBackground({
    super.key,
    required this.squareSize,
    this.lineColor = AppColors.borderSubtle,
    this.lineWidth = 1.0,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _GridPainter(
        squareSize: squareSize,
        lineColor: lineColor,
        lineWidth: lineWidth,
      ),
      child: child,
    );
  }
}

// ── Painter ───────────────────────────────────────────────────────────────────

class _GridPainter extends CustomPainter {
  final double squareSize;
  final Color lineColor;
  final double lineWidth;

  const _GridPainter({
    required this.squareSize,
    required this.lineColor,
    required this.lineWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = lineWidth
      ..isAntiAlias = false; // crisp lines on pixel boundaries

    // Vertical lines
    for (double x = 0; x <= size.width; x += squareSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Horizontal lines
    for (double y = 0; y <= size.height; y += squareSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_GridPainter old) =>
      old.squareSize != squareSize ||
      old.lineColor != lineColor ||
      old.lineWidth != lineWidth;
}
