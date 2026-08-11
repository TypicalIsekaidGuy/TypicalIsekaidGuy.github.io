import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../theme.dart';

/// Верхняя навигационная панель: якорная прокрутка + переключатель языка.
class NavBar extends StatelessWidget {
  final Map<String, GlobalKey> sectionKeys;
  final Locale locale;
  final ValueChanged<Locale> onLocaleChanged;

  const NavBar({
    super.key,
    required this.sectionKeys,
    required this.locale,
    required this.onLocaleChanged,
  });

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
    final l10n = AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;
    final compact = width < 860;

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
            _NavItem(l10n.navAbout, () => _scrollTo('about')),
            _NavItem(l10n.navExperience, () => _scrollTo('experience')),
            _NavItem(l10n.navSkills, () => _scrollTo('skills')),
            _NavItem(l10n.navTerminal, () => _scrollTo('terminal')),
            _NavItem(l10n.navContacts, () => _scrollTo('contacts')),
          ] else
            _NavItem(l10n.navContacts, () => _scrollTo('contacts')),
          const SizedBox(width: 12),
          _LocaleSwitcher(locale: locale, onChanged: onLocaleChanged),
        ],
      ),
    );
  }
}

/// Переключатель языка EN | RU.
class _LocaleSwitcher extends StatelessWidget {
  final Locale locale;
  final ValueChanged<Locale> onChanged;

  const _LocaleSwitcher({required this.locale, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.stroke),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _localeButton('EN', const Locale('en')),
          _localeButton('RU', const Locale('ru')),
        ],
      ),
    );
  }

  Widget _localeButton(String label, Locale target) {
    final active = locale.languageCode == target.languageCode;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onChanged(target),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            gradient: active ? AppTheme.heroGradient : null,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: active ? Colors.white : AppTheme.textMuted,
            ),
          ),
        ),
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
