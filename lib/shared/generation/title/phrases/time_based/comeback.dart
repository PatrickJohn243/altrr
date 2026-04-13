import '../../title_phrase.dart';

/// Comeback — complete a quest after a 7+ day gap of inactivity.

class ComebackPhrases {
  ComebackPhrases._();

  static const List<TitlePhrase> all = [
    TitlePhrase(text: 'The Return',         slot: TitleSlot.titleText, condition: 'comeback'),
    TitlePhrase(text: 'Still Here',         slot: TitleSlot.titleText, condition: 'comeback'),
    TitlePhrase(text: "You're Back",        slot: TitleSlot.titleText, condition: 'comeback'),

    TitlePhrase(text: 'You were gone for a while.',    slot: TitleSlot.subtextA, condition: 'comeback'),
    TitlePhrase(text: "It had been over a week.",      slot: TitleSlot.subtextA, condition: 'comeback'),
    TitlePhrase(text: "A lot of people don't come back.", slot: TitleSlot.subtextA, condition: 'comeback'),

    TitlePhrase(text: 'But you came back anyway.',        slot: TitleSlot.subtextB, condition: 'comeback'),
    TitlePhrase(text: 'That takes something.',            slot: TitleSlot.subtextB, condition: 'comeback'),
    TitlePhrase(text: "Starting over is still starting.", slot: TitleSlot.subtextB, condition: 'comeback'),
  ];
}
