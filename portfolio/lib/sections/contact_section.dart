import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/portfolio_data.dart';
import '../theme.dart';
import '../widgets/reveal.dart';
import '../widgets/section_header.dart';

/// Секция контактов + футер.
class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final compact = width < 760;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 24 : 64,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Reveal(
            child: SectionHeader(label: 'Контакты', title: 'Давайте работать вместе'),
          ),
          const SizedBox(height: 20),
          Reveal(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Text(
                'Предпочитаемый способ связи — Telegram. '
                'Отвечаю быстро, открыт к интересным проектам.',
                style: AppTheme.body(size: 17),
              ),
            ),
          ),
          const SizedBox(height: 36),
          Wrap(
            spacing: 18,
            runSpacing: 18,
            children: const [
              _ContactCard(
                icon: Icons.send_rounded,
                title: 'Telegram',
                value: PortfolioData.telegramHandle,
                url: PortfolioData.telegramUrl,
              ),
              _ContactCard(
                icon: Icons.alternate_email_rounded,
                title: 'Email',
                value: PortfolioData.email,
                url: PortfolioData.emailUrl,
              ),
              _ContactCard(
                icon: Icons.phone_iphone_rounded,
                title: 'Телефон',
                value: PortfolioData.phone,
                url: PortfolioData.phoneUrl,
              ),
              _ContactCard(
                icon: Icons.location_on_rounded,
                title: 'Локация',
                value: '${PortfolioData.location} · гибрид / удалённо',
                url: null,
              ),
            ],
          ),
          const SizedBox(height: 64),
          Reveal(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: AppTheme.stroke)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      '© 2026 ${PortfolioData.name}. Сделано на Flutter 💙',
                      style: AppTheme.mono(size: 12, color: AppTheme.textMuted),
                    ),
                  ),
                  Text(
                    'resume.pdf обновлено 10.08.2026',
                    style: AppTheme.mono(size: 12, color: AppTheme.textMuted),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final String? url;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.url,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final clickable = widget.url != null;
    return MouseRegion(
      cursor: clickable ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: clickable
            ? () => launchUrl(Uri.parse(widget.url!),
                mode: LaunchMode.externalApplication)
            : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
          width: 250,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: _hovered
                  ? AppTheme.accent.withValues(alpha: 0.6)
                  : AppTheme.stroke,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                widget.icon,
                color: _hovered ? AppTheme.accent : AppTheme.primary,
                size: 26,
              ),
              const SizedBox(height: 12),
              Text(widget.title, style: AppTheme.label(size: 11)),
              const SizedBox(height: 6),
              Text(
                widget.value,
                style: AppTheme.body(size: 14)
                    .copyWith(color: AppTheme.textPrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
