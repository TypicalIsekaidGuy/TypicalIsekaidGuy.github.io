import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../l10n/app_localizations.dart';
import '../theme.dart';
import '../widgets/reveal.dart';
import '../widgets/section_header.dart';

/// Секция опыта работы — вертикальный таймлайн с карточками.
class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  List<ExperienceItem> _jobs(AppLocalizations l10n) => [
        ExperienceItem(
          period: l10n.job1Period,
          duration: l10n.job1Duration,
          company: PortfolioData.companies[0],
          role: l10n.job1Role,
          isCurrent: true,
          points: [
            l10n.job1Point1,
            l10n.job1Point2,
            l10n.job1Point3,
            l10n.job1Point4,
            l10n.job1Point5,
          ],
        ),
        ExperienceItem(
          period: l10n.job2Period,
          duration: l10n.job2Duration,
          company: PortfolioData.companies[1],
          role: l10n.job2Role,
          isCurrent: false,
          points: [
            l10n.job2Point1,
            l10n.job2Point2,
            l10n.job2Point3,
            l10n.job2Point4,
          ],
        ),
        ExperienceItem(
          period: l10n.job3Period,
          duration: l10n.job3Duration,
          company: PortfolioData.companies[2],
          role: l10n.job3Role,
          isCurrent: false,
          points: [
            l10n.job3Point1,
            l10n.job3Point2,
            l10n.job3Point3,
            l10n.job3Point4,
            l10n.job3Point5,
          ],
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;
    final compact = width < 760;
    final jobs = _jobs(l10n);

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
            child: SectionHeader(label: l10n.expLabel, title: l10n.expTitle),
          ),
          const SizedBox(height: 48),
          ...List.generate(jobs.length, (i) {
            return Reveal(
              delay: Duration(milliseconds: 120 * i),
              child: _TimelineEntry(
                item: jobs[i],
                isLast: i == jobs.length - 1,
                compact: compact,
                currentBadge: l10n.currentBadge,
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _TimelineEntry extends StatefulWidget {
  final ExperienceItem item;
  final bool isLast;
  final bool compact;
  final String currentBadge;

  const _TimelineEntry({
    required this.item,
    required this.isLast,
    required this.compact,
    required this.currentBadge,
  });

  @override
  State<_TimelineEntry> createState() => _TimelineEntryState();
}

class _TimelineEntryState extends State<_TimelineEntry> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Линия таймлайна
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: item.isCurrent ? AppTheme.accent : AppTheme.surface,
                  border: Border.all(
                    color: item.isCurrent ? AppTheme.accent : AppTheme.primary,
                    width: 3,
                  ),
                  boxShadow: item.isCurrent
                      ? [
                          BoxShadow(
                            color: AppTheme.accent.withValues(alpha: 0.5),
                            blurRadius: 12,
                            spreadRadius: 2,
                          ),
                        ]
                      : null,
                ),
              ),
              if (!widget.isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppTheme.primary.withValues(alpha: 0.5),
                          AppTheme.stroke,
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 24),
          // Карточка
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: widget.isLast ? 0 : 40),
              child: MouseRegion(
                onEnter: (_) => setState(() => _hovered = true),
                onExit: (_) => setState(() => _hovered = false),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
                  padding: EdgeInsets.all(widget.compact ? 20 : 28),
                  decoration: BoxDecoration(
                    color: AppTheme.surface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _hovered
                          ? AppTheme.primary.withValues(alpha: 0.55)
                          : AppTheme.stroke,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 12,
                        runSpacing: 8,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(item.company, style: AppTheme.heading(size: 22)),
                          if (item.isCurrent)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppTheme.accent.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: AppTheme.accent.withValues(alpha: 0.4),
                                ),
                              ),
                              child: Text(
                                widget.currentBadge,
                                style: AppTheme.mono(
                                    size: 11, color: AppTheme.accent),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Wrap(
                        spacing: 14,
                        runSpacing: 4,
                        children: [
                          Text(
                            item.role,
                            style: AppTheme.body(size: 15)
                                .copyWith(color: AppTheme.accentBlue),
                          ),
                          Text(
                            '${item.period} · ${item.duration}',
                            style: AppTheme.mono(
                                size: 13, color: AppTheme.textMuted),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ...item.points.map(
                        (p) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Container(
                                  width: 6,
                                  height: 6,
                                  decoration: const BoxDecoration(
                                    color: AppTheme.primary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(p, style: AppTheme.body(size: 15)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
