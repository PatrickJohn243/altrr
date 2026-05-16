---
name: Screens Implemented
description: All screens built so far, their routes, and navigation wiring
type: project
---

## Routes (app_router.dart)

Shell routes (with bottom navbar):
- `/home` → HomeScreen
- `/quests` → QuestsScreen
- `/history` → HistoryScreen
- `/settings` → SettingsScreen

Outside shell (no navbar):
- `/profile` → ProfileScreen (under home feature)
- `/notifications` → NotificationsScreen (under home feature)

## Screens

### HomeScreen (`home/pages/home/home_screen.dart`)
- AppBarMain: greeting, username "Adventurer", initials "AV"
- Avatar tap → `/profile`
- Bell tap → `/notifications`
- QuestDisplayCard (active quest)
- StreakCard (THIS WEEK section)
- TitleCard horizontal scroll (YOUR TITLES)
- QuestRowCard list (RECENT QUESTS)

### NotificationsScreen (`home/pages/notifications/notifications_screen.dart`)
- AppBarBack
- "Notifications" title
- TODAY section: 3 rows (2 unread, 1 read)
- EARLIER section: 4 rows (all read)
- Uses NotificationRow widget (home/widgets/)
- Unread rows: lime-tinted bg, lime left border, lime dot indicator

### ProfileScreen (`home/pages/profile/profile_screen.dart`)
- AppBarBack
- ProfileCard (lime card with avatar, username, streak pill, flavor text)
- YOUR NUMBERS: 3-column StatCard grid
- RECENT TITLES: QuestNewRow with NEW badge pill instead of date
- ALL TITLES (SEE ALL): TitleCard horizontal scroll
- Uses QuestNewRow widget (home/widgets/)

### QuestsScreen (`quests/pages/quests_screen.dart`)
- AppBarMain (same as home)
- QuestCard (two-tone active quest)
- YOUR NUMBERS: StatCard grid
- QUESTS (SEE ALL): SideQuestCard list
- TITLES (SEE ALL): TitleCard horizontal scroll

### HistoryScreen (`history/pages/history_screen.dart`)
- AppBarSearch with live filter
- Date-grouped QuestRowCard list
- Empty state when no search results
- Uses HistoryController (search state + data + filter logic)

### SettingsScreen (`settings/pages/settings_screen.dart`)
- AppBarMain (greeting style)
- PREFERENCES section
- 3 SettingsCard rows: Edit profile, Export my records, Quest preferences
- 2 SettingsToggleCard rows: Streak reminder (default on), Daily reminder (default off)
- Sign out OutlinedButton (full width, not a card)
- "Altrr v1.0.0" caption
- Uses SettingsController (toggle state)
