import '../../../title_phrase.dart';

class MentalTitles {
  MentalTitles._();

  static const List<TitlePhrase> all = [
    TitlePhrase(text: 'A Question Worth Asking',     slot: TitleSlot.titleText, category: 'mental', tier: 1),
    TitlePhrase(text: 'Sitting With Something Hard', slot: TitleSlot.titleText, category: 'mental', tier: 1),
    TitlePhrase(text: 'In Over Your Head',           slot: TitleSlot.titleText, category: 'mental', tier: 1),

    TitlePhrase(text: 'Getting the Shape of It',     slot: TitleSlot.titleText, category: 'mental', tier: 2),
    TitlePhrase(text: 'The More You Know',           slot: TitleSlot.titleText, category: 'mental', tier: 2),
    TitlePhrase(text: 'Going Deeper Than Asked',     slot: TitleSlot.titleText, category: 'mental', tier: 2),

    TitlePhrase(text: 'Nowhere Left to Hide',        slot: TitleSlot.titleText, category: 'mental', tier: 3),
    TitlePhrase(text: 'A Lifelong Habit',            slot: TitleSlot.titleText, category: 'mental', tier: 3),
    TitlePhrase(text: 'Someone Who Knows',           slot: TitleSlot.titleText, category: 'mental', tier: 3),
  ];
}
