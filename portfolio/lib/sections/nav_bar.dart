import 'package:flutter/material.dart';

import '../theme.dart';

/// Верхняя навигационная панель с якорной прокруткой к секциям.
class NavBar extends StatelessWidget {
  final Map<String, GlobalKey> sectionKeys;

  const NavBar({super.key, required this.sectionKeys});

  void _scrollTo(String key) {
    final ctx = sectionKeys[key]?.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final compact = width < 760;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: compact ? 20 : 48, vertical: 18),
      decoration: BoxDecoration(
        color: AppTheme.bg.withValues(alpha: 0.75),
        border: Border(
          bottom: BorderSide(color: AppTheme.stroke.withValues(alpha: 0.5)),
        ),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (r) => AppTheme.heroGradient.createShader(r),
            child: Text(
              'SJ.dev',
              style: AppTheme.heading(size: 20).copyWith(color: Colors.white),
            ),
          ),
          const Spacer(),
          if (!compact) ...[
            _NavItem('Обо мне', () => _scrollTo('about')),
            _NavItem('Опыт', () => _scrollTo('experience')),
            _NavItem('Навыки', () => _scrollTo('skills')),
            _NavItem('Терминал', () => _scrollTo('terminal')),
            _NavItem('Контакты', () => _scrollTo('contacts')),
          ] else
            _NavItem('Контакты', () => _scrollTo('contacts')),
        ],
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  const _NavItem(this.text, this.onTap);

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 150),
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: _hovered ? AppTheme.accent : AppTheme.textSecondary,
            ),
            child: Text(widget.text),
          ),
        ),
      ),
    );
  }
}

/// Общая обёртка для якоря секции.
class SectionAnchor extends StatelessWidget {
  final String sectionId;
  final Map<String, GlobalKey> sectionKeys;
  final Widget child;

  SectionAnchor({
    super.key,
    required this.sectionId,
    required this.sectionKeys,
    required this.child,
  }) {
    sectionKeys.putIfAbsent(sectionId, () => GlobalKey());
  }

  @override
  Widget build(BuildContext context) {
    return Container(key: sectionKeys[sectionId], child: child);
  }
}
