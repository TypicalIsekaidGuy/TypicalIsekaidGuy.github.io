// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Sergey Zhokhov — Android Developer';

  @override
  String get navAbout => 'About';

  @override
  String get navExperience => 'Experience';

  @override
  String get navSkills => 'Skills';

  @override
  String get navTerminal => 'Terminal';

  @override
  String get navContacts => 'Contacts';

  @override
  String get heroBadge => 'Open to offers';

  @override
  String get heroGreeting => 'Hi, I\'m';

  @override
  String get heroName => 'Sergey Zhokhov';

  @override
  String get heroTyping1 => 'Android Developer';

  @override
  String get heroTyping2 => 'Kotlin & Jetpack Compose';

  @override
  String get heroTyping3 => 'Clean Architecture';

  @override
  String get heroTyping4 => '5 years 6 months of experience';

  @override
  String get heroIntro =>
      'I\'ve been building Android apps for over 5 years: from legacy refactoring to custom animations and billing. Moscow, Russia.';

  @override
  String get heroBtnTelegram => 'Message on Telegram';

  @override
  String get heroBtnEmail => 'Email';

  @override
  String get heroBtnResume => 'Download CV';

  @override
  String get aboutLabel => 'About';

  @override
  String get aboutTitle => 'Who I am';

  @override
  String get aboutText =>
      'Android developer with 5+ years of experience. I love solving problems with new tools (really want to get to KMP), building UIs with animations, and approaching app architecture carefully — thinking it through completely before writing a single line of code.';

  @override
  String get aboutFact1 => 'Russian citizenship, work permit: Russia';

  @override
  String get aboutFact2 =>
      'Open to business trips; format: office / remote / hybrid';

  @override
  String get aboutFact3 => 'English — B2 (upper-intermediate)';

  @override
  String get aboutFact4 =>
      'Higher education: DSTU, Applied Computer Science, 2025';

  @override
  String get stat1Label => 'years of commercial experience';

  @override
  String get stat2Label => 'mobile sales growth after Play Billing rollout';

  @override
  String get stat3Label => 'performance gain on the hottest paths';

  @override
  String get stat4Label => 'new users during my time there';

  @override
  String get expLabel => 'Experience';

  @override
  String get expTitle => 'Where I\'ve worked';

  @override
  String get currentBadge => 'current';

  @override
  String get job1Period => 'May 2025 — Present';

  @override
  String get job1Duration => '1 year 4 months';

  @override
  String get job1Role => 'Android Developer';

  @override
  String get job1Point1 =>
      'Development and maintenance of three apps: investments, personal budget, investor community';

  @override
  String get job1Point2 =>
      'Reworked the app\'s main section with complex custom animations';

  @override
  String get job1Point3 =>
      'Implemented Google Play Billing (in-app purchases) instead of WebView payments — mobile sales grew by 70%';

  @override
  String get job1Point4 =>
      'Optimized ~20 of the hottest paths, including chart rendering (Logcat, Android Profiler) — average performance gain of 30%';

  @override
  String get job1Point5 =>
      'Shipped new screens and fixed bugs promptly — audience grew by ~50K users';

  @override
  String get job2Period => 'March 2023 — May 2025';

  @override
  String get job2Duration => '2 years 3 months';

  @override
  String get job2Role => 'Android Developer';

  @override
  String get job2Point1 =>
      'Development and maintenance of a large social-network app within an Android team: planning tasks and deadlines in Jira, Agile workflow';

  @override
  String get job2Point2 =>
      'Legacy refactoring (Kotlin, Java, XML): reworked ~30 large UI components with adapters and related classes';

  @override
  String get job2Point3 =>
      'Implemented offline mode and poor-network resilience: OkHttp caching, session storage via Room';

  @override
  String get job2Point4 =>
      'Migrated all network calls to Kotlin Coroutines, replacing legacy Java threads';

  @override
  String get job3Period => 'March 2021 — March 2023';

  @override
  String get job3Duration => '2 years 1 month';

  @override
  String get job3Role => 'Android Developer';

  @override
  String get job3Point1 =>
      'Analysis and refactoring of Android codebases (Java, Kotlin, MVVM, Coroutines)';

  @override
  String get job3Point2 =>
      'Fixed 20+ legacy defects: ViewModel business logic, UI-layer bugs';

  @override
  String get job3Point3 =>
      'Migrated 5–7 UI modules from XML to Jetpack Compose';

  @override
  String get job3Point4 =>
      'Built 2 apps from scratch in two UI implementations (XML and Jetpack Compose) — from architecture to the final screen';

  @override
  String get job3Point5 =>
      'Researched Android\'s built-in encryption tools in a team of 3; implemented a data-encryption demo app';

  @override
  String get skillsLabel => 'Stack';

  @override
  String get skillsTitle => 'Skills';

  @override
  String get skillGroup1 => 'Languages';

  @override
  String get skillGroup2 => 'Android';

  @override
  String get skillGroup3 => 'Architecture';

  @override
  String get skillGroup4 => 'Data & Network';

  @override
  String get skillGroup5 => 'Tools';

  @override
  String get skillGroup6 => 'Growing into';

  @override
  String get terminalLabel => 'Fun toy';

  @override
  String get terminalTitle => 'Talk to my terminal';

  @override
  String get terminalDesc =>
      'A little interactive: type help and chat with the console — it will tell you everything about me, in a format a developer understands.';

  @override
  String get termWelcome1 => 'Welcome to portfolio-terminal v1.0.0';

  @override
  String get termWelcome2 =>
      'This is an interactive console. Type \"help\" to list the commands.';

  @override
  String get termHelpHeader => 'Available commands:';

  @override
  String get termHelpAbout => '  about        — who is Sergey';

  @override
  String get termHelpSkills => '  skills       — tech stack';

  @override
  String get termHelpExperience => '  experience   — work history';

  @override
  String get termHelpContacts => '  contacts     — how to reach me';

  @override
  String get termHelpResume => '  resume       — download CV (PDF)';

  @override
  String get termHelpTelegram => '  telegram     — open Telegram';

  @override
  String get termHelpWhoami => '  whoami       — and who are you?';

  @override
  String get termHelpClear => '  clear        — clear the terminal';

  @override
  String termLocationLine(String location, String experience) {
    return 'Location: $location · Experience: $experience';
  }

  @override
  String get termExperienceYears => '5+ years';

  @override
  String get termOpeningResume => 'Opening CV...';

  @override
  String get termOpeningTelegram => 'Opening Telegram...';

  @override
  String get termWhoami1 => 'Recruiter? Tech lead? Either way — welcome :)';

  @override
  String get termWhoami2 =>
      'Try the \"contacts\" command to get in touch with Sergey.';

  @override
  String get termSudo => 'Sergey is already root in his own code.';

  @override
  String termNotFound(String cmd) {
    return 'Command not found: $cmd. Type \"help\" for the list of commands.';
  }

  @override
  String termContactsTelegram(String handle) {
    return 'Telegram : $handle';
  }

  @override
  String termContactsEmail(String email) {
    return 'Email    : $email';
  }

  @override
  String termContactsPhone(String phone) {
    return 'Phone    : $phone';
  }

  @override
  String get contactsLabel => 'Contacts';

  @override
  String get contactsTitle => 'Let\'s work together';

  @override
  String get contactsDesc =>
      'Telegram is the preferred way to reach me. I reply fast and I\'m open to interesting projects.';

  @override
  String get contactTelegramTitle => 'Telegram';

  @override
  String get contactEmailTitle => 'Email';

  @override
  String get contactPhoneTitle => 'Phone';

  @override
  String get contactLocationTitle => 'Location';

  @override
  String get contactLocationValue => 'Moscow, Russia · hybrid / remote';

  @override
  String get footerMadeWith => '© 2026 Sergey Zhokhov. Made with Flutter 💙';

  @override
  String get footerResumeUpdated => 'resume.pdf updated Aug 10, 2026';
}
