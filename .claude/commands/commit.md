Stage and commit changes for the Altrr Flutter project using conventional commit format.

Steps:
1. Run `git status` to see changed files
2. Run `git diff` to review what changed
3. Stage relevant files (never stage `.env`, secrets, or generated files like `*.g.dart` unless intentional)
4. Write a commit message following this format:
   - `feat:` new screen or feature
   - `fix:` bug or visual correction
   - `style:` design token / spacing / color fix (no logic change)
   - `refactor:` restructure without behavior change
   - `chore:` pubspec, assets, config changes
5. Commit with the message

Rules:
- Keep subject line under 72 characters
- Do not include "Co-Authored-By" lines unless asked
- Do not commit `pubspec.lock` changes alone — bundle with the feature that required them
- If multiple unrelated changes exist, ask which to stage first

Usage: `/commit` or `/commit "optional hint about what changed"`
