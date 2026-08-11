import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../l10n/app_localizations.dart';
import '../theme.dart';
import '../widgets/reveal.dart';
import '../widgets/section_header.dart';

/// Секция «Обо мне» + анимированные счётчики достижений.
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;
    final compact = width < 860;

    final facts = [
      l10n.aboutFact1,
      l10n.aboutFact2,
      l10n.aboutFact3,
      l10n.aboutFact4,
    ];
    final statLabels = [
      l10n.stat1Label,
      l10n.stat2Label,
      l10n.stat3Label,
      l10n.stat4Label,
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
            child: SectionHeader(label: l10n.aboutLabel, title: l10n.aboutTitle),
          ),
          const SizedBox(height: 40),
          Flex(
            direction: compact ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Reveal(
                  delay: const Duration(milliseconds: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.aboutText, style: AppTheme.body(size: 17)),
                      const SizedBox(height: 24),
                      ...facts.map(
                        (f) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.check_circle_rounded,
                                  color: AppTheme.accent, size: 20),
                              const SizedBox(width: 10),
                              Expanded(child: Text(f, style: AppTheme.body())),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: compact ? 0 : 48, height: compact ? 36 : 0),
              Expanded(
                flex: 2,
                child: Reveal(
                  delay: const Duration(milliseconds: 200),
                  child: _StatsGrid(compact: compact, labels: statLabels),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatsGrid extends StatelessWidget {
  final bool compact;
  final List<String> labels;
  const _StatsGrid({required this.compact, required this.labels});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: compact ? 1.35 : 1.1,
      children: [
        for (int i = 0; i < PortfolioData.stats.length; i++)
          _StatCard(item: PortfolioData.stats[i], label: labels[i]),
      ],
    );
  }
}

class _StatCard extends StatefulWidget {
  final StatItem item;
  final String label;
  const _StatCard({required this.item, required this.label});

  @override
  State<_StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<_StatCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _hovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) _controller.forward();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _hovered
                ? AppTheme.primary.withValues(alpha: 0.6)
                : AppTheme.stroke,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                final v = item.value *
                    Curves.easeOutCubic.transform(_controller.value);
                final text = item.decimals > 0
                    ? v.toStringAsFixed(item.decimals)
                    : v.round().toString();
                return ShaderMask(
                  shaderCallback: (r) => AppTheme.heroGradient.createShader(r),
                  child: Text(
                    '${item.prefix}$text${item.suffix}',
                    style: AppTheme.heading(size: 30)
                        .copyWith(color: Colors.white),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            Text(
              widget.label,
              style: AppTheme.body(size: 13).copyWith(height: 1.4),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
