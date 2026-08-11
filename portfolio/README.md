# Портфолио-лендинг — Сергей Жохов, Android Developer

Одностраничный сайт на **Flutter Web**, собранный из данных резюме (hh.ru, 10.08.2026).

## Что на сайте

- **Hero** — имя, эффект печатной машинки, кнопки Telegram / Email / скачать резюме
- **Обо мне** — текст «О себе» + анимированные счётчики достижений (+70% продаж, +30% производительности, ~50К пользователей)
- **Опыт** — таймлайн по трём компаниям (Профинансы Капитал, Gora Studio, ArwinApp)
- **Навыки** — сгруппированные чипы (Kotlin, Compose, Clean Architecture, ...)
- **🖥 Терминал** — интерактивная консоль: команды `help`, `about`, `skills`, `experience`, `contacts`, `resume`, `telegram`, `whoami`, `sudo`, история по стрелкам ↑/↓
- **Контакты** — карточки с Telegram, email, телефоном, локацией

Плюс: анимированный aurora-фон с параллаксом от мыши, reveal-анимации при скролле, hover-эффекты, адаптивная вёрстка, сплэш-экран загрузки.

## Локальный запуск

Flutter SDK установлен локально в `../.flutter-sdk` (в `.gitignore`).

```bash
# разработка (hot reload)
../.flutter-sdk/flutter/bin/flutter run -d chrome

# сборка
../.flutter-sdk/flutter/bin/flutter build web --release --base-href "/"

# превью собранной версии
npm run dev -- --port 7100
```

## Деплой на GitHub Pages

Уже настроен workflow `.github/workflows/portfolio-pages.yml` — при пуше в `master`/`main`
сайт автоматически собирается и публикуется через GitHub Actions.

Что нужно сделать один раз:

1. Запушить репозиторий на GitHub.
2. В настройках репозитория: **Settings → Pages → Source → GitHub Actions**.
3. Workflow сам вычислит `base-href`: `/` для `<user>.github.io`, иначе `/<repo>/`.

Ручная сборка под конкретный репозиторий:

```bash
flutter build web --release --base-href "/<имя-репозитория>/"
```

## Данные

Все тексты лежат в `lib/data/portfolio_data.dart` — правьте только его.
Резюме для кнопки «Скачать резюме» — `web/resume.pdf`.
