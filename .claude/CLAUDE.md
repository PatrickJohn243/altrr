# Altrr — Design System Rules for Claude

This document guides Claude when implementing Figma designs into the Altrr Flutter codebase.

---

## Project Overview

**Altrr** is a Flutter mobile app (Android/iOS) — a procedural productivity app that assigns quests to users rather than letting them create their own. Features: quests, streak tracking, titles system, quest history/sharing.

- **Framework:** Flutter (Dart 3.5.3+)
- **Entry point:** `altrr_app/lib/main.dart`
- **Figma file:** `btObw9UUwv7wZxKJwld49Q` (Altrr)

---

## Project Structure

The `lib/` directory should be organized as follows (build this structure as screens are implemented):

```
altrr_app/lib/
├── main.dart                  # App entry point + theme
├── core/
│   ├── theme/
│   │   ├── app_colors.dart    # All color tokens
│   │   ├── app_typography.dart # All text styles
│   │   ├── app_theme.dart     # ThemeData assembly
│   │   └── app_spacing.dart   # Spacing constants
│   └── widgets/               # Shared/reusable widgets
│       ├── app_bar_main.dart
│       ├── app_bar_back.dart
│       ├── navbar.dart
│       ├── stat_card.dart
│       ├── quest_display_card.dart
│       ├── streak_card.dart
│       ├── title_card.dart
│       └── buttons.dart
├── features/
│   ├── home/
│   │   └── home_screen.dart
│   ├── quests/
│   │   └── quests_screen.dart
│   ├── profile/
│   │   └── profile_screen.dart
│   └── settings/
│       └── settings_screen.dart
└── shared/
    └── models/                # Data models
```

---

## 1. Design Tokens

### Colors (`lib/core/theme/app_colors.dart`)

```dart
import 'package:flutter/material.dart';

class AppColors {
  // Backgrounds
  static const Color bgPrimary    = Color(0xFF121212);
  static const Color bgSurface    = Color(0xFF1C1C1C);
  static const Color bgElevated   = Color(0xFF242424);
  static const Color bgEmpty      = Color(0xFF2E2E2E);

  // Accent
  static const Color accent       = Color(0xFFC8F135); // lime green — primary CTA, active states
  static const Color accentDim    = Color(0x66C8F135); // 40% opacity
  static const Color accentSubtle = Color(0x12C8F135); // ~7% opacity (nav highlight bg)

  // Text
  static const Color textPrimary  = Color(0xFFF0F0F0);
  static const Color textMuted    = Color(0x47F0F0F0); // rgba(240,240,240,0.28)
  static const Color textDisabled = Color(0x73FFFFFF); // rgba(255,255,255,0.45)
  static const Color textInverse  = Color(0xFF121212); // text on accent bg

  // Borders
  static const Color borderSubtle = Color(0x12FFFFFF); // rgba(255,255,255,0.07)
  static const Color borderMid    = Color(0x1FFFFFFF); // rgba(255,255,255,0.12)
  static const Color borderCard   = Color(0x0FFFFFFF); // rgba(255,255,255,0.06)

  // Quest card (lime)
  static const Color questCardBg         = accent;
  static const Color questCardOverlay    = Color(0x1A121212); // rgba(18,18,18,0.10)
  static const Color questCardTextMuted  = Color(0x8C121212); // rgba(18,18,18,0.55)
  static const Color questCardTextDim    = Color(0x73121212); // rgba(18,18,18,0.45)

  // Profile card (lime)
  static const Color profileCardBg = accent;
}
```

### Typography (`lib/core/theme/app_typography.dart`)

Altrr uses two custom fonts loaded via `google_fonts` or bundled in `assets/fonts/`:

- **Unbounded** — headings, titles, labels, CTAs (weights: Black=900, ExtraBold=800, Bold=700)
- **Outfit** — body, captions, subtitles (weights: Medium=500, SemiBold=600, Bold=700)

