---
name: Altrr Build Progress
description: Wha  t has been built, what's next, and decisions made during development
type: project
---

## Session 3 — ended Apr 9 2026

### Completed this session

- **Settings screen** — PREFERENCES section, 3 SettingsCard rows, 2 SettingsToggleCard rows, Sign out button, "Altrr v1.0.0" caption. Uses SettingsController (ChangeNotifier).
- **Profile screen** — AppBarBack, ProfileCard (lime), YOUR NUMBERS stat grid, RECENT TITLES with NEW badge rows, ALL TITLES horizontal TitleCard scroll. Lives under home feature.
- **Notifications screen** — AppBarBack, TODAY + EARLIER sections, NotificationRow widget with unread state (lime tint, lime left border, lime dot). Bell icon in home wired to `/notifications`.
- **Folder structure refactor** — all screens moved into `pages/<name>/` subfolders. Feature-specific widgets extracted to `feature/widgets/`. State moved to `feature/controllers/`.
- **Profile moved under home** — `features/profile/` deleted, profile now lives at `features/home/pages/profile/`.
- **Isar schemas** — `Quest` and `Character` collections created in `lib/shared/models/`. Isar deps added to pubspec.yaml.
- **Procedural generation architecture** — designed (not yet coded): template + word pool + seeded Random system for generating quest text without AI.
- **Git pushed** — all changes committed and pushed to https://github.com/PatrickJohn243/altrr.git (master branch, repo root is `altrr_app/`).

### Still to build

- Procedural generation system:
  - `lib/shared/generation/quest_word_pool.dart`
  - `lib/shared/generation/quest_template.dart`
  - `lib/shared/generation/quest_generator.dart`
- Isar DB initialization in `main.dart`
- Connect screens to real data (replace placeholder static data)
- CharacterGenerator utility (seed → Character traits)
- Side quest page (if needed)

### Architecture decisions made this session

- No extra state management packages — ChangeNotifier + ListenableBuilder only
- Controllers are created in `initState` and disposed in `dispose`
- Profile is under home feature, not a standalone feature
- Only 4 main features: home, quests, history, settings (navbar items)
- No Figma diagrams — user reviews schemas directly in code
- No co-author line in commits
- Supabase still planned as backend when data layer is added (from session 2)
- Isar chosen for local on-device storage

## Session 2 — ended Apr 8 2026

### Completed

- Full theme foundation: `AppColors`, `AppTypography`, `AppSpacing`, `AppRadius`, `AppTheme`
- All core widgets built (see folder_structure.md for full list)
- `go_router` with `ShellRoute` — navbar tabs use `context.go()`, profile uses `context.push()`
- `device_preview` enabled (set `enabled: true` in main.dart, flip to false before release)
- Home screen — full layout with QuestDisplayCard, StreakCard, TitleCard scroll, QuestRowCard list
- Quests screen — QuestCard (two-tone), stat grid, SideQuestCard list, TitleCard scroll
- History screen — AppBarSearch with live filter, date-grouped QuestRowCard sections
