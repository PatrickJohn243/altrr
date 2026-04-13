import '../../title_phrase.dart';

/// Quick Draw — complete a quest within 4 hours of it being assigned.

class QuickDrawPhrases {
  QuickDrawPhrases._();

  static const List<TitlePhrase> all = [
    TitlePhrase(text: 'Quick Draw',            slot: TitleSlot.titleText, condition: 'quickDraw'),
    TitlePhrase(text: 'Four-Hour Window',      slot: TitleSlot.titleText, condition: 'quickDraw'),
    TitlePhrase(text: 'No Delay',             slot: TitleSlot.titleText, condition: 'quickDraw'),

    TitlePhrase(text: 'You saw it and moved.', slot: TitleSlot.subtextA, condition: 'quickDraw'),
    TitlePhrase(text: 'Four hours.',           slot: TitleSlot.subtextA, condition: 'quickDraw'),
    TitlePhrase(text: "You didn't wait.",      slot: TitleSlot.subtextA, condition: 'quickDraw'),

    TitlePhrase(text: 'Most people wait until tomorrow.', slot: TitleSlot.subtextB, condition: 'quickDraw'),
    TitlePhrase(text: 'Done.',                            slot: TitleSlot.subtextB, condition: 'quickDraw'),
    TitlePhrase(text: "That's the whole move.",           slot: TitleSlot.subtextB, condition: 'quickDraw'),
  ];
}
