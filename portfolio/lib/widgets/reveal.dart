import 'package:flutter/material.dart';

/// Плавное появление блока при попадании в зону видимости во время скролла.
class Reveal extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final double offsetY;

  const Reveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.offsetY = 36,
  });

  @override
  State<Reveal> createState() => _RevealState();
}

class _RevealState extends State<Reveal> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _started = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeStart());
  }

  void _maybeStart() {
    if (_started || !mounted) return;
    final box = context.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) {
      _started = true;
      _controller.forward();
      return;
    }
    final dy = box.localToGlobal(Offset.zero).dy;
    final viewH = MediaQuery.of(context).size.height;
    if (dy < viewH * 0.92) {
      _started = true;
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final curved = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    return NotificationListener<ScrollNotification>(
      onNotification: (_) {
        _maybeStart();
        return false;
      },
      child: FadeTransition(
        opacity: curved,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, widget.offsetY / 100),
            end: Offset.zero,
          ).animate(curved),
          child: widget.child,
        ),
      ),
    );
  }
}
