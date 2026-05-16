---
name: Planned Features
description: Features agreed on but not yet implemented — architecture phase as of 2026-04-19
type: project
---

## Feature Flag System

Built: `lib/core/config/app_features.dart`

Hardcoded Dart constants — compiled into binary, not per-user, not on-device editable.

| Flag                 | Status | Notes                                   |
| -------------------- | ------ | --------------------------------------- |
| `singularQuests`     | true   | Core, always on                         |
| `challengeQuests`    | true   | Ready to build                          |
| `difficultyFeedback` | true   | Ready to build                          |
| `breakMode`          | true   | Ready to build                          |
| `limitedTimeQuests`  | false  | On hold — disabled until further notice |

---

## Philosophy

Altrr IS the challenge. The app assigns quests users wouldn't choose themselves — pulling them across all 8 categories. Marginal improvement comes from breadth of experience over time, not difficulty scaling. Small consistent actions that compound without feeling like a treadmill.

---

## Feature 1: Challenge Quests

Quest type that runs for a longer window (days/week), parallel to the daily singular quest. Opt-in — system offers it (based on balance tracker observation), user accepts or declines. NOT user-directed — Altrr picks it.

**Needs:**

- New quest type field on Quest model (`QuestType.singular` / `QuestType.challenge`)
- Longer expiry logic (days/week instead of 24h)
- Acceptance/decline flow (bottom sheet or prompt)
- Challenge quest display on home/quests screens alongside singular
- Generation logic: balance tracker triggers challenge offer when category neglect threshold crossed

---

## Feature 2: Difficulty Feedback Loop

Submission difficulty slider already collects data. Needs to feed back into generation.

**Needs:**

- Per-category intensity bias stored in AppPreferences (e.g. `pref_intensity_physical`, int -1/0/1 or rolling average)
- `DifficultyService` or method in AppPreferences: `updateCategoryIntensity(category, sliderValue)`
- QuestGenerator reads intensity bias and weights phrase selection accordingly
- No Quest model field needed

---

## Feature 3: Break Mode

Wellness layer — occasional prompt asks "Are you tired?" If yes, app goes quiet for the day.

**Needs:**

- Prompt trigger logic (when to show — e.g. after N consecutive quest completions, or time-based)
- Break state stored in AppPreferences (`pref_break_mode_date` — if today's date, break is active)
- When active: quests screen shows rest state, no new quest assigned, no streak penalty
- Break resets at midnight (new day = break cleared)
- Prompt UI (bottom sheet or overlay)

---

## Feature 4: Limited Time Quests (ON HOLD)

Special quests available only within a specific time window. Disabled via `AppFeatures.limitedTimeQuests = false`. Architecture TBD when enabled.

---

## Implementation Order (agreed)

1. Challenge quests (architecture first)
2. Difficulty feedback loop
3. Break mode
4. Limited time quests (future)
