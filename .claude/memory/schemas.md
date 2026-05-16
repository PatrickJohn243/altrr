---
name: Isar DB Schemas
description: Quest and Character Isar collection schemas in lib/shared/models/
type: project
---

Both files are in `lib/shared/models/`. Run `dart run build_runner build` to generate `.g.dart` files.

## Quest (`quest.dart`)

| Field | Type | Notes |
|---|---|---|
| id | Id | autoIncrement |
| title | String | — |
| description | String | — |
| category | String | indexed — Food, Gym, Travel, People, etc. |
| hint | String? | optional contextual hint |
| status | QuestStatus | enum: active, completed, skipped |
| assignedByAltrr | bool | false = side quest |
| assignedAt | DateTime | indexed |
| expiresAt | DateTime | — |
| completedAt | DateTime? | set on completion |
| skippedAt | DateTime? | set on skip |

## Character (`character.dart`)

Characters are procedural quest givers — their traits determine tone, domain, and quest style.

| Field | Type | Notes |
|---|---|---|
| id | Id | autoIncrement |
| name | String | display name |
| epithet | String | e.g. "The Hollow Sage" |
| archetype | CharacterArchetype | mentor/trickster/sage/warrior/explorer/scholar/caretaker/rogue |
| tone | CharacterTone | stoic/warm/cryptic/blunt/poetic/playful/solemn |
| intensity | CharacterIntensity | gentle/moderate/demanding/ruthless |
| verbosity | CharacterVerbosity | brief/moderate/elaborate |
| voice | CharacterVoice | firstPerson/secondPerson/narrator/riddle |
| rarity | CharacterRarity | common/uncommon/rare/legendary |
| domains | List\<String\> | quest categories this character assigns |
| domainWeights | List\<double\> | 0.0–1.0 per domain, parallel to domains |
| traitTags | List\<String\> | CharacterTrait enum names as strings |
| generationSeed | int | same seed = same character always |
| isActive | bool | — |
| unlockedAt | DateTime | indexed |

### CharacterTrait enum tags
Timing: nightOwl, earlyRiser
Category bias: socialFocus, solitary, physical, culinary, wanderer
Framing: philosophical, competitive, reflective
Frequency: minimal, prolific

## pubspec.yaml additions made
```yaml
dependencies:
  isar: ^3.1.0+1
  isar_flutter_libs: ^3.1.0+1
  path_provider: ^2.1.4

dev_dependencies:
  isar_generator: ^3.1.0+1
  build_runner: ^2.4.9
```
