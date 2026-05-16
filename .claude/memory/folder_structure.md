---
name: Folder Structure Convention
description: The agreed lib/ folder layout — features use pages/, widgets/, controllers/ subfolders
type: project
---

The 4 main features match the navbar: home, quests, history, settings.
Profile lives under home (not a standalone feature).

**Why:** User explicitly corrected this structure. Profile is a sub-page of home accessed via the avatar, not a navbar item.

**How to apply:** Any new screen goes under its parent feature's `pages/` folder. Sub-pages get their own named folder inside `pages/`.

```
altrr_app/lib/
├── main.dart
├── core/
│   ├── router/
│   │   └── app_router.dart
│   ├── theme/
│   │   ├── app_colors.dart
│   │   ├── app_typography.dart
│   │   ├── app_theme.dart
│   │   └── app_spacing.dart
│   └── widgets/                  ← shared widgets used across features
│       ├── app_bar_main.dart
│       ├── app_bar_back.dart
│       ├── app_bar_search.dart
│       ├── navbar.dart
│       ├── stat_card.dart
│       ├── quest_display_card.dart
│       ├── quest_card.dart
│       ├── quest_row_card.dart
│       ├── side_quest_card.dart
│       ├── streak_card.dart
│       ├── title_card.dart
│       ├── title_row_card.dart
│       ├── profile_card.dart
│       ├── settings_card.dart
│       └── section_header.dart
├── features/
│   ├── home/
│   │   ├── pages/
│   │   │   ├── home/
│   │   │   │   └── home_screen.dart
│   │   │   ├── notifications/
│   │   │   │   └── notifications_screen.dart
│   │   │   └── profile/
│   │   │       └── profile_screen.dart
│   │   └── widgets/               ← home-specific widgets
│   │       ├── notification_row.dart
│   │       └── quest_new_row.dart
│   ├── quests/
│   │   └── pages/
│   │       └── quests_screen.dart
│   ├── history/
│   │   ├── pages/
│   │   │   └── history_screen.dart
│   │   ├── controllers/
│   │   │   └── history_controller.dart
│   │   └── widgets/
│   │       ├── date_section_widget.dart
│   │       └── history_empty_state.dart
│   └── settings/
│       ├── pages/
│       │   └── settings_screen.dart
│       └── controllers/
│           └── settings_controller.dart
└── shared/
    └── models/
        ├── quest.dart
        └── character.dart
```

## Convention rules
- **pages/** — screens only (one named subfolder per page)
- **widgets/** — feature-specific components not shared app-wide
- **controllers/** — ChangeNotifier classes; one per stateful page
- Screens are always StatelessWidget unless they own a controller
- Controllers use `ChangeNotifier` + `ListenableBuilder` (no extra state packages)
