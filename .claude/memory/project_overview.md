---
name: Altrr Project Overview
description: Core facts about the Altrr Flutter app — stack, Figma file, git remote, design system
type: project
---

Altrr is a Flutter mobile app (Android/iOS) — a procedural productivity app that assigns quests to users rather than letting them create their own.

**Why:** Quest assignment is procedural/algorithmic, not user-driven. No XP system — only quests, streaks, and titles.

**How to apply:** All implementation decisions should favour procedural systems over user-input systems.

## Stack
- Flutter / Dart 3.5.3+
- Entry point: `altrr_app/lib/main.dart`
- Routing: `go_router ^14.6.2`
- Fonts: `google_fonts` (Unbounded + Outfit)
- Icons: Material Icons + `flutter_svg`
- DB: Isar (`isar: ^3.1.0+1`, `isar_flutter_libs`, `path_provider`)
- Dev: `isar_generator`, `build_runner`

## Figma
- File key: `btObw9UUwv7wZxKJwld49Q`
- Figma MCP hits rate limit on Starter plan — user may need to describe designs manually

## Git
- Remote: https://github.com/PatrickJohn243/altrr.git
- Branch: master
- Root of git repo: `altrr_app/` (not the parent folder)
- The parent `C:\Users\ASUS\altrr\` contains `altrr_app/` and `.claude/`
