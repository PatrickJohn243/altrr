---
name: User Feedback & Preferences
description: Corrections and preferences from the user during sessions
type: feedback
---

## No Co-Authored-By in commits
Do not add `Co-Authored-By: Claude...` to commit messages.
**Why:** User explicitly interrupted and said "don't add co authored".
**How to apply:** Every commit for this project — omit the co-author line entirely.

## Profile is not a main feature
Profile lives under the home feature (`features/home/pages/profile/`), not as `features/profile/`.
**Why:** Only 4 main features exist — home, quests, history, settings — matching the navbar.
**How to apply:** Any profile-related screens or widgets go under `home/`.

## Folder structure convention must be followed strictly
Each feature folder uses: `pages/` (screens), `widgets/` (feature-specific), `controllers/` (state).
Sub-pages get their own named folder inside `pages/`.
**Why:** User corrected this twice and manually reorganized the pages into named subfolders.
**How to apply:** Never put a screen file directly in the feature root or directly in `pages/` — always in `pages/<name>/`.

## No Figma diagrams
User said "forget about creating diagrams in figma, I can code review it".
**Why:** Figma MCP hits rate limits and user prefers to review schemas directly in code.
**How to apply:** Skip the Figma diagram step when creating schemas or architecture docs.

## Backend is Supabase — no BLoC
Use Supabase for auth, database, and realtime. No BLoC, Cubit, or Redux.
**Why:** User prefers no BLoC overhead. Supabase handles everything server-side.
**How to apply:** Data calls go in `<feature>/<feature>_service.dart`. ChangeNotifier controllers for local state only.

## Git repo root is altrr_app/, not the parent
The `.git` folder lives inside `altrr_app/`, not in `C:\Users\ASUS\altrr\`.
**Why:** User wanted only the Flutter project contents in the repo root, not wrapped in an `altrr_app/` folder.
**How to apply:** Always run git commands from inside `altrr_app/` directory.
