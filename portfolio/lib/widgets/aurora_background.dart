import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme.dart';

/// Анимированный фон: медленно дрейфующие цветные «аврора»-пятна
/// и сетка точек. Реагирует на движение мыши лёгким параллаксом.
class AuroraBackground extends StatefulWidget {
  final Widget child;
  const AuroraBackground({super.key, required this.child});

  @override
  State<AuroraBackground> createState() => _AuroraBackgroundState();
}

class _AuroraBackgroundState extends State<AuroraBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Offset _pointer = Offset.zero;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (e) => setState(() => _pointer = e.localPosition),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _AuroraPainter(
              t: _controller.value * 2 * math.pi,
              pointer: _pointer,
            ),
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}

class _AuroraPainter extends CustomPainter {
  final double t;
  final Offset pointer;

  _AuroraPainter({required this.t, required this.pointer});

  void _blob(Canvas canvas, Size size, Color color, double radius,
      Offset base, double phase, double speed) {
    final dx = base.dx * size.width +
        math.sin(t * speed + phase) * size.width * 0.06 +
        pointer.dx * 0.02;
    final dy = base.dy * size.height +
        math.cos(t * speed * 0.8 + phase) * size.height * 0.08 +
        pointer.dy * 0.015;
    final paint = Paint()
      ..shader = RadialGradient(
        colors: [color.withValues(alpha: 0.35), color.withValues(alpha: 0.0)],
      ).createShader(Rect.fromCircle(center: Offset(dx, dy), radius: radius));
    canvas.drawCircle(Offset(dx, dy), radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Offset.zero & size,
      Paint()..color = AppTheme.bg,
    );

    _blob(canvas, size, AppTheme.primary, size.width * 0.45,
        const Offset(0.15, 0.12), 0.0, 1.0);
    _blob(canvas, size, AppTheme.accentBlue, size.width * 0.4,
        const Offset(0.85, 0.25), 2.1, 0.7);
    _blob(canvas, size, AppTheme.accent, size.width * 0.35,
        const Offset(0.55, 0.85), 4.2, 0.85);

    // Сетка точек
    final dotPaint = Paint()..color = Colors.white.withValues(alpha: 0.035);
    const step = 36.0;
    for (double x = 0; x < size.width; x += step) {
      for (double y = 0; y < size.height; y += step) {
        canvas.drawCircle(Offset(x, y), 1.1, dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(_AuroraPainter oldDelegate) =>
      oldDelegate.t != t || oldDelegate.pointer != pointer;
}
