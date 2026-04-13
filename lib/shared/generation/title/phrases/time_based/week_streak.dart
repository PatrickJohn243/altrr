import '../../title_phrase.dart';

/// Week Streak — 7 consecutive days with at least one completed quest.

class WeekStreakPhrases {
  WeekStreakPhrases._();

  static const List<TitlePhrase> all = [
    TitlePhrase(text: 'Seven Days',          slot: TitleSlot.titleText, condition: 'weekStreak'),
    TitlePhrase(text: 'Unbroken',            slot: TitleSlot.titleText, condition: 'weekStreak'),
    TitlePhrase(text: 'The Week',            slot: TitleSlot.titleText, condition: 'weekStreak'),

    TitlePhrase(text: 'Seven days straight.',          slot: TitleSlot.subtextA, condition: 'weekStreak'),
    TitlePhrase(text: 'Every day this week.',          slot: TitleSlot.subtextA, condition: 'weekStreak'),
    TitlePhrase(text: "You didn't miss a single day.", slot: TitleSlot.subtextA, condition: 'weekStreak'),

    TitlePhrase(text: 'The chain held.',              slot: TitleSlot.subtextB, condition: 'weekStreak'),
    TitlePhrase(text: "Don't break it now.",          slot: TitleSlot.subtextB, condition: 'weekStreak'),
    TitlePhrase(text: 'Most people skip the weekend.', slot: TitleSlot.subtextB, condition: 'weekStreak'),
  ];
}
