import 'package:flutter/material.dart';

import 'l10n/app_localizations.dart';
import 'sections/about_section.dart';
import 'sections/contact_section.dart';
import 'sections/experience_section.dart';
import 'sections/hero_section.dart';
import 'sections/nav_bar.dart';
import 'sections/skills_section.dart';
import 'sections/terminal_section.dart';
import 'theme.dart';
import 'widgets/aurora_background.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  /// Основной язык сайта — английский. Переключается в NavBar.
  Locale _locale = const Locale('en');

  void _setLocale(Locale locale) => setState(() => _locale = locale);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppTheme.bg,
        colorScheme: const ColorScheme.dark(
          primary: AppTheme.primary,
          secondary: AppTheme.accent,
          surface: AppTheme.surface,
        ),
        useMaterial3: true,
      ),
      home: LandingPage(locale: _locale, onLocaleChanged: _setLocale),
    );
  }
}

class LandingPage extends StatelessWidget {
  final Locale locale;
  final ValueChanged<Locale> onLocaleChanged;

  const LandingPage({
    super.key,
    required this.locale,
    required this.onLocaleChanged,
  });

  @override
  Widget build(BuildContext context) {
    final sectionKeys = <String, GlobalKey>{};

    return Scaffold(
      body: AuroraBackground(
        child: Column(
          children: [
            NavBar(
              sectionKeys: sectionKeys,
              locale: locale,
              onLocaleChanged: onLocaleChanged,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const HeroSection(),
                    SectionAnchor(
                      sectionId: 'about',
                      sectionKeys: sectionKeys,
                      child: const AboutSection(),
                    ),
                    SectionAnchor(
                      sectionId: 'experience',
                      sectionKeys: sectionKeys,
                      child: const ExperienceSection(),
                    ),
                    SectionAnchor(
                      sectionId: 'skills',
                      sectionKeys: sectionKeys,
                      child: const SkillsSection(),
                    ),
                    SectionAnchor(
                      sectionId: 'terminal',
                      sectionKeys: sectionKeys,
                      child: const TerminalSection(),
                    ),
                    SectionAnchor(
                      sectionId: 'contacts',
                      sectionKeys: sectionKeys,
                      child: const ContactSection(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
