import '../../title_phrase.dart';

/// Month Streak — 30 consecutive days with at least one completed quest.

class MonthStreakPhrases {
  MonthStreakPhrases._();

  static const List<TitlePhrase> all = [
    TitlePhrase(text: 'Thirty Days',        slot: TitleSlot.titleText, condition: 'monthStreak'),
    TitlePhrase(text: 'The Month',          slot: TitleSlot.titleText, condition: 'monthStreak'),
    TitlePhrase(text: 'Ironclad',           slot: TitleSlot.titleText, condition: 'monthStreak'),

    TitlePhrase(text: 'Thirty days.',                  slot: TitleSlot.subtextA, condition: 'monthStreak'),
    TitlePhrase(text: 'A month without a single gap.', slot: TitleSlot.subtextA, condition: 'monthStreak'),
    TitlePhrase(text: "You didn't miss.",              slot: TitleSlot.subtextA, condition: 'monthStreak'),

    TitlePhrase(text: 'That kind of consistency is rare.',      slot: TitleSlot.subtextB, condition: 'monthStreak'),
    TitlePhrase(text: 'The streak is a statement now.',         slot: TitleSlot.subtextB, condition: 'monthStreak'),
    TitlePhrase(text: 'Most people stopped in the first week.', slot: TitleSlot.subtextB, condition: 'monthStreak'),
  ];
}
