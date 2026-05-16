import 'package:isar/isar.dart';
import '../generation/core/phrase.dart';

part 'quest.g.dart';

enum QuestType {
  /// Default daily whim — expires in 24 hours.
  daily,

  /// Multi-step arc — steps unlock sequentially, spans 2-4 days.
  chain,

  /// Single commitment — flexible 1-7 day window.
  challenge,
}

@collection
class Quest {
  Id id = Isar.autoIncrement;

  /// Display title of the quest.
  late String title;

  /// Full description shown on the expanded quest card.
  late String description;

  /// Category tag — e.g. Food, People, Gym, Travel.
  @Index()
  late String category;

  /// Optional contextual hint shown on the quests screen.
  String? hint;

  /// Current lifecycle state of the quest.
  @Enumerated(EnumType.name)
  late QuestStatus status;

  /// Whether this is a daily whim, chain step, or challenge.
  @Enumerated(EnumType.name)
  QuestType questType = QuestType.daily;

  /// The kind of experience this quest demands.
  @Enumerated(EnumType.name)
  QuestNature questNature = QuestNature.action;

  /// Expiry window in hours. 24 for daily, 24-168 for challenge.
  int expiryDuration = 24;

  // ── Chain fields (null if not a chain quest) ───────────────────────────────

  /// Groups chain steps together. Shared across all steps in the arc.
  String? chainId;

  /// Which step this is in the arc (1-based).
  int? chainStep;

  /// Total number of steps in this chain arc.
  int? chainTotal;

  /// True when assigned by the Altrr system; false for side quests.
  late bool assignedByAltrr;

  /// When the quest was assigned to the user.
  @Index()
  late DateTime assignedAt;

  /// When the quest expires and can no longer be completed.
  late DateTime expiresAt;

  /// Set when the user marks the quest as complete.
  DateTime? completedAt;

  /// Set when the user explicitly skips the quest.
  DateTime? skippedAt;

  /// The Isar ID of the [Character] who assigned this quest.
  /// Null for manually created side quests.
  int? characterId;

  // ── Submission fields (set when user saves the submission screen) ──────────

  /// User's note on what they did.
  String? submissionNote;

  /// How long they spent (free text, e.g. "30 min").
  String? submissionTimeSpent;

  /// Where they did it (free text, e.g. "Home").
  String? submissionWhere;

  /// Difficulty index 0–4 (easy → hard). Null if not set.
  int? submissionDifficulty;

  /// Labels of selected emotions, e.g. ["Happy", "Proud"].
  List<String> submissionEmotions = [];

  /// Absolute path to the submitted photo. Null if no photo.
  String? submissionPhotoPath;
}

enum QuestStatus {
  /// Quest is live and awaiting action.
  active,

  /// User completed the quest before it expired.
  completed,

  /// User skipped the quest (tracked in stats).
  skipped,
}
