Scaffold a new Flutter widget for the Altrr app following project conventions.

Creates a new widget file in `altrr_app/lib/core/widgets/` (shared) or the appropriate feature folder.

Rules:
- Use `StatelessWidget` unless state is required
- Import `AppColors`, `AppTypography`, `AppSpacing` from `lib/core/theme/`
- Mark all non-dynamic values as `const`
- Follow the naming convention: PascalCase class, snake_case file
- Add a `// TODO: connect to data` comment wherever static placeholder data is used

Usage: `/widget <WidgetName> [description]`
Example: `/widget QuestDisplayCard the active quest card shown on the home screen`
