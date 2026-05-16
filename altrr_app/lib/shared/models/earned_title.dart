import 'package:isar/isar.dart';

part 'earned_title.g.dart';

@collection
class EarnedTitle {
  Id id = Isar.autoIncrement;

  /// The display title text — e.g. "A Cook's First Attempt" or "Error 404".
  late String titleText;

  /// First subtext fragment (observation). Null for gacha titles.
  String? subtextA;

  /// Second subtext fragment (payoff). Null for gacha titles.
  String? subtextB;

  /// Fixed subtext for gacha titles. Null for factored titles.
  String? gachaSubtext;

  /// Category this title is associated with.
  /// Null for gacha titles (they're category-agnostic).
  String? category;

  /// Tier level (1, 2, or 3). Null for time-based and gacha titles.
  int? tier;

  /// What triggered this title.
  @Enumerated(EnumType.name)
  late TitleCondition condition;

  /// For time-based titles: the exact condition key that triggered this award
  /// (e.g. 'quickDraw', 'weekStreak'). Null for quest-count and gacha titles.
  ///
  /// Stored directly so de-duplication never needs to reverse-map through the
  /// phrase pool — the check is always: conditionTag == 'quickDraw'.
  String? conditionTag;

  /// Type of title — factored or gacha.
  @Enumerated(EnumType.name)
  late TitleType titleType;

  /// When this title was earned.
  @Index()
  late DateTime earnedAt;

  /// False until the user sees it — drives the NEW badge.
  late bool isSeen;
}

enum TitleType {
  /// Earned through measurable conditions (quest count, time-based).
  factored,

  /// Random 1% drop on quest completion.
  gacha,
}

enum TitleCondition {
  /// Earned by completing a set number of quests in a category.
  questCount,

  /// Earned by completing quests within specific time windows.
  timeBased,

  /// Random chaos drop — 1% chance on every quest completion.
  gacha,
}
