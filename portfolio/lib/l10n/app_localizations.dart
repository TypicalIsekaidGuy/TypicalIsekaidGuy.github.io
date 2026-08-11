import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Sergey Zhokhov — Android Developer'**
  String get appTitle;

  /// No description provided for @navAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get navAbout;

  /// No description provided for @navExperience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get navExperience;

  /// No description provided for @navSkills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get navSkills;

  /// No description provided for @navTerminal.
  ///
  /// In en, this message translates to:
  /// **'Terminal'**
  String get navTerminal;

  /// No description provided for @navContacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get navContacts;

  /// No description provided for @heroBadge.
  ///
  /// In en, this message translates to:
  /// **'Open to offers'**
  String get heroBadge;

  /// No description provided for @heroGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hi, I\'m'**
  String get heroGreeting;

  /// No description provided for @heroName.
  ///
  /// In en, this message translates to:
  /// **'Sergey Zhokhov'**
  String get heroName;

  /// No description provided for @heroTyping1.
  ///
  /// In en, this message translates to:
  /// **'Android Developer'**
  String get heroTyping1;

  /// No description provided for @heroTyping2.
  ///
  /// In en, this message translates to:
  /// **'Kotlin & Jetpack Compose'**
  String get heroTyping2;

  /// No description provided for @heroTyping3.
  ///
  /// In en, this message translates to:
  /// **'Clean Architecture'**
  String get heroTyping3;

  /// No description provided for @heroTyping4.
  ///
  /// In en, this message translates to:
  /// **'5 years 6 months of experience'**
  String get heroTyping4;

  /// No description provided for @heroIntro.
  ///
  /// In en, this message translates to:
  /// **'I\'ve been building Android apps for over 5 years: from legacy refactoring to custom animations and billing. Moscow, Russia.'**
  String get heroIntro;

  /// No description provided for @heroBtnTelegram.
  ///
  /// In en, this message translates to:
  /// **'Message on Telegram'**
  String get heroBtnTelegram;

  /// No description provided for @heroBtnEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get heroBtnEmail;

  /// No description provided for @heroBtnResume.
  ///
  /// In en, this message translates to:
  /// **'Download CV'**
  String get heroBtnResume;

  /// No description provided for @aboutLabel.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutLabel;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'Who I am'**
  String get aboutTitle;

  /// No description provided for @aboutText.
  ///
  /// In en, this message translates to:
  /// **'Android developer with 5+ years of experience. I love solving problems with new tools (really want to get to KMP), building UIs with animations, and approaching app architecture carefully — thinking it through completely before writing a single line of code.'**
  String get aboutText;

  /// No description provided for @aboutFact1.
  ///
  /// In en, this message translates to:
  /// **'Russian citizenship, work permit: Russia'**
  String get aboutFact1;

  /// No description provided for @aboutFact2.
  ///
  /// In en, this message translates to:
  /// **'Open to business trips; format: office / remote / hybrid'**
  String get aboutFact2;

  /// No description provided for @aboutFact3.
  ///
  /// In en, this message translates to:
  /// **'English — B2 (upper-intermediate)'**
  String get aboutFact3;

  /// No description provided for @aboutFact4.
  ///
  /// In en, this message translates to:
  /// **'Higher education: DSTU, Applied Computer Science, 2025'**
  String get aboutFact4;

  /// No description provided for @stat1Label.
  ///
  /// In en, this message translates to:
  /// **'years of commercial experience'**
  String get stat1Label;

  /// No description provided for @stat2Label.
  ///
  /// In en, this message translates to:
  /// **'mobile sales growth after Play Billing rollout'**
  String get stat2Label;

  /// No description provided for @stat3Label.
  ///
  /// In en, this message translates to:
  /// **'performance gain on the hottest paths'**
  String get stat3Label;

  /// No description provided for @stat4Label.
  ///
  /// In en, this message translates to:
  /// **'new users during my time there'**
  String get stat4Label;

  /// No description provided for @expLabel.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get expLabel;

  /// No description provided for @expTitle.
  ///
  /// In en, this message translates to:
  /// **'Where I\'ve worked'**
  String get expTitle;

  /// No description provided for @currentBadge.
  ///
  /// In en, this message translates to:
  /// **'current'**
  String get currentBadge;

  /// No description provided for @job1Period.
  ///
  /// In en, this message translates to:
  /// **'May 2025 — Present'**
  String get job1Period;

  /// No description provided for @job1Duration.
  ///
  /// In en, this message translates to:
  /// **'1 year 4 months'**
  String get job1Duration;

  /// No description provided for @job1Role.
  ///
  /// In en, this message translates to:
  /// **'Android Developer'**
  String get job1Role;

  /// No description provided for @job1Point1.
  ///
  /// In en, this message translates to:
  /// **'Development and maintenance of three apps: investments, personal budget, investor community'**
  String get job1Point1;

  /// No description provided for @job1Point2.
  ///
  /// In en, this message translates to:
  /// **'Reworked the app\'s main section with complex custom animations'**
  String get job1Point2;

  /// No description provided for @job1Point3.
  ///
  /// In en, this message translates to:
  /// **'Implemented Google Play Billing (in-app purchases) instead of WebView payments — mobile sales grew by 70%'**
  String get job1Point3;

  /// No description provided for @job1Point4.
  ///
  /// In en, this message translates to:
  /// **'Optimized ~20 of the hottest paths, including chart rendering (Logcat, Android Profiler) — average performance gain of 30%'**
  String get job1Point4;

  /// No description provided for @job1Point5.
  ///
  /// In en, this message translates to:
  /// **'Shipped new screens and fixed bugs promptly — audience grew by ~50K users'**
  String get job1Point5;

  /// No description provided for @job2Period.
  ///
  /// In en, this message translates to:
  /// **'March 2023 — May 2025'**
  String get job2Period;

  /// No description provided for @job2Duration.
  ///
  /// In en, this message translates to:
  /// **'2 years 3 months'**
  String get job2Duration;

  /// No description provided for @job2Role.
  ///
  /// In en, this message translates to:
  /// **'Android Developer'**
  String get job2Role;

  /// No description provided for @job2Point1.
  ///
  /// In en, this message translates to:
  /// **'Development and maintenance of a large social-network app within an Android team: planning tasks and deadlines in Jira, Agile workflow'**
  String get job2Point1;

  /// No description provided for @job2Point2.
  ///
  /// In en, this message translates to:
  /// **'Legacy refactoring (Kotlin, Java, XML): reworked ~30 large UI components with adapters and related classes'**
  String get job2Point2;

  /// No description provided for @job2Point3.
  ///
  /// In en, this message translates to:
  /// **'Implemented offline mode and poor-network resilience: OkHttp caching, session storage via Room'**
  String get job2Point3;

  /// No description provided for @job2Point4.
  ///
  /// In en, this message translates to:
  /// **'Migrated all network calls to Kotlin Coroutines, replacing legacy Java threads'**
  String get job2Point4;

  /// No description provided for @job3Period.
  ///
  /// In en, this message translates to:
  /// **'March 2021 — March 2023'**
  String get job3Period;

  /// No description provided for @job3Duration.
  ///
  /// In en, this message translates to:
  /// **'2 years 1 month'**
  String get job3Duration;

  /// No description provided for @job3Role.
  ///
  /// In en, this message translates to:
  /// **'Android Developer'**
  String get job3Role;

  /// No description provided for @job3Point1.
  ///
  /// In en, this message translates to:
  /// **'Analysis and refactoring of Android codebases (Java, Kotlin, MVVM, Coroutines)'**
  String get job3Point1;

  /// No description provided for @job3Point2.
  ///
  /// In en, this message translates to:
  /// **'Fixed 20+ legacy defects: ViewModel business logic, UI-layer bugs'**
  String get job3Point2;

  /// No description provided for @job3Point3.
  ///
  /// In en, this message translates to:
  /// **'Migrated 5–7 UI modules from XML to Jetpack Compose'**
  String get job3Point3;

  /// No description provided for @job3Point4.
  ///
  /// In en, this message translates to:
  /// **'Built 2 apps from scratch in two UI implementations (XML and Jetpack Compose) — from architecture to the final screen'**
  String get job3Point4;

  /// No description provided for @job3Point5.
  ///
  /// In en, this message translates to:
  /// **'Researched Android\'s built-in encryption tools in a team of 3; implemented a data-encryption demo app'**
  String get job3Point5;

  /// No description provided for @skillsLabel.
  ///
  /// In en, this message translates to:
  /// **'Stack'**
  String get skillsLabel;

  /// No description provided for @skillsTitle.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get skillsTitle;

  /// No description provided for @skillGroup1.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get skillGroup1;

  /// No description provided for @skillGroup2.
  ///
  /// In en, this message translates to:
  /// **'Android'**
  String get skillGroup2;

  /// No description provided for @skillGroup3.
  ///
  /// In en, this message translates to:
  /// **'Architecture'**
  String get skillGroup3;

  /// No description provided for @skillGroup4.
  ///
  /// In en, this message translates to:
  /// **'Data & Network'**
  String get skillGroup4;

  /// No description provided for @skillGroup5.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get skillGroup5;

  /// No description provided for @skillGroup6.
  ///
  /// In en, this message translates to:
  /// **'Growing into'**
  String get skillGroup6;

  /// No description provided for @terminalLabel.
  ///
  /// In en, this message translates to:
  /// **'Fun toy'**
  String get terminalLabel;

  /// No description provided for @terminalTitle.
  ///
  /// In en, this message translates to:
  /// **'Talk to my terminal'**
  String get terminalTitle;

  /// No description provided for @terminalDesc.
  ///
  /// In en, this message translates to:
  /// **'A little interactive: type help and chat with the console — it will tell you everything about me, in a format a developer understands.'**
  String get terminalDesc;

  /// No description provided for @termWelcome1.
  ///
  /// In en, this message translates to:
  /// **'Welcome to portfolio-terminal v1.0.0'**
  String get termWelcome1;

  /// No description provided for @termWelcome2.
  ///
  /// In en, this message translates to:
  /// **'This is an interactive console. Type \"help\" to list the commands.'**
  String get termWelcome2;

  /// No description provided for @termHelpHeader.
  ///
  /// In en, this message translates to:
  /// **'Available commands:'**
  String get termHelpHeader;

  /// No description provided for @termHelpAbout.
  ///
  /// In en, this message translates to:
  /// **'  about        — who is Sergey'**
  String get termHelpAbout;

  /// No description provided for @termHelpSkills.
  ///
  /// In en, this message translates to:
  /// **'  skills       — tech stack'**
  String get termHelpSkills;

  /// No description provided for @termHelpExperience.
  ///
  /// In en, this message translates to:
  /// **'  experience   — work history'**
  String get termHelpExperience;

  /// No description provided for @termHelpContacts.
  ///
  /// In en, this message translates to:
  /// **'  contacts     — how to reach me'**
  String get termHelpContacts;

  /// No description provided for @termHelpResume.
  ///
  /// In en, this message translates to:
  /// **'  resume       — download CV (PDF)'**
  String get termHelpResume;

  /// No description provided for @termHelpTelegram.
  ///
  /// In en, this message translates to:
  /// **'  telegram     — open Telegram'**
  String get termHelpTelegram;

  /// No description provided for @termHelpWhoami.
  ///
  /// In en, this message translates to:
  /// **'  whoami       — and who are you?'**
  String get termHelpWhoami;

  /// No description provided for @termHelpClear.
  ///
  /// In en, this message translates to:
  /// **'  clear        — clear the terminal'**
  String get termHelpClear;

  /// No description provided for @termLocationLine.
  ///
  /// In en, this message translates to:
  /// **'Location: {location} · Experience: {experience}'**
  String termLocationLine(String location, String experience);

  /// No description provided for @termExperienceYears.
  ///
  /// In en, this message translates to:
  /// **'5+ years'**
  String get termExperienceYears;

  /// No description provided for @termOpeningResume.
  ///
  /// In en, this message translates to:
  /// **'Opening CV...'**
  String get termOpeningResume;

  /// No description provided for @termOpeningTelegram.
  ///
  /// In en, this message translates to:
  /// **'Opening Telegram...'**
  String get termOpeningTelegram;

  /// No description provided for @termWhoami1.
  ///
  /// In en, this message translates to:
  /// **'Recruiter? Tech lead? Either way — welcome :)'**
  String get termWhoami1;

  /// No description provided for @termWhoami2.
  ///
  /// In en, this message translates to:
  /// **'Try the \"contacts\" command to get in touch with Sergey.'**
  String get termWhoami2;

  /// No description provided for @termSudo.
  ///
  /// In en, this message translates to:
  /// **'Sergey is already root in his own code.'**
  String get termSudo;

  /// No description provided for @termNotFound.
  ///
  /// In en, this message translates to:
  /// **'Command not found: {cmd}. Type \"help\" for the list of commands.'**
  String termNotFound(String cmd);

  /// No description provided for @termContactsTelegram.
  ///
  /// In en, this message translates to:
  /// **'Telegram : {handle}'**
  String termContactsTelegram(String handle);

  /// No description provided for @termContactsEmail.
  ///
  /// In en, this message translates to:
  /// **'Email    : {email}'**
  String termContactsEmail(String email);

  /// No description provided for @termContactsPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone    : {phone}'**
  String termContactsPhone(String phone);

  /// No description provided for @contactsLabel.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contactsLabel;

  /// No description provided for @contactsTitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s work together'**
  String get contactsTitle;

  /// No description provided for @contactsDesc.
  ///
  /// In en, this message translates to:
  /// **'Telegram is the preferred way to reach me. I reply fast and I\'m open to interesting projects.'**
  String get contactsDesc;

  /// No description provided for @contactTelegramTitle.
  ///
  /// In en, this message translates to:
  /// **'Telegram'**
  String get contactTelegramTitle;

  /// No description provided for @contactEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get contactEmailTitle;

  /// No description provided for @contactPhoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get contactPhoneTitle;

  /// No description provided for @contactLocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get contactLocationTitle;

  /// No description provided for @contactLocationValue.
  ///
  /// In en, this message translates to:
  /// **'Moscow, Russia · hybrid / remote'**
  String get contactLocationValue;

  /// No description provided for @footerMadeWith.
  ///
  /// In en, this message translates to:
  /// **'© 2026 Sergey Zhokhov. Made with Flutter 💙'**
  String get footerMadeWith;

  /// No description provided for @footerResumeUpdated.
  ///
  /// In en, this message translates to:
  /// **'resume.pdf updated Aug 10, 2026'**
  String get footerResumeUpdated;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
