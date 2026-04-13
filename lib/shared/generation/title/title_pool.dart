import 'title_phrase.dart';
import 'phrases/subtext_a.dart';
import 'phrases/subtext_b.dart';
import 'phrases/activities/cooking/cooking_titles.dart';
import 'phrases/activities/hobby/hobby_titles.dart';
import 'phrases/activities/learning/learning_titles.dart';
import 'phrases/activities/mental/mental_titles.dart';
import 'phrases/activities/physical/physical_titles.dart';
import 'phrases/activities/reflection/reflection_titles.dart';
import 'phrases/activities/social/social_titles.dart';
import 'phrases/activities/explore/explore_titles.dart';
import 'phrases/time_based/quick_draw.dart';
import 'phrases/time_based/week_streak.dart';
import 'phrases/time_based/month_streak.dart';
import 'phrases/time_based/daily_burst.dart';
import 'phrases/time_based/clean_run.dart';
import 'phrases/time_based/comeback.dart';
import 'phrases/time_based/early_bird.dart';
import 'phrases/time_based/night_owl.dart';
import 'phrases/time_based/speed_milestone.dart';

/// Aggregates all title phrase pools into a single flat list.
///
/// Use [TitlePool.all] to access every phrase across every category,
/// tier, condition, and slot.
///
/// Use the filtering helpers to narrow the list before picking:
///   - [forCategory] — phrases matching a category (+ universal null-category)
///   - [forTier]     — phrases matching a tier (+ universal null-tier)
///   - [forCondition] — phrases matching a time-based condition
///   - [forSlot]     — phrases for a specific slot (titleText / subtextA / subtextB)
class TitlePool {
  TitlePool._();

  static const List<TitlePhrase> all = [
    // ── Activity categories ──────────────────────────────────────────────────
    ...CookingTitles.all,
    ...HobbyTitles.all,
    ...LearningTitles.all,
    ...MentalTitles.all,
    ...PhysicalTitles.all,
    ...ReflectionTitles.all,
    ...SocialTitles.all,
    ...ExploreTitles.all,

    // ── Universal subtext ────────────────────────────────────────────────────
    ...SubtextA.all,
    ...SubtextB.all,

    // ── Time-based ───────────────────────────────────────────────────────────
    ...QuickDrawPhrases.all,
    ...WeekStreakPhrases.all,
    ...MonthStreakPhrases.all,
    ...DailyBurstPhrases.all,
    ...CleanRunPhrases.all,
    ...ComebackPhrases.all,
    ...EarlyBirdPhrases.all,
    ...NightOwlPhrases.all,
    ...SpeedMilestonePhrases.all,
  ];

  // ── Filtering helpers ──────────────────────────────────────────────────────

  /// All phrases that match [category] or have no category tag (universal).
  static List<TitlePhrase> forCategory(String category) =>
      all.where((p) => p.category == null || p.category == category).toList();

  /// All phrases that match [tier] or have no tier tag (universal).
  static List<TitlePhrase> forTier(int tier) =>
      all.where((p) => p.tier == null || p.tier == tier).toList();

  /// All phrases tagged with the given time-based [condition].
  static List<TitlePhrase> forCondition(String condition) =>
      all.where((p) => p.condition == condition).toList();

  /// All phrases for a given [slot].
  static List<TitlePhrase> forSlot(TitleSlot slot) =>
      all.where((p) => p.slot == slot).toList();
}
