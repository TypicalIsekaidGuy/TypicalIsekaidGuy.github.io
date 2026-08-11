import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme.dart';
import '../widgets/reveal.dart';
import '../widgets/section_header.dart';

/// Секция навыков — сгруппированные чипы.
class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
          const Reveal(child: SectionHeader(label: 'Стек', title: 'Навыки')),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              for (int i = 0; i < PortfolioData.skillGroups.length; i++)
                Reveal(
                  delay: Duration(milliseconds: 90 * i),
                  child: SizedBox(
                    width: compact ? double.infinity : 360,
                    child: _SkillGroupCard(group: PortfolioData.skillGroups[i]),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SkillGroupCard extends StatelessWidget {
  final SkillGroup group;
  const _SkillGroupCard({required this.group});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.stroke),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            group.title.toUpperCase(),
            style: AppTheme.label(size: 12),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [for (final s in group.skills) _Chip(text: s)],
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatefulWidget {
  final String text;
  const _Chip({required this.text});

  @override
  State<_Chip> createState() => _ChipState();
}

class _ChipState extends State<_Chip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        transform: Matrix4.translationValues(0, _hovered ? -2 : 0, 0),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: _hovered
              ? AppTheme.primary.withValues(alpha: 0.18)
              : AppTheme.surfaceLight,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: _hovered ? AppTheme.primary : AppTheme.stroke,
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w600,
            color: _hovered ? AppTheme.textPrimary : AppTheme.textSecondary,
          ),
        ),
      ),
    );
  }
}
