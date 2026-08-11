/// Все данные лендинга — заполнены из резюме (hh.ru, обновлено 10.08.2026).
library;

class PortfolioData {
  PortfolioData._();

  static const String name = 'Сергей Жохов';
  static const String firstName = 'Сергей';
  static const String role = 'Android Developer';
  static const String location = 'Москва, Россия';
  static const String experience = '5+ лет опыта';

  static const String email = 'zawaruto1@mail.ru';
  static const String phone = '+7 (939) 791-10-67';
  static const String telegramHandle = '@Sergiojohopini';
  static const String telegramUrl = 'https://t.me/Sergiojohopini';
  static const String emailUrl = 'mailto:zawaruto1@mail.ru';
  static const String phoneUrl = 'tel:+79397911067';
  static const String resumeAsset = 'resume.pdf';

  static const List<String> typingRoles = [
    'Android Developer',
    'Kotlin & Jetpack Compose',
    'Clean Architecture',
    '5 лет 6 месяцев опыта',
  ];

  static const String about =
      'Android-разработчик со стажем более 5 лет. Люблю решать задачи новыми '
      'инструментами (очень хочу добраться до KMP), верстать дизайн с '
      'анимациями и тщательно подходить к архитектуре приложения — продумывая '
      'её полностью ещё до начала разработки.';

  static const List<String> aboutFacts = [
    'Гражданство РФ, разрешение на работу: Россия',
    'Готов к командировкам, формат: офис / удалённо / гибрид',
    'Английский — B2 (средне-продвинутый)',
    'Высшее образование: ДГТУ, Прикладная информатика, 2025',
  ];

  // ---------------------------------------------------------------- stats ---

  static const List<StatItem> stats = [
    StatItem(value: 5.5, suffix: '+', label: 'лет коммерческого опыта', decimals: 1),
    StatItem(value: 70, suffix: '%', label: 'рост мобильных продаж после внедрения Play Billing', prefix: '+'),
    StatItem(value: 30, suffix: '%', label: 'прирост производительности на горячих участках', prefix: '+'),
    StatItem(value: 50, suffix: 'К', label: 'новых пользователей за время работы', prefix: '~'),
  ];

  // ----------------------------------------------------------- experience ---

  static const List<ExperienceItem> jobs = [
    ExperienceItem(
      period: 'Май 2025 — н.в.',
      duration: '1 год 4 месяца',
      company: 'ГК «Профинансы Капитал»',
      role: 'Android-разработчик',
      isCurrent: true,
      points: [
        'Разработка и поддержка трёх приложений: инвестиции, личный бюджет, сообщество инвесторов',
        'Переработал основной раздел приложения со сложными кастомными анимациями',
        'Внедрил Google Play Billing (in-app purchases) вместо оплаты через WebView — рост продаж с мобильных устройств на 70%',
        'Оптимизировал ~20 самых нагруженных участков, включая отрисовку графиков (Logcat, Android Profiler) — прирост производительности в среднем на 30%',
        'Выпускал новые экраны и оперативно устранял баги — аудитория выросла на ~50 тыс. пользователей',
      ],
    ),
    ExperienceItem(
      period: 'Март 2023 — Май 2025',
      duration: '2 года 3 месяца',
      company: 'Gora Studio',
      role: 'Android-разработчик',
      isCurrent: false,
      points: [
        'Разработка и поддержка крупного приложения-соцсети в команде Android-разработчиков: планирование задач и сроков в Jira, работа по Agile',
        'Рефакторинг legacy-кода (Kotlin, Java, XML): переработано ~30 крупных UI-компонентов вместе с адаптерами и связанными классами',
        'Реализовал офлайн-режим и устойчивость к плохой сети: кеширование OkHttp, локальное хранение сессии через Room',
        'Перевёл все сетевые вызовы на Kotlin Coroutines, заменив устаревшие Java-потоки',
      ],
    ),
    ExperienceItem(
      period: 'Март 2021 — Март 2023',
      duration: '2 года 1 месяц',
      company: 'ArwinApp',
      role: 'Android-разработчик',
      isCurrent: false,
      points: [
        'Анализ и рефакторинг кодовой базы Android-приложений (Java, Kotlin, MVVM, Coroutines)',
        'Устранил 20+ дефектов в legacy-коде: бизнес-логика ViewModel, баги UI-слоя',
        'Миграция 5–7 UI-модулей с XML на Jetpack Compose',
        'Разработал 2 приложения с нуля в двух реализациях UI (XML и Jetpack Compose) — от архитектуры до финального экрана',
        'Исследование встроенных средств шифрования Android в команде из 3 человек; реализация демо-приложения с шифрованием данных',
      ],
    ),
  ];

  // --------------------------------------------------------------- skills ---

  static const List<SkillGroup> skillGroups = [
    SkillGroup('Языки', ['Kotlin', 'Java']),
    SkillGroup('Android', [
      'Android SDK', 'Jetpack Compose', 'Coroutines', 'Room', 'Retrofit',
      'OkHttp', 'Dagger 2', 'RxJava', 'Firebase', 'Google Play Billing',
    ]),
    SkillGroup('Архитектура', [
      'Clean Architecture', 'MVVM', 'MVP', 'MVC', 'SOLID',
      'Паттерны проектирования', 'Unit Testing',
    ]),
    SkillGroup('Данные и сеть', ['REST API', 'Backend', 'Realm', 'MongoDB', 'MySQL']),
    SkillGroup('Инструменты', ['Gradle', 'Git / GitHub', 'Android Studio', 'Jira', 'Agile']),
    SkillGroup('Развиваю', ['Kotlin Multiplatform', 'Compose Multiplatform']),
  ];
}

class StatItem {
  final double value;
  final String label;
  final String prefix;
  final String suffix;
  final int decimals;

  const StatItem({
    required this.value,
    required this.label,
    this.prefix = '',
    this.suffix = '',
    this.decimals = 0,
  });
}

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
