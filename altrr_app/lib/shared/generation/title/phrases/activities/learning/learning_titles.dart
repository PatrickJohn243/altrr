import '../../../title_phrase.dart';

class LearningTitles {
  LearningTitles._();

  static const List<TitlePhrase> all = [
    TitlePhrase(text: "Something You Didn't Know Yesterday", slot: TitleSlot.titleText, category: 'learning', tier: 1),
    TitlePhrase(text: 'A Good Place to Start',               slot: TitleSlot.titleText, category: 'learning', tier: 1),
    TitlePhrase(text: 'Willing to Be Wrong',                 slot: TitleSlot.titleText, category: 'learning', tier: 1),

    TitlePhrase(text: 'The More You Know',                   slot: TitleSlot.titleText, category: 'learning', tier: 2),
    TitlePhrase(text: 'Going Deeper Than Required',          slot: TitleSlot.titleText, category: 'learning', tier: 2),
    TitlePhrase(text: 'You Kept Asking Questions',           slot: TitleSlot.titleText, category: 'learning', tier: 2),

    TitlePhrase(text: 'Nothing to Teach You Anymore',        slot: TitleSlot.titleText, category: 'learning', tier: 3),
    TitlePhrase(text: 'A Lifelong Student',                  slot: TitleSlot.titleText, category: 'learning', tier: 3),
    TitlePhrase(text: 'You Became the Resource',             slot: TitleSlot.titleText, category: 'learning', tier: 3),
  ];
}