```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // add to pubspec.yaml

class AppTypography {
  // --- Unbounded ---
  static TextStyle unboundedBlack(double size, Color color) =>
      GoogleFonts.unbounded(fontSize: size, fontWeight: FontWeight.w900, color: color);

  static TextStyle unboundedExtraBold(double size, Color color) =>
      GoogleFonts.unbounded(fontSize: size, fontWeight: FontWeight.w800, color: color);

  static TextStyle unboundedBold(double size, Color color) =>
      GoogleFonts.unbounded(fontSize: size, fontWeight: FontWeight.w700, color: color);

  static TextStyle unboundedMedium(double size, Color color) =>
      GoogleFonts.unbounded(fontSize: size, fontWeight: FontWeight.w500, color: color);

  // --- Outfit ---
  static TextStyle outfitBold(double size, Color color) =>
      GoogleFonts.outfit(fontSize: size, fontWeight: FontWeight.w700, color: color);

  static TextStyle outfitSemiBold(double size, Color color) =>
      GoogleFonts.outfit(fontSize: size, fontWeight: FontWeight.w600, color: color);

  static TextStyle outfitMedium(double size, Color color) =>
      GoogleFonts.outfit(fontSize: size, fontWeight: FontWeight.w500, color: color);

  // --- Named styles from Figma ---
  static TextStyle get screenTitle =>
      unboundedBlack(24, AppColors.textPrimary);

  static TextStyle get questTitle =>
      unboundedBlack(20, AppColors.textInverse);

  static TextStyle get questDescription =>
      unboundedExtraBold(16, AppColors.textInverse);

  static TextStyle get sectionLabel =>
      unboundedBold(12, AppColors.textMuted)
          .copyWith(letterSpacing: 1.26);

  static TextStyle get cardTitle =>
      unboundedBold(12, AppColors.textPrimary);

  static TextStyle get categoryLabel =>
      unboundedExtraBold(10, AppColors.accent)
          .copyWith(letterSpacing: 0.36);

  static TextStyle get ctaButton =>
      unboundedBold(12, AppColors.textInverse)
          .copyWith(letterSpacing: 0.11);

  static TextStyle get bodyMedium =>
      outfitMedium(12, AppColors.textMuted);

  static TextStyle get bodySemiBold =>
      outfitSemiBold(12, AppColors.textPrimary);

  static TextStyle get caption =>
      outfitSemiBold(9, AppColors.textMuted);

  static TextStyle get greeting =>
      outfitMedium(12, AppColors.textMuted);
}
```

**Add to pubspec.yaml:**
```yaml
dependencies:
  google_fonts: ^6.2.1
```

### Spacing (`lib/core/theme/app_spacing.dart`)

```dart
class AppSpacing {
  static const double xs   = 4.0;
  static const double sm   = 8.0;
  static const double md   = 12.0;
  static const double lg   = 16.0;
  static const double xl   = 20.0;
  static const double xxl  = 24.0;
  static const double xxxl = 28.0;

  // Screen padding
  static const double screenPadding = 20.0;

  // Card padding
  static const double cardPadding   = 20.0;
  static const double cardPaddingMd = 16.0;
  static const double cardPaddingSm = 12.0;

  // Gap between sections
  static const double sectionGap = 20.0;
  static const double itemGap    = 12.0;
}
```

### Border Radii

```dart
class AppRadius {
  static const double card     = 16.0;
  static const double button   = 10.0;
  static const double chip     = 20.0;
  static const double avatar   = 22.0;
  static const double icon     = 10.0;
  static const double dot      = 3.0;
  static const double screen   = 52.0; // phone frame in Figma mockups only
}
```

---

## 2. Theme Assembly (`lib/core/theme/app_theme.dart`)

```dart
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.bgPrimary,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.accent,
      onPrimary: AppColors.textInverse,
      surface: AppColors.bgSurface,
      onSurface: AppColors.textPrimary,
      background: AppColors.bgPrimary,
    ),
    textTheme: TextTheme(
      displayLarge: AppTypography.unboundedBlack(24, AppColors.textPrimary),
      titleMedium:  AppTypography.unboundedBold(12, AppColors.textPrimary),
      bodyMedium:   AppTypography.outfitMedium(12, AppColors.textMuted),
    ),
    dividerColor: AppColors.borderSubtle,
  );
}
```

**Apply in `main.dart`:**
```dart
MaterialApp(
  title: 'Altrr',
  theme: AppTheme.dark,
  ...
)
```

