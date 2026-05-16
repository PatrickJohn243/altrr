---
name: Procedural Quest Generation Architecture
description: Template + word pool system for generating quest text without AI — agreed approach, not yet built
type: project
---

User confirmed they want this built. Not yet implemented as of session end.

**Why:** Altrr runs locally on-device. No Gemini, no Claude, no network calls for quest generation.

**How to apply:** When building the generator, follow this architecture exactly.

## Approach: Template + Trait-Driven Word Pools + Seeded Random

```
Character (seed + traits)
        ↓
QuestGenerator
  ├── picks a template structure  ← based on archetype + verbosity
  ├── selects words per slot      ← based on tone + intensity + traitTags
  ├── uses seeded Random          ← same seed = same quest always
  └── outputs a filled Quest
```

## Sentence template slots

```
[OPENER?]  [ACTION]  [OBJECT]  [CONTEXT?]  [CLOSING?]
```

Examples per character trait combo:
- warrior + blunt → "Do 50 pushups. No excuses."
- sage + poetic → "Walk somewhere unfamiliar. Let the city show you what you've been avoiding."
- trickster + cryptic → "Eat something you can't name. Let it change something small."
- caretaker + warm → "Cook a meal for someone else tonight. It doesn't have to be perfect."

## Seeding strategy
```dart
final rng = Random(character.generationSeed ^ dayOfYear);
```
XOR with dayOfYear → same character gives different quest each day, but always reproducible.

## Files to build (not yet created)
- `lib/shared/generation/quest_word_pool.dart` — all word/phrase data mapped to traits
- `lib/shared/generation/quest_template.dart` — template structures + slot filling logic
- `lib/shared/generation/quest_generator.dart` — takes Character → outputs Quest
