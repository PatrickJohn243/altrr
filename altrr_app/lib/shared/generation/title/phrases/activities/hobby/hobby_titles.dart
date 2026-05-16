import '../../../title_phrase.dart';

class HobbyTitles {
  HobbyTitles._();

  static const List<TitlePhrase> all = [
    TitlePhrase(text: 'Just Trying It Out',               slot: TitleSlot.titleText, category: 'hobby', tier: 1),
    TitlePhrase(text: 'Something to Do With Your Hands',  slot: TitleSlot.titleText, category: 'hobby', tier: 1),
    TitlePhrase(text: 'You Made Time for It',             slot: TitleSlot.titleText, category: 'hobby', tier: 1),

    TitlePhrase(text: 'You Keep Coming Back',             slot: TitleSlot.titleText, category: 'hobby', tier: 2),
    TitlePhrase(text: 'Getting Good at This',             slot: TitleSlot.titleText, category: 'hobby', tier: 2),
    TitlePhrase(text: 'It Stopped Being New',             slot: TitleSlot.titleText, category: 'hobby', tier: 2),

    TitlePhrase(text: 'Part of Who You Are',              slot: TitleSlot.titleText, category: 'hobby', tier: 3),
    TitlePhrase(text: 'This Is Just What You Do',         slot: TitleSlot.titleText, category: 'hobby', tier: 3),
    TitlePhrase(text: "You Don't Need a Reason Anymore",  slot: TitleSlot.titleText, category: 'hobby', tier: 3),
  ];
}