---

## 3. Card Component Patterns

Cards in Altrr have a distinctive layered border style: `border-b-3` (thicker bottom border) and `border` on other sides using `borderSubtle`.

### Standard Dark Card

```dart
Container(
  decoration: BoxDecoration(
    color: AppColors.bgSurface,
    borderRadius: BorderRadius.circular(AppRadius.card),
    border: Border(
      top:    BorderSide(color: AppColors.borderSubtle, width: 1),
      left:   BorderSide(color: AppColors.borderSubtle, width: 1),
      right:  BorderSide(color: AppColors.borderSubtle, width: 1),
      bottom: BorderSide(color: AppColors.borderSubtle, width: 3), // thicker bottom
    ),
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(AppRadius.card),
    child: /* card content */,
  ),
)
```

### Lime Quest Card (home + quests screen)

```dart
Container(
  padding: const EdgeInsets.all(AppSpacing.cardPadding),
  decoration: BoxDecoration(
    color: AppColors.accent,
    borderRadius: BorderRadius.circular(AppRadius.card),
  ),
  child: /* quest content */,
)
```

### Quest Card (expanded, quests screen) — two-tone

Top section: lime bg. Bottom section: dark bg with border.

```dart
Column(
  children: [
    // Top: lime
    Container(
      padding: const EdgeInsets.all(AppSpacing.cardPadding),
      decoration: const BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.card)),
      ),
      child: /* title section */,
    ),
    // Bottom: dark
    Container(
      padding: const EdgeInsets.all(AppSpacing.cardPadding),
      decoration: BoxDecoration(
        color: AppColors.bgPrimary,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(AppRadius.card)),
        border: Border(
          top:    BorderSide(color: AppColors.borderSubtle, width: 1),
          left:   BorderSide(color: AppColors.borderSubtle, width: 1),
          right:  BorderSide(color: AppColors.borderSubtle, width: 1),
          bottom: BorderSide(color: AppColors.borderSubtle, width: 3),
        ),
      ),
      child: /* description + actions */,
    ),
  ],
)
```

---

## 4. Button Patterns

### Primary Button (dark bg, lime text — on lime card)
```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.bgPrimary,
    foregroundColor: AppColors.accent,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.button)),
    elevation: 0,
  ),
  child: Text('Complete', style: AppTypography.ctaButton.copyWith(color: AppColors.accent)),
)
```

### Primary Button (lime bg, dark text — on dark card)
```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.accent,
    foregroundColor: AppColors.textInverse,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.button)),
    elevation: 0,
  ),
  child: Text('Complete', style: AppTypography.ctaButton),
)
```

### Ghost/Outline Button (settings, skip)
```dart
OutlinedButton(
  style: OutlinedButton.styleFrom(
    foregroundColor: AppColors.textDisabled,
    side: BorderSide(color: AppColors.borderMid, width: 1),
    padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.button)),
  ),
  child: Text('Start', style: AppTypography.unboundedBold(12, AppColors.textDisabled)),
)
```

### Icon Button (skip/info — small circle)
```dart
Container(
  width: 28, height: 28,
  decoration: BoxDecoration(
    color: AppColors.bgElevated,
    borderRadius: BorderRadius.circular(14),
    border: Border.all(color: AppColors.borderMid),
  ),
  child: Icon(/* icon */, size: 12, color: AppColors.textMuted),
)
```

---

## 5. Navigation Patterns

### Bottom Navbar

The navbar sits at the bottom, 83px tall, with a top border. Active tab shows lime icon + text + subtle lime pill highlight. Tabs: **Home**, **Quests**, **History**, **Settings**.

```dart
// Active indicator pill
Container(
  width: 64, height: 32,
  decoration: BoxDecoration(
    color: AppColors.accentSubtle,
    borderRadius: BorderRadius.circular(16),
  ),
)
// Active label color: AppColors.accent, weight: Bold
// Inactive label color: AppColors.textDisabled, weight: SemiBold
```

### App Bar (main — greeting)
- Left: "Good evening," (Outfit Medium 12, textMuted) + username (Unbounded Black 24, textPrimary) + bell icon
- Right: Avatar circle (lime bg, dark initials, Unbounded ExtraBold 14)

