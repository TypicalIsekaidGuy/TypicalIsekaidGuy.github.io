import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme.dart';

/// Кнопка с hover-анимацией. Варианты: градиентная (primary) и контурная.
class AppButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final String url;
  final bool filled;

  const AppButton({
    super.key,
    required this.text,
    required this.icon,
    required this.url,
    this.filled = true,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _hovered = false;

  Future<void> _open() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: _open,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          transform: Matrix4.translationValues(0, _hovered ? -3 : 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 15),
          decoration: BoxDecoration(
            gradient: widget.filled ? AppTheme.heroGradient : null,
            color: widget.filled ? null : Colors.transparent,
            borderRadius: BorderRadius.circular(14),
            border: widget.filled
                ? null
                : Border.all(
                    color: _hovered ? AppTheme.accent : AppTheme.stroke,
                    width: 1.4,
                  ),
            boxShadow: widget.filled && _hovered
                ? [
                    BoxShadow(
                      color: AppTheme.primary.withValues(alpha: 0.45),
                      blurRadius: 24,
                      offset: const Offset(0, 10),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 19,
                color: widget.filled ? Colors.white : AppTheme.textPrimary,
              ),
              const SizedBox(width: 10),
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: widget.filled ? Colors.white : AppTheme.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
