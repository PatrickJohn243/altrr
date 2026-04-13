import '../../title_phrase.dart';

/// Daily Burst — complete 3 or more quests in a single day.

class DailyBurstPhrases {
  DailyBurstPhrases._();

  static const List<TitlePhrase> all = [
    TitlePhrase(text: 'Triple Take',        slot: TitleSlot.titleText, condition: 'dailyBurst'),
    TitlePhrase(text: 'Full Day',           slot: TitleSlot.titleText, condition: 'dailyBurst'),
    TitlePhrase(text: 'Three in One',       slot: TitleSlot.titleText, condition: 'dailyBurst'),

    TitlePhrase(text: 'Three quests. One day.', slot: TitleSlot.subtextA, condition: 'dailyBurst'),
    TitlePhrase(text: 'You ran through it.',    slot: TitleSlot.subtextA, condition: 'dailyBurst'),
    TitlePhrase(text: 'You had a big day.',     slot: TitleSlot.subtextA, condition: 'dailyBurst'),

    TitlePhrase(text: "That doesn't happen often.",   slot: TitleSlot.subtextB, condition: 'dailyBurst'),
    TitlePhrase(text: 'Momentum looked like this.',   slot: TitleSlot.subtextB, condition: 'dailyBurst'),
    TitlePhrase(text: "Rest tomorrow. You've earned it.", slot: TitleSlot.subtextB, condition: 'dailyBurst'),
  ];
}