### App Bar (back — profile)
- Back button: dark card (bgSurface) with back arrow icon, "Back" label (Outfit Medium 12, textDisabled)

### App Bar (search)
- Contains a search bar component inline

---

## 6. Section Headers

Section headers follow a consistent pattern: label + horizontal divider + optional "See All" link.

```dart
Row(
  children: [
    Text('THIS WEEK', style: AppTypography.sectionLabel),
    const SizedBox(width: AppSpacing.md),
    Expanded(child: Divider(color: AppColors.borderSubtle, thickness: 1)),
    // Optional:
    const SizedBox(width: AppSpacing.md),
    Text('SEE ALL', style: AppTypography.unboundedBold(12, AppColors.accent)
        .copyWith(letterSpacing: 1.26)),
  ],
)
```

---

## 7. List Row Patterns

### Quest row (Recent Quests, history)

```
[icon box 36x36] | [category label (accent)] | [quest title (textPrimary)] | [date]
```
- Icon box: `bgElevated` or `Color(0x12FFFFFF)` background, rounded 10
- Skipped/failed quests: all text at ~7% opacity (`Color(0x12FFFFFF)` etc.)
- Height: 72px

### Title row (Your Titles, Recent Titles)

```
[icon box 36x36] | [title name (textPrimary)] / [category · earned date (textMuted)] | [NEW badge?]
```
- NEW badge: lime pill 37×13, "NEW" in Unbounded Black 8px, textInverse

### Settings row (card-neutral)

```
[icon box 36x36 bgElevated] | [label (textPrimary)] / [sublabel (textMuted)] | [chevron or toggle]
```

---

## 8. Title Cards (horizontal scroll)

Small vertical cards (119×155px) shown in horizontal scroll lists. Two-tone: lime header (icon), dark body (category + title name + quest count).

```dart
Container(
  width: 119, height: 155,
  decoration: BoxDecoration(
    color: AppColors.bgPrimary,
    borderRadius: BorderRadius.circular(AppRadius.card),
    border: Border(
      top:    BorderSide(color: AppColors.borderSubtle),
      left:   BorderSide(color: AppColors.borderSubtle),
      right:  BorderSide(color: AppColors.borderSubtle),
      bottom: BorderSide(color: AppColors.borderSubtle, width: 3),
    ),
  ),
  child: Column(
    children: [
      // Lime header
      Container(
        height: 63,
        decoration: const BoxDecoration(
          color: AppColors.accent,
          borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.card)),
          border: Border(bottom: BorderSide(color: AppColors.borderSubtle)),
        ),
        child: /* category icon */,
      ),
      // Dark body
      Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(category, style: AppTypography.categoryLabel),
            Text(titleName, style: AppTypography.unboundedExtraBold(12, AppColors.textPrimary)),
            Text('$n quest', style: AppTypography.outfitMedium(12, AppColors.textDisabled)),
          ],
        ),
      ),
    ],
  ),
)
```

---

## 9. Stat Cards (3-column grid)

```dart
GridView.count(
  crossAxisCount: 3,
  mainAxisSpacing: 8,
  crossAxisSpacing: 8,
  childAspectRatio: /* ~1.7 */,
  shrinkWrap: true,
  children: [
    _StatCard(value: '14', label: 'Quests done'),
    _StatCard(value: '1',  label: 'Skips'),
    _StatCard(value: '3',  label: 'Titles earned'),
  ],
)

// StatCard: bgSurface, rounded 16, bottom border 2px
// Value: Unbounded Black 20, accent color
// Label: Outfit SemiBold 12, textMuted, center aligned
```

---

## 10. Streak Card

Weekly bar chart (M–T–W–T–F–S–S). Each bar is a column with day letter (caption) + bar (28px tall).

- **Completed day:** `bgAccent` (`AppColors.accent`) filled bar, rounded 8
- **Current day (not done):** bordered bar `Border.all(color: AppColors.accentDim)`
- **Missed day:** `AppColors.bgEmpty` filled bar
- Streak count: Outfit SemiBold 12, accent; displayed with flame icon
- "Keep it up!" label: Unbounded ExtraBold 12, textPrimary

