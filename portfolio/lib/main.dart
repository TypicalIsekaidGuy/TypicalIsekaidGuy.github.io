import 'package:flutter/material.dart';

import 'data/portfolio_data.dart';
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

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${PortfolioData.name} — ${PortfolioData.role}',
      debugShowCheckedModeBanner: false,
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
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sectionKeys = <String, GlobalKey>{};

    return Scaffold(
      body: AuroraBackground(
        child: Column(
          children: [
            NavBar(sectionKeys: sectionKeys),
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
