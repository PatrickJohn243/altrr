import '../../../title_phrase.dart';

class CookingTitles {
  CookingTitles._();

  static const List<TitlePhrase> all = [
    TitlePhrase(text: "A Cook's First Attempt", slot: TitleSlot.titleText, category: 'cooking', tier: 1),
    TitlePhrase(text: 'Something Worth Eating',  slot: TitleSlot.titleText, category: 'cooking', tier: 1),
    TitlePhrase(text: 'Into the Deep End',       slot: TitleSlot.titleText, category: 'cooking', tier: 1),

    TitlePhrase(text: 'Finding Your Flavour',    slot: TitleSlot.titleText, category: 'cooking', tier: 2),
    TitlePhrase(text: 'Something Worth Keeping', slot: TitleSlot.titleText, category: 'cooking', tier: 2),
    TitlePhrase(text: 'Controlled Chaos',        slot: TitleSlot.titleText, category: 'cooking', tier: 2),

    TitlePhrase(text: 'Become the Master',       slot: TitleSlot.titleText, category: 'cooking', tier: 3),
    TitlePhrase(text: 'A Quiet Ritual',          slot: TitleSlot.titleText, category: 'cooking', tier: 3),
    TitlePhrase(text: 'The Long Way Around',     slot: TitleSlot.titleText, category: 'cooking', tier: 3),
  ];
}
