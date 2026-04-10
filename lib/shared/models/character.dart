import 'package:isar/isar.dart';

part 'character.g.dart';

// ── Collection ────────────────────────────────────────────────────────────────

/// A procedurally generated quest giver.
///
/// Every field is deterministically derived from [generationSeed] using the
/// [CharacterGenerator] utility — the same seed always produces the same
/// character. Controllers read these fields to decide which quests to assign,
/// how to word them, and how frequently to assign them.
@collection
class Character {
  Id id = Isar.autoIncrement;

  // ── Identity ──────────────────────────────────────────────────────────────

  /// Display name, e.g. "Maren".
  late String name;

  /// Short title shown under the name, e.g. "The Hollow Sage".
  late String epithet;

  // ── Core procedural traits ────────────────────────────────────────────────

  /// Role archetype — defines the *type* of challenges this character assigns.
  @Enumerated(EnumType.name)
  late CharacterArchetype archetype;

  /// Communication tone — defines the *feel* of quest copy.
  @Enumerated(EnumType.name)
  late CharacterTone tone;

  /// Effort level — controls how demanding quests are.
  @Enumerated(EnumType.name)
  late CharacterIntensity intensity;

  /// How much context the character provides in quest descriptions.
  @Enumerated(EnumType.name)
  late CharacterVerbosity verbosity;

  /// Grammatical voice used when writing quest copy.
  @Enumerated(EnumType.name)
  late CharacterVoice voice;

  /// How rare this character is — affects unlock probability.
  @Enumerated(EnumType.name)
  late CharacterRarity rarity;

  // ── Domain affinity ───────────────────────────────────────────────────────

  /// Quest categories this character can assign, e.g. ["Food", "Travel"].
  /// Parallel to [domainWeights] — same length, same order.
  late List<String> domains;

  /// Probability weight per domain (0.0–1.0).
  /// e.g. [0.8, 0.4] means Food 80 %, Travel 40 % pick chance.
  /// Parallel to [domains].
  late List<double> domainWeights;

  // ── Personality modifier tags ─────────────────────────────────────────────

  /// Additional behavior modifiers stored as enum name strings.
  /// Parsed back to [CharacterTrait] values by the controller.
  /// e.g. ["nightOwl", "philosophical", "competitive"]
  late List<String> traitTags;

  // ── Procedural generation ─────────────────────────────────────────────────

  /// Source seed used to derive all trait values.
  /// Reproducible: same seed → same character, always.
  late int generationSeed;

  // ── State ─────────────────────────────────────────────────────────────────

  /// Whether this character is available to assign quests right now.
  late bool isActive;

  /// When this character was first unlocked for the user.
  @Index()
  late DateTime unlockedAt;
}

// ── Enums ─────────────────────────────────────────────────────────────────────

/// Defines the role this character plays — shapes the *category* and
/// *nature* of quests they assign.
enum CharacterArchetype {
  /// Guides and teaches. Assigns quests that build skill or habit.
  mentor,

  /// Challenges assumptions. Assigns quests that break comfort zones.
  trickster,

  /// Philosophical, wisdom-oriented. Assigns reflective quests.
  sage,

  /// Discipline and physical focus. Assigns effort-heavy quests.
  warrior,

  /// Curiosity and discovery. Assigns quests in new environments.
  explorer,

  /// Observation and knowledge. Assigns quests requiring attention.
  scholar,

  /// Warmth and relationships. Assigns People-heavy social quests.
  caretaker,

  /// Risk and improvisation. Assigns spontaneous, unplanned quests.
  rogue,
}

/// Defines the *emotional register* of quest copy — how it sounds when read.
enum CharacterTone {
  /// Cold, matter-of-fact. No encouragement, just instruction.
  stoic,

  /// Encouraging and friendly. Feels like a supportive coach.
  warm,

  /// Mysterious and indirect. Leaves meaning open to interpretation.
  cryptic,

  /// Direct, zero fluff. Gets to the point immediately.
  blunt,

  /// Metaphorical and lyrical. Quest copy reads like prose.
  poetic,

  /// Light and humorous. Quests feel fun rather than serious.
  playful,

  /// Grave and serious. Every quest feels significant.
  solemn,
}

/// Controls how difficult and effortful assigned quests feel.
enum CharacterIntensity {
  /// Low-effort, accessible quests. Good for streaks.
  gentle,

  /// Average effort. Default for most characters.
  moderate,

  /// High effort. Requires commitment to complete.
  demanding,

  /// Extreme. No compromises, no shortcuts.
  ruthless,
}

/// Controls how much description surrounds a quest.
enum CharacterVerbosity {
  /// One-liners. The quest title is almost the full instruction.
  brief,

  /// One or two sentences. Enough context, not too much.
  moderate,

  /// Full paragraphs with backstory, context, and reasoning.
  elaborate,
}

/// Grammatical voice used in quest copy — defines the character's presence.
enum CharacterVoice {
  /// Direct address: "I want you to..."
  firstPerson,

  /// Command form: "You will go..."
  secondPerson,

  /// Detached narration: "The path demands..."
  narrator,

  /// Quest framed as a riddle or open challenge.
  riddle,
}

/// Controls how often and how easily this character appears.
enum CharacterRarity {
  /// Appears frequently. Seen in most sessions.
  common,

  /// Appears occasionally. Adds variety.
  uncommon,

  /// Rarely appears. Feels like an event when they do.
  rare,

  /// Near-mythic. Encountered once in many sessions.
  legendary,
}

/// Fine-grained personality modifiers that adjust quest selection and timing.
/// Controllers map these tags to behavioral rules.
enum CharacterTrait {
  // ── Timing biases ──────────────────────────────────────────────────────────
  /// Prefers assigning quests in the evening (after 18:00).
  nightOwl,

  /// Prefers assigning quests in the morning (before 10:00).
  earlyRiser,

  // ── Category biases ────────────────────────────────────────────────────────
  /// Increases weight toward People/social quests.
  socialFocus,

  /// Increases weight toward solo, independent quests.
  solitary,

  /// Increases weight toward Gym/physical quests.
  physical,

  /// Increases weight toward Food quests.
  culinary,

  /// Increases weight toward Travel/outdoor quests.
  wanderer,

  // ── Framing modifiers ──────────────────────────────────────────────────────
  /// Adds a philosophical or existential angle to quest copy.
  philosophical,

  /// Frames quests as personal competitions or records to beat.
  competitive,

  /// Prompts self-reflection — quest copy ends with a question.
  reflective,

  // ── Assignment frequency modifiers ────────────────────────────────────────
  /// Assigns fewer quests but each one carries more weight.
  minimal,

  /// Assigns quests more frequently than average.
  prolific,
}
