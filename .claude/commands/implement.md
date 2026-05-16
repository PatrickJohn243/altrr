Implement a Figma screen or component for the Altrr Flutter app.

Steps:
1. Call `get_design_context` with the provided Figma node ID and file key `btObw9UUwv7wZxKJwld49Q`
2. Read `CLAUDE.md` at the project root for design system rules
3. Convert the Figma reference code to Flutter using the figma-to-flutter agent rules:
   - Map all colors to `AppColors.*`
   - Map all text styles to `AppTypography.*`
   - Map all spacing/radii to `AppSpacing.*` / `AppRadius.*`
   - Use the card border pattern for dark cards
4. Place the file in the correct `lib/features/` or `lib/core/widgets/` path
5. Verify visually against the screenshot

Usage: `/implement <node-id> [component name]`
Example: `/implement 1:53 home screen`
