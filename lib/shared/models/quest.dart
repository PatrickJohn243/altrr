import 'package:isar/isar.dart';

part 'quest.g.dart';

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
}

enum QuestStatus {
  /// Quest is live and awaiting action.
  active,

  /// User completed the quest before it expired.
  completed,

  /// User skipped the quest (tracked in stats).
  skipped,
}
