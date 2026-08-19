/// Языко-нейтральные данные: контакты, ссылки, числовые значения,
/// названия компаний и списки технологий.
/// Все переводимые строки лежат в lib/l10n/*.arb.
library;

class PortfolioData {
  PortfolioData._();

  static const String email = 'zawaruto1@mail.ru';
  static const String phone = '+7 (939) 791-10-67';
  static const String telegramHandle = '@Sergiojohopini';
  static const String telegramUrl = 'https://t.me/Sergiojohopini';
  static const String emailUrl = 'mailto:zawaruto1@mail.ru';
  static const String phoneUrl = 'tel:+79397911067';
  static const String resumeAsset = 'resume.pdf';
  static const String locationShort = 'Moscow, Russia';

  // ---------------------------------------------------------------- stats ---

  static const List<StatItem> stats = [
    StatItem(value: 5.5, suffix: '+', decimals: 1),
    StatItem(value: 70, prefix: '+', suffix: '%'),
    StatItem(value: 30, prefix: '+', suffix: '%'),
    StatItem(value: 50, prefix: '~', suffix: 'K'),
  ];

  // ----------------------------------------------------------- experience ---

  /// Названия компаний (не переводятся). Порядок — от текущего места работы.
  static const List<String> companies = [
    'Profinance Capital Group',
    'Gora Studio',
    'ArwinApp',
  ];

  // --------------------------------------------------------------- skills ---

  /// Списки технологий по группам (названия технологий не переводятся).
  /// Порядок соответствует ключам skillGroup1..6 в ARB.
  static const List<List<String>> skillNames = [
    ['Kotlin', 'Java'],
    [
      'Android SDK', 'Jetpack Compose', 'Coroutines', 'Room', 'Retrofit',
      'OkHttp', 'Dagger 2', 'RxJava', 'Firebase', 'Google Play Billing',
    ],
    [
      'Clean Architecture', 'MVVM', 'MVP', 'MVC', 'SOLID',
      'Design Patterns', 'Unit Testing',
    ],
    ['REST API', 'Backend', 'Realm', 'MongoDB', 'MySQL'],
    ['Gradle', 'Git / GitHub', 'Android Studio', 'Jira', 'Agile'],
    ['Kotlin Multiplatform', 'Compose Multiplatform'],
  ];

  // ------------------------------------------------------ company links ---

  /// Компании, где работал Сергей. url == null — публичный сайт не найден.
  static const List<CompanyLink> companyLinks = [
    CompanyLink('PRO.FINANSY', 'https://profinansy.ru'),
    CompanyLink('GORA Studio', 'https://gora.studio'),
    CompanyLink('ArwinApp', null),
    CompanyLink('Zrenie 2.0', 'https://www.zrenie20.com'),
  ];
}

class CompanyLink {
  final String name;
  final String? url;
  const CompanyLink(this.name, this.url);
}

class StatItem {
  final double value;
  final String prefix;
  final String suffix;
  final int decimals;

  const StatItem({
    required this.value,
    this.prefix = '',
    this.suffix = '',
    this.decimals = 0,
  });
}

/// Модель карточки опыта. Собирается из ARB-строк в ExperienceSection.
class ExperienceItem {
  final String period;
  final String duration;
  final String company;
  final String role;
  final bool isCurrent;
  final List<String> points;

  const ExperienceItem({
    required this.period,
    required this.duration,
    required this.company,
    required this.role,
    required this.isCurrent,
    required this.points,
  });
}

class SkillGroup {
  final String title;
  final List<String> skills;
  const SkillGroup(this.title, this.skills);
}
