# Future Plans

A personal tracker for things to implement or do later.

---

## Pro Plan

Features gated behind a subscription (monthly / yearly via RevenueCat).

### Pro Features

- [ ] **Online Groups** — create/join groups, see member quest activity feed, compare streaks; online-only; syncs via backend
- [ ] **Theme Editor** — custom accent color picker (replaces lime), alternate card styles (minimal / outlined / filled); stored in UserProfile
- [ ] **Cloud Sync** — multi-device support; Isar as local cache, backend as source of truth; delta sync on reconnect
- [ ] **AI Quests** — server-side Gemini 2.0 Flash generation via Supabase Edge Function; personalized to category history, streak, preferred categories; falls back to procedural when offline or on timeout
- [ ] **Advanced Stats** — longer history charts (30/90/365 day), per-category breakdowns, time-of-day heatmap, CSV/PDF export
- [ ] **Streak Shield** — redeem 1 missed day per week without breaking streak; 1 shield max, refills weekly
- [ ] **Custom Notification Schedule** — set exact reminder times per day, choose days, control frequency

### Free Tier Limits (what free users get)

- All core quest features (daily, chain, challenge, break mode)
- Procedural quest generation
- Full titles system
- Streak tracking (7-day view)
- Stats (current week only)
- 1 notification slot (daily reminder at fixed time)
- No groups, no cloud sync, no theme editing

---

## Monetization

- [ ] **In-app subscriptions via Google Play Billing**
  - Use RevenueCat (`purchases_flutter`) to manage subscriptions
  - Products: monthly (~₱149 / $2.99) and yearly (~₱999 / $19.99)
  - Gate pro features via `EntitlementService` (wraps RevenueCat entitlement check)
  - Later: App Store IAP for iOS parity

- [ ] **Stripe (global web payments)**
  - Long-term, for international web audience
  - Requires a thin backend (Node/Python) to hold secret key

---

## Backend

- [ ] **Add a backend when needed for:**
  - Cloud sync (Groups + multi-device)
  - Push notifications (Firebase Cloud Messaging)
  - Server-side subscription validation (if going beyond RevenueCat)
  - User accounts / auth
  - AI quest generation endpoint

### Supabase — DECIDED 2026-05-16

Using Supabase (not Firebase — cheaper, no credit card needed for free tier, 500K Edge Function invocations/month free).

**Cost at scale:** Gemini API is the only real cost (~$8/month at 1K Pro users, ~$79/month at 10K). Supabase backend itself is ~$0–$25/month.

**Implementation order:**
- [ ] Create Supabase project + store `GEMINI_KEY` as Supabase secret (never in binary)
- [ ] `feature_flags` table — remote feature flags, fetched on app start, fallback to local defaults offline
- [ ] Anonymous auth — auto sign-in on first launch, gives JWT; no login screen needed now
- [ ] Edge Function: `generate-quest` — verifies JWT → calls Gemini with secret key → returns quest JSON
- [ ] Flutter: add `supabase_flutter`, init in `main.dart`, wire anonymous auth
- [ ] Replace `AIQuestService._callGemini()` direct call with Edge Function call (JWT sent automatically)
- [ ] `profiles` table with `is_pro` boolean — add when RevenueCat is wired
- [ ] Edge Function Pro check — read `is_pro` from DB before calling Gemini

**Feature flags table:**
```
key               | enabled | description
------------------|---------|---------------------------
ai_quests         | true    | Pro AI generation
break_mode        | true    | Break mode
chain_quests      | true    | Chain quests
challenge_quests  | true    | Challenge quests
```
Replaces hardcoded `app_features.dart` constants. App fetches on startup, caches locally.

---

## Publishing

- [ ] Register Google Play Developer account ($25 one-time fee)
- [ ] Write and host a Privacy Policy (required before publishing)
- [ ] Build release-signed AAB from Flutter
- [ ] Prepare store listing: icon, screenshots, short + full description
- [ ] Fill out content rating questionnaire
- [ ] Set distribution countries (default: global)

---

## Features

### Planned (Free)

