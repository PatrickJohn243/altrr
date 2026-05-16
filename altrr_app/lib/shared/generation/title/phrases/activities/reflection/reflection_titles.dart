import '../../../title_phrase.dart';

class ReflectionTitles {
  ReflectionTitles._();

  static const List<TitlePhrase> all = [
    TitlePhrase(text: 'You Paid Attention',                    slot: TitleSlot.titleText, category: 'reflection', tier: 1),
    TitlePhrase(text: 'A Quiet Moment',                        slot: TitleSlot.titleText, category: 'reflection', tier: 1),
    TitlePhrase(text: 'You Were Honest With Yourself',         slot: TitleSlot.titleText, category: 'reflection', tier: 1),

    TitlePhrase(text: 'Getting Comfortable With Silence',      slot: TitleSlot.titleText, category: 'reflection', tier: 2),
    TitlePhrase(text: 'The Uncomfortable Kind of Honest',      slot: TitleSlot.titleText, category: 'reflection', tier: 2),
    TitlePhrase(text: 'You Started Looking Inward',            slot: TitleSlot.titleText, category: 'reflection', tier: 2),

    TitlePhrase(text: 'Nothing Left to Avoid',                 slot: TitleSlot.titleText, category: 'reflection', tier: 3),
    TitlePhrase(text: 'You Know Yourself',                     slot: TitleSlot.titleText, category: 'reflection', tier: 3),
    TitlePhrase(text: "The Deepest You've Gone",               slot: TitleSlot.titleText, category: 'reflection', tier: 3),
  ];
}
