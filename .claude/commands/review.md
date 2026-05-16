Review a Flutter widget or screen for compliance with the Altrr design system.

Checks:
1. All colors use `AppColors.*` — no hardcoded hex or Color() literals
2. All text styles use `AppTypography.*` — no hardcoded fontSize, fontWeight, or fontFamily
3. All spacing uses `AppSpacing.*` / `AppRadius.*` — no hardcoded padding/margin/radius numbers
4. Dark cards use the correct border pattern (3px bottom, 1px other sides, `borderSubtle`)
5. Lime quest cards use `AppColors.accent` background
6. `const` is used on every widget, EdgeInsets, and decoration that doesn't depend on runtime data
7. `StatefulWidget` is only used when local state is genuinely needed
8. `ClipRRect` wraps children that could overflow rounded containers
9. Files are in the correct `lib/features/` or `lib/core/widgets/` path
10. No XP or experience point references

Output: list each violation with file path + line number, or confirm "All checks passed" if clean.

Usage: `/review` (reviews current file) or `/review <file path>`
Example: `/review lib/features/home/home_screen.dart`
