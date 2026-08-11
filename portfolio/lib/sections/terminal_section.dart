import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/portfolio_data.dart';
import '../l10n/app_localizations.dart';
import '../theme.dart';
import '../widgets/reveal.dart';
import '../widgets/section_header.dart';

/// Интерактивный терминал — «фишка» сайта.
/// Команды: help, about, skills, experience, contacts,
/// resume, telegram, whoami, sudo, clear.
class TerminalSection extends StatefulWidget {
  const TerminalSection({super.key});

  @override
  State<TerminalSection> createState() => _TerminalSectionState();
}

class _TerminalLine {
  final String text;
  final Color color;
  final bool isCommand;
  const _TerminalLine(this.text, this.color, {this.isCommand = false});
}

class _TerminalSectionState extends State<TerminalSection> {
  final TextEditingController _input = TextEditingController();
  final FocusNode _focus = FocusNode();
  final ScrollController _scroll = ScrollController();
  final List<_TerminalLine> _lines = [];
  final List<String> _history = [];
  int _historyIndex = -1;
  bool _welcomed = false;

  static const String _prompt = 'visitor@sergey:~';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_welcomed) {
      _welcomed = true;
      final l10n = AppLocalizations.of(context);
      _print([l10n.termWelcome1, l10n.termWelcome2, ''], AppTheme.textMuted);
    }
  }

  @override
  void dispose() {
    _input.dispose();
    _focus.dispose();
    _scroll.dispose();
    super.dispose();
  }

  void _print(List<String> texts, Color color) {
    setState(() {
      _lines.addAll(texts.map((t) => _TerminalLine(t, color)));
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scroll.hasClients) {
        _scroll.animateTo(
          _scroll.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _run(String raw) {
    final l10n = AppLocalizations.of(context);
    final cmd = raw.trim();
    setState(() {
      _lines.add(_TerminalLine('$_prompt \$ $cmd', AppTheme.textPrimary,
          isCommand: true));
    });
    if (cmd.isEmpty) return;
    _history.add(cmd);
    _historyIndex = _history.length;

    final name = cmd.toLowerCase().split(' ').first;
    switch (name) {
      case 'help':
        _print([
          l10n.termHelpHeader,
          l10n.termHelpAbout,
          l10n.termHelpSkills,
          l10n.termHelpExperience,
          l10n.termHelpContacts,
          l10n.termHelpResume,
          l10n.termHelpTelegram,
          l10n.termHelpWhoami,
          l10n.termHelpClear,
        ], AppTheme.textSecondary);
      case 'about':
        _print([l10n.aboutText, ''], AppTheme.textSecondary);
        _print(
          [l10n.termLocationLine(PortfolioData.locationShort, l10n.termExperienceYears)],
          AppTheme.accentBlue,
        );
      case 'skills':
        final titles = [
          l10n.skillGroup1, l10n.skillGroup2, l10n.skillGroup3,
          l10n.skillGroup4, l10n.skillGroup5, l10n.skillGroup6,
        ];
        for (int i = 0; i < titles.length; i++) {
          _print(['${titles[i]}: ${PortfolioData.skillNames[i].join(", ")}'],
              AppTheme.textSecondary);
        }
      case 'experience':
        final jobs = [
          (PortfolioData.companies[0], l10n.job1Role, l10n.job1Period, l10n.job1Duration, true),
          (PortfolioData.companies[1], l10n.job2Role, l10n.job2Period, l10n.job2Duration, false),
          (PortfolioData.companies[2], l10n.job3Role, l10n.job3Period, l10n.job3Duration, false),
        ];
        for (final j in jobs) {
          _print(
            ['● ${j.$1} — ${j.$2}', '  ${j.$3} (${j.$4})'],
            j.$5 ? AppTheme.accent : AppTheme.textSecondary,
          );
        }
      case 'contacts':
        _print([
          l10n.termContactsTelegram(PortfolioData.telegramHandle),
          l10n.termContactsEmail(PortfolioData.email),
          l10n.termContactsPhone(PortfolioData.phone),
        ], AppTheme.textSecondary);
      case 'resume':
        _print([l10n.termOpeningResume], AppTheme.accent);
        launchUrl(Uri.parse(PortfolioData.resumeAsset));
      case 'telegram':
        _print([l10n.termOpeningTelegram], AppTheme.accent);
        launchUrl(Uri.parse(PortfolioData.telegramUrl),
            mode: LaunchMode.externalApplication);
      case 'whoami':
        _print([l10n.termWhoami1, l10n.termWhoami2], AppTheme.textSecondary);
      case 'sudo':
        _print([l10n.termSudo], AppTheme.accent);
      case 'clear':
        setState(_lines.clear);
      default:
        _print([l10n.termNotFound(name)], const Color(0xFFFF6B81));
    }
    _input.clear();
    _focus.requestFocus();
  }

  void _historyUp() {
    if (_history.isEmpty || _historyIndex <= 0) return;
    setState(() {
      _historyIndex--;
      _input.text = _history[_historyIndex];
      _input.selection = TextSelection.collapsed(offset: _input.text.length);
    });
  }

  void _historyDown() {
    if (_historyIndex >= _history.length - 1) {
      setState(() {
        _historyIndex = _history.length;
        _input.clear();
      });
      return;
    }
    setState(() {
      _historyIndex++;
      _input.text = _history[_historyIndex];
      _input.selection = TextSelection.collapsed(offset: _input.text.length);
    });
  }

  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        _historyUp();
        return KeyEventResult.handled;
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        _historyDown();
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;
    final compact = width < 760;

    return Container(
      color: AppTheme.bgAlt.withValues(alpha: 0.6),
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 24 : 64,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Reveal(
            child: SectionHeader(
                label: l10n.terminalLabel, title: l10n.terminalTitle),
          ),
          const SizedBox(height: 16),
          Reveal(
            child: Text(l10n.terminalDesc, style: AppTheme.body()),
          ),
          const SizedBox(height: 32),
          Reveal(
            delay: const Duration(milliseconds: 150),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 860),
              decoration: BoxDecoration(
                color: const Color(0xFF0A0F1E),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppTheme.stroke),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primary.withValues(alpha: 0.15),
                    blurRadius: 40,
                    offset: const Offset(0, 20),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Заголовок окна
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: const BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    child: Row(
                      children: [
                        _dot(const Color(0xFFFF5F57)),
                        _dot(const Color(0xFFFEBC2E)),
                        _dot(const Color(0xFF28C840)),
                        const SizedBox(width: 12),
                        Text(
                          'sergey-portfolio — zsh',
                          style: AppTheme.mono(
                              size: 12, color: AppTheme.textMuted),
                        ),
                      ],
                    ),
                  ),
                  // Лог
                  GestureDetector(
                    onTap: () => _focus.requestFocus(),
                    child: Container(
                      height: 320,
                      padding: const EdgeInsets.all(16),
                      child: ListView.builder(
                        controller: _scroll,
                        itemCount: _lines.length,
                        itemBuilder: (context, i) {
                          final line = _lines[i];
                          return SelectableText(
                            line.text.isEmpty ? ' ' : line.text,
                            style: AppTheme.mono(size: 13.5, color: line.color),
                          );
                        },
                      ),
                    ),
                  ),
                  // Ввод
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
                    child: Row(
                      children: [
                        Text('$_prompt \$ ', style: AppTheme.mono(size: 13.5)),
                        Expanded(
                          child: Focus(
                            onKeyEvent: _onKey,
                            child: TextField(
                              controller: _input,
                              focusNode: _focus,
                              style: AppTheme.mono(
                                  size: 13.5, color: AppTheme.textPrimary),
                              cursorColor: AppTheme.accent,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                hintText: 'help',
                                hintStyle: TextStyle(color: AppTheme.textMuted),
                              ),
                              onSubmitted: _run,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot(Color c) => Container(
        width: 12,
        height: 12,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(color: c, shape: BoxShape.circle),
      );
}