- [ ] Character mascot system — see Current Ideas below
- [ ] Web version (landing page + web checkout)
- [ ] User accounts / authentication (required before Groups can ship)

### Planned (Pro)

- [ ] Online Groups — group schema, activity feed, join/invite flow; needs backend + auth
- [ ] Theme Editor — accent color picker, card style variants; UserProfile schema extension
- [ ] Cloud Sync — backend delta sync, conflict resolution (last-write-wins by timestamp)
- [ ] AI Quests — Gemini 2.0 Flash via Supabase Edge Function, personalization from category history + streak
- [ ] Advanced Stats — extended charts, export (CSV/PDF)
- [ ] Streak Shield — shield mechanic, weekly refill logic in QuestsController
- [ ] Custom Notification Schedule — multiple slots, day picker; NotificationService extension

---

## Observability (PostHog)

Track where users go and what they pick — no PII, no custom events spam.

### Package

- `posthog_flutter` — free tier: 1M events/month, stops ingesting (no charge) if exceeded

### Pattern

Thin `AnalyticsService.track(event, {Map<String, dynamic>? props})` wrapper. Called from controllers only, never widgets. PostHog SDK queues offline, flushes on reconnect.

### Events to Track

**Navigation (screen views)**

- `screen_home`
- `screen_quests`
- `screen_history`
- `screen_profile`
- `screen_settings`
- `screen_streak`
- `screen_stats`
- `screen_all_quests`
- `screen_all_titles`
- `screen_notifications`
- `screen_quest_preferences`

**Quest lifecycle**

- `quest_completed` — `{category, nature, type: daily|chain|challenge}`
- `quest_skipped` — `{category, type}`
- `quest_expired` — `{category, type}`
- `chain_accepted` — `{step_count}`
- `chain_declined`
- `chain_step_completed` — `{step, total}`
- `challenge_accepted` — `{duration_days, category}`
- `challenge_declined`
- `challenge_completed`
- `challenge_abandoned`

**Prompt system**

- `quest_prompt_yes` — `{requires_key}`
- `quest_prompt_no` — `{requires_key}`

**Break mode**

- `break_accepted`
- `break_declined`
- `break_ended_early`

**Titles**

- `title_earned` — `{title_type: quest|time|gacha}`

**Quest submission picks**

- `submission_emotion_selected` — `{emotion}` (one event per emotion picked)
- `submission_difficulty` — `{level: easy|moderate|hard}` (map slider position)

**Settings / preferences**

- `category_preference_saved` — `{categories: [...]}`
- `notification_toggled` — `{type: streak|daily, enabled: bool}`

### Not tracked

- Specific quest text or titles (avoids content fingerprinting)
- Photo upload, timer duration, description text
- Any field that could identify the user

---

## UI Redesigns Needed

Components flagged for visual redesign before release. Logic stays, only UI changes.

- [ ] **Quest Complete card** (`daily_completed_card.dart`) — current design is placeholder; needs a proper completion state with more visual weight
- [ ] **Profile card** (`profile_card.dart`) — lime card layout needs refinement; avatar, streak pill, and flavor text section feel unpolished
- [ ] **Pro CTA card** (`core/widgets/pro_cta_card.dart`) — first-pass design; needs stronger visual hierarchy to drive conversion
- [ ] **Buy Pro page** (`settings/pages/pro/pro_screen.dart`) — first-pass UI; hero, feature list, and pricing toggle all need proper design pass
- [ ] **Quest details screen** (`quests/pages/quest_detail/quest_detail_screen.dart`) — layout needs tightening; info rows and hint block feel dense
- [ ] **Title earned sheet** (`quests/widgets/title_earned_sheet.dart`) — the random/gacha title reveal needs more drama; currently too plain
- [ ] **Progress card** (`home/widgets/stats_access_card.dart`) — current card is a teaser placeholder; needs a real design with a preview of actual data

---

## Current Ideas

### AI Quests Architecture

**Model:** Gemini 2.0 Flash (primary). Test first — upgrade to Gemini 2.5 Flash or GPT-4o-mini only if output quality is consistently flat.

**Why Gemini 2.0 Flash:**

