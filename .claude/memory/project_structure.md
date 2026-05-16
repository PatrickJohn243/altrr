---
name: Altrr Project Structure
description: Actual current file structure of altrr_app/lib/ as of session 3
type: project
---

```
altrr_app/lib/
├── main.dart                                    ✅ MaterialApp.router + DevicePreview
├── core/
│   ├── router/
│   │   └── app_router.dart                      ✅ GoRouter + ShellRoute
│   ├── theme/
│   │   ├── app_colors.dart                      ✅
│   │   ├── app_typography.dart                  ✅ Unbounded + Outfit via google_fonts
│   │   ├── app_theme.dart                       ✅
│   │   └── app_spacing.dart                     ✅ AppSpacing + AppRadius
│   └── widgets/                                 ✅ all shared widgets complete
│       ├── app_bar_main.dart
│       ├── app_bar_back.dart
│       ├── app_bar_search.dart
│       ├── navbar.dart
│       ├── section_header.dart
│       ├── stat_card.dart
│       ├── quest_display_card.dart
│       ├── quest_card.dart
│       ├── quest_row_card.dart
│       ├── side_quest_card.dart
│       ├── streak_card.dart
│       ├── title_card.dart
│       ├── title_row_card.dart
│       ├── profile_card.dart
│       └── settings_card.dart
├── features/
│   ├── home/
│   │   ├── pages/
│   │   │   ├── home/
│   │   │   │   └── home_screen.dart             ✅ COMPLETE
│   │   │   ├── notifications/
│   │   │   │   └── notifications_screen.dart    ✅ COMPLETE
│   │   │   └── profile/
│   │   │       └── profile_screen.dart          ✅ COMPLETE
│   │   └── widgets/
│   │       ├── notification_row.dart            ✅
│   │       └── quest_new_row.dart               ✅
│   ├── quests/
│   │   └── pages/
│   │       └── quests_screen.dart               ✅ COMPLETE
│   ├── history/
│   │   ├── pages/
│   │   │   └── history_screen.dart              ✅ COMPLETE
│   │   ├── controllers/
│   │   │   └── history_controller.dart          ✅
│   │   └── widgets/
│   │       ├── date_section_widget.dart         ✅
│   │       └── history_empty_state.dart         ✅
│   └── settings/
│       ├── pages/
│       │   └── settings_screen.dart             ✅ COMPLETE
│       └── controllers/
│           └── settings_controller.dart         ✅
└── shared/
    └── models/
        ├── quest.dart                           ✅ Isar schema
        └── character.dart                       ✅ Isar schema
```

**How to apply:** Always place new files in the correct feature/core/shared folder following the pages/widgets/controllers convention.
