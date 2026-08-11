import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../l10n/app_localizations.dart';
import '../theme.dart';
import '../widgets/app_button.dart';
import '../widgets/typewriter.dart';

/// Hero-секция: имя, печатающаяся роль, кнопки связи.
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;
    final compact = width < 760;
    final nameSize = compact ? 36.0 : (width < 1100 ? 48.0 : 64.0);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 24 : 64,
        vertical: compact ? 72 : 120,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: AppTheme.accent.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppTheme.accent.withValues(alpha: 0.35)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppTheme.accent,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  l10n.heroBadge,
                  style: AppTheme.mono(size: 12, color: AppTheme.accent),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Text(l10n.heroGreeting,
              style: AppTheme.subtitle(size: compact ? 17 : 20)),
          const SizedBox(height: 6),
          ShaderMask(
            shaderCallback: (r) => AppTheme.heroGradient.createShader(r),
            child: Text(
              l10n.heroName,
              style: AppTheme.display(context, size: nameSize)
                  .copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: compact ? 34 : 44,
            child: Typewriter(
              key: ValueKey(Localizations.localeOf(context).languageCode),
              texts: [
                l10n.heroTyping1,
                l10n.heroTyping2,
                l10n.heroTyping3,
                l10n.heroTyping4,
              ],
              style: AppTheme.mono(
                size: compact ? 18 : 26,
                color: AppTheme.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: 24),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(
              l10n.heroIntro,
              style: AppTheme.body(size: compact ? 15 : 17),
            ),
          ),
          const SizedBox(height: 36),
          Wrap(
            spacing: 16,
            runSpacing: 14,
            children: [
              AppButton(
                text: l10n.heroBtnTelegram,
                icon: Icons.send_rounded,
                url: PortfolioData.telegramUrl,
              ),
              AppButton(
                text: l10n.heroBtnEmail,
                icon: Icons.alternate_email_rounded,
                url: PortfolioData.emailUrl,
                filled: false,
              ),
              AppButton(
                text: l10n.heroBtnResume,
                icon: Icons.download_rounded,
                url: PortfolioData.resumeAsset,
                filled: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
