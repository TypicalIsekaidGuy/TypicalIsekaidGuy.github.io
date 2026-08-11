import 'dart:async';

import 'package:flutter/material.dart';

import '../theme.dart';

/// Эффект печатной машинки: циклически печатает и стирает строки.
class Typewriter extends StatefulWidget {
  final List<String> texts;
  final TextStyle? style;

  const Typewriter({super.key, required this.texts, this.style});

  @override
  State<Typewriter> createState() => _TypewriterState();
}

class _TypewriterState extends State<Typewriter> {
  int _textIndex = 0;
  int _charIndex = 0;
  bool _deleting = false;
  bool _cursorVisible = true;
  Timer? _timer;
  Timer? _cursorTimer;

  @override
  void initState() {
    super.initState();
    _schedule(const Duration(milliseconds: 600));
    _cursorTimer = Timer.periodic(const Duration(milliseconds: 530), (_) {
      if (mounted) setState(() => _cursorVisible = !_cursorVisible);
    });
  }

  void _schedule(Duration d) {
    _timer?.cancel();
    _timer = Timer(d, _tick);
  }

  void _tick() {
    if (!mounted) return;
    final current = widget.texts[_textIndex];
    setState(() {
      if (!_deleting) {
        _charIndex++;
        if (_charIndex == current.length) {
          _deleting = true;
          _schedule(const Duration(milliseconds: 1600));
          return;
        }
      } else {
        _charIndex--;
        if (_charIndex == 0) {
          _deleting = false;
          _textIndex = (_textIndex + 1) % widget.texts.length;
          _schedule(const Duration(milliseconds: 400));
          return;
        }
      }
    });
    _schedule(Duration(milliseconds: _deleting ? 32 : 65));
  }

  @override
  void dispose() {
    _timer?.cancel();
    _cursorTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = widget.texts[_textIndex].substring(0, _charIndex);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(text, style: widget.style, overflow: TextOverflow.visible),
        ),
        AnimatedOpacity(
          opacity: _cursorVisible ? 1 : 0,
          duration: const Duration(milliseconds: 100),
          child: Text('▍', style: widget.style?.copyWith(color: AppTheme.accent)),
        ),
      ],
    );
  }
}