---

## 11. Toggle Switch

Custom-styled iOS-like toggle. Active state: lime track, dark knob.

```dart
Switch(
  value: isOn,
  onChanged: (v) => setState(() => isOn = v),
  activeColor: AppColors.accent,
  activeTrackColor: AppColors.accent,
  inactiveTrackColor: AppColors.bgElevated,
  thumbColor: WidgetStateProperty.all(AppColors.bgPrimary),
)
```

---

## 12. Profile Card

Lime green card with avatar (dark circle, lime initials, lime ring), username, member date, streak pill, and "You are becoming —" flavor text section.

- Avatar: 60×60, circular, `bgPrimary` fill, `Color(0x80C8F135)` border (50% opacity lime)
- Edit badge: 20×20 circle on avatar bottom-right
- Streak pill: `Color(0x1F121212)` bg (12% black), rounded 20, flame icon + count + "day streak"
- Flavor text box: `Color(0x1A121212)` bg, rounded 11, label uppercase tracking + body

---

## 13. Modals

### Skip Quest Modal

Centered bottom-sheet style. Dark bg (`bgSurface`), rounded top corners. Contains:
- Quest name (Unbounded Black)
- Action buttons: "Skip" (ghost/outline) and "Keep going" (lime primary)

Use `showModalBottomSheet` or a custom overlay dialog.

---

## 14. Quest Status Conventions

| State | Visual |
|-------|--------|
| Active | Lime green card, full opacity |
| Completed | Row in Recent Quests, full opacity |
| Skipped/failed | Row in history, ~7% text opacity (all text dimmed) |
| Locked/upcoming | Dimmed with outline only |

"Assigned by ALTRR" label uses a 6px dot + label. "Anonymously assigned" uses same dot pattern.

---

## 15. Icon System

Icons used in Figma are SVG assets. When implementing:

1. Store custom SVGs in `assets/icons/`
2. Register in `pubspec.yaml`:
   ```yaml
   flutter:
     assets:
       - assets/icons/
   ```
3. Use `SvgPicture.asset('assets/icons/home.svg')` via `flutter_svg` package
4. Material Icons used where equivalent exists (settings gear, chevron right, clock, etc.)

**Add to pubspec.yaml:**
```yaml
dependencies:
  flutter_svg: ^2.0.10+1
```

---

## 16. Fonts Setup (`pubspec.yaml`)

If bundling fonts locally instead of `google_fonts`:

```yaml
flutter:
  fonts:
    - family: Unbounded
      fonts:
        - asset: assets/fonts/Unbounded-Medium.ttf
          weight: 500
        - asset: assets/fonts/Unbounded-Bold.ttf
          weight: 700
        - asset: assets/fonts/Unbounded-ExtraBold.ttf
          weight: 800
        - asset: assets/fonts/Unbounded-Black.ttf
          weight: 900
    - family: Outfit
      fonts:
        - asset: assets/fonts/Outfit-Medium.ttf
          weight: 500
        - asset: assets/fonts/Outfit-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/Outfit-Bold.ttf
          weight: 700
```

Prefer `google_fonts` package for development speed — switch to bundled fonts before release for offline reliability.

---

## 17. Responsive / Layout Notes

- All Figma screens are designed for **390px width** (iPhone 14 Pro)
- Use `MediaQuery.of(context).size.width` for adaptive sizing if needed
- Screen padding: 20px horizontal (`AppSpacing.screenPadding`)
- Cards inside screen padding: effectively 350px wide (`390 - 20*2`)
- Bottom navbar: 83px tall, positioned above safe area inset

---

## 18. Known Design Notes

- The app's voice is narrative and atmospheric — quest copy uses evocative language, not task-manager language
- Skipping quests is tracked and surfaced in stats — it has intentional weight
- Titles are earned by completing quests in specific categories (Food, People, Gym, Travel, etc.)
- The profile is accessed via the avatar in the app bar, not the bottom nav
- The Settings screen still contains "Side Quest · v1.0.0" in the design — this is a placeholder/leftover to be updated
- The active tab label on the Settings screen incorrectly reads "Quests" in Figma — the label should be "Settings"
- No XP system — only quests, streaks, and titles