- ~$0.00016/quest (2.5x cheaper than Claude Haiku 3.5 with caching)
- Google free tier: 1,500 req/day — test at zero cost
- Creative writing quality comparable to Haiku for short evocative text

**Cost projection (Gemini 2.0 Flash, 1.5 quests/user/day):**

| Pro users | Quests/month | API cost |
| --------- | ------------ | -------- |
| 10        | 450          | ~$0.07   |
| 50        | 2,250        | ~$0.36   |
| 100       | 4,500        | ~$0.72   |
| 500       | 22,500       | ~$3.60   |

At ₱149/month per user, 1 subscriber covers ~200 users worth of API costs.

**Request flow:**

```
App → POST /api/generate-quest (Supabase Edge Function, free tier)
     → Gemini 2.0 Flash API
     → GeneratedQuest JSON
     → App deserializes → quest assigned
```

**Server cost:** $0 — Supabase Edge Functions free tier = 500K invocations/month.

**App-side payload sent to server:**

```json
{
  "categoryHistory": { "physical": 5, "cooking": 2, ... },
  "streakCount": 12,
  "preferredCategories": ["physical", "mental"],
  "recentQuestTitles": ["Cook something new", "Go for a run"],
  "cachedRequires": ["bike", "gym_access"]
}
```

**Server response (maps to GeneratedQuest):**

```json
{
  "title": "...",
  "questText": "...",
  "nature": "social",
  "category": "physical",
  "characterId": 2,
  "characterNote": "...",
  "requires": null
}
```

**App-side architecture:**

- `GeneratedQuest` shape unchanged — AI is just another producer
- New `AIQuestService` — handles HTTP call, parses response, throws on failure
- `QuestsController._assignNewQuest()` checks: `isPro && isOnline` → `AIQuestService.generate()` → on failure/timeout → `QuestGenerator.generate()` (procedural fallback, silent)
- 5s timeout on AI call — never block the user

**Fallback chain:**

```
1. isPro + online  → Gemini (5s timeout)
2. Timeout/error   → procedural (silent, no user-facing error)
3. Not Pro/offline → procedural
```

**Token reduction rules:**

- Tight JSON output schema — no explanation tokens
- System prompt cached via Gemini context caching (character bios, natures, Altrr voice)
- Generate only when `activeQuest == null`, never speculatively
- No retries on failure — fall back immediately

**The server prompt is the product.** Character voices, Altrr narrative tone, output schema constraints, and category/nature rules all live in the system prompt. Write this carefully before wiring the app.

**Build order:**

1. Write + iterate server prompt manually via Gemini API playground
2. Scaffold Supabase Edge Function
3. Build `AIQuestService` in app
4. Wire into `QuestsController` behind `isPro` gate
5. Wire `EntitlementService` (RevenueCat) to set `isPro`

---

### Character Mascot System

Collectible companion system — characters feel like pets. No effect on quest generation.

**Derivation**

- Primary mascot = character whose domains match your most-completed quest category
- Derived at read time from Isar quest history — no schema change needed
- Changes naturally as your history shifts

**Collectible mechanic**

- Track "met" characters via AppPreferences list (add character name on first quest from that character)
- Roster screen (`/mascots`) showing all 5 characters (Senna, Kael, Oryn, Mira, Lyra)
  - Met: full card with name, epithet, domain, bio
  - Unmet: silhouetted / locked with unlock hint
- Primary mascot shown on ProfileScreen

**Reactions (voice lines)**

- Quest completion: primary mascot says a one-liner in their voice (small toast/banner)
- Streak milestones: mascot congratulates you
- Break mode: Lyra speaks specifically (she's the health character)
- Small phrase pool per character per event type (5–10 lines each)

**What to build**

- [ ] `MascotService` — derives primary mascot from completed quest category counts
- [ ] Voice line pools per character (`shared/generation/character/mascot_lines.dart`)
- [ ] "Met characters" tracking in AppPreferences
- [ ] Roster UI — met/unmet character cards on `/mascots` route
- [ ] Event hooks in QuestsController to trigger mascot voice lines
- [ ] Mascot presence on ProfileScreen (name + flavor line)
