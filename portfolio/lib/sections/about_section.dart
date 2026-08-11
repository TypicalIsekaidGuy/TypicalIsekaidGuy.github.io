import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme.dart';
import '../widgets/reveal.dart';
import '../widgets/section_header.dart';

/// Секция «Обо мне» + анимированные счётчики достижений.
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final compact = width < 860;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 24 : 64,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Reveal(child: SectionHeader(label: 'Обо мне', title: 'Кто я')),
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
                      Text(PortfolioData.about, style: AppTheme.body(size: 17)),
                      const SizedBox(height: 24),
                      ...PortfolioData.aboutFacts.map(
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
                  child: _StatsGrid(compact: compact),
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
  const _StatsGrid({required this.compact});

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
        for (final s in PortfolioData.stats) _StatCard(item: s),
      ],
    );
  }
}

class _StatCard extends StatefulWidget {
  final StatItem item;
  const _StatCard({required this.item});

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
              item.label,
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
