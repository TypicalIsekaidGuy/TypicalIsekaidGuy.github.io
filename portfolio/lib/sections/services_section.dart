import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/portfolio_data.dart';
import '../l10n/app_localizations.dart';
import '../theme.dart';
import '../widgets/reveal.dart';
import '../widgets/section_header.dart';

/// Секция «Услуги»: три блока — B2B напрямую, фриланс/менторство, найм.
class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;
    final compact = width < 860;

    final cards = [
      _ServiceCardData(
        icon: Icons.business_center_rounded,
        tag: l10n.service1Tag,
        title: l10n.service1Title,
        text: l10n.service1Text,
        points: [l10n.service1Point1, l10n.service1Point2, l10n.service1Point3],
        cta: l10n.service1Cta,
        url: PortfolioData.telegramUrl,
      ),
      _ServiceCardData(
        icon: Icons.school_rounded,
        tag: l10n.service2Tag,
        title: l10n.service2Title,
        text: l10n.service2Text,
        points: [l10n.service2Point1, l10n.service2Point2, l10n.service2Point3],
        cta: l10n.service2Cta,
        url: PortfolioData.telegramUrl,
      ),
      _ServiceCardData(
        icon: Icons.handshake_rounded,
        tag: l10n.service3Tag,
        title: l10n.service3Title,
        text: l10n.service3Text,
        points: [l10n.service3Point1, l10n.service3Point2, l10n.service3Point3],
        cta: l10n.service3Cta,
        url: PortfolioData.resumeAsset,
        showCompanies: true,
      ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 24 : 64,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Reveal(
            child: SectionHeader(
                label: l10n.servicesLabel, title: l10n.servicesTitle),
          ),
          const SizedBox(height: 16),
          Reveal(child: Text(l10n.servicesIntro, style: AppTheme.body())),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              for (int i = 0; i < cards.length; i++)
                Reveal(
                  delay: Duration(milliseconds: 120 * i),
                  child: SizedBox(
                    width: compact ? double.infinity : 380,
                    child: _ServiceCard(data: cards[i]),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ServiceCardData {
  final IconData icon;
  final String tag;
  final String title;
  final String text;
  final List<String> points;
  final String cta;
  final String url;
  final bool showCompanies;

  const _ServiceCardData({
    required this.icon,
    required this.tag,
    required this.title,
    required this.text,
    required this.points,
    required this.cta,
    required this.url,
    this.showCompanies = false,
  });
}

class _ServiceCard extends StatefulWidget {
  final _ServiceCardData data;
  const _ServiceCard({required this.data});

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final d = widget.data;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _hovered ? -6 : 0, 0),
        padding: const EdgeInsets.all(26),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hovered
                ? AppTheme.accent.withValues(alpha: 0.55)
                : AppTheme.stroke,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppTheme.accent.withValues(alpha: 0.12),
                    blurRadius: 30,
                    offset: const Offset(0, 14),
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: AppTheme.heroGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(d.icon, color: Colors.white, size: 22),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(d.tag.toUpperCase(), style: AppTheme.label(size: 11)),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Text(d.title, style: AppTheme.heading(size: 20)),
            const SizedBox(height: 10),
            Text(d.text, style: AppTheme.body(size: 14.5)),
            if (d.showCompanies) ...[
              const SizedBox(height: 14),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final c in PortfolioData.companyLinks)
                    _CompanyChip(company: c),
                ],
              ),
            ],
            const SizedBox(height: 16),
            ...d.points.map(
              (p) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Icon(Icons.check_rounded,
                          color: AppTheme.accent, size: 17),
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(p, style: AppTheme.body(size: 14))),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            _CtaLink(text: d.cta, url: d.url),
          ],
        ),
      ),
    );
  }
}

class _CompanyChip extends StatefulWidget {
  final CompanyLink company;
  const _CompanyChip({required this.company});

  @override
  State<_CompanyChip> createState() => _CompanyChipState();
}

class _CompanyChipState extends State<_CompanyChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final c = widget.company;
    final clickable = c.url != null;
    return MouseRegion(
      cursor: clickable ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: clickable
            ? () => launchUrl(Uri.parse(c.url!),
                mode: LaunchMode.externalApplication)
            : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          decoration: BoxDecoration(
            color: AppTheme.surfaceLight,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _hovered && clickable ? AppTheme.accentBlue : AppTheme.stroke,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                c.name,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: clickable
                      ? AppTheme.accentBlue
                      : AppTheme.textSecondary,
                ),
              ),
              if (clickable) ...[
                const SizedBox(width: 5),
                const Icon(Icons.open_in_new_rounded,
                    size: 13, color: AppTheme.accentBlue),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _CtaLink extends StatefulWidget {
  final String text;
  final String url;
  const _CtaLink({required this.text, required this.url});

  @override
  State<_CtaLink> createState() => _CtaLinkState();
}

class _CtaLinkState extends State<_CtaLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(widget.url),
            mode: LaunchMode.externalApplication),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: _hovered ? AppTheme.accent : AppTheme.primary,
              ),
            ),
            const SizedBox(width: 6),
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              transform: Matrix4.translationValues(_hovered ? 4 : 0, 0, 0),
              child: Icon(
                Icons.arrow_forward_rounded,
                size: 18,
                color: _hovered ? AppTheme.accent : AppTheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
