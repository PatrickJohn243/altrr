import '../../title_phrase.dart';

/// Early Bird — complete a quest before 6:00 AM.

class EarlyBirdPhrases {
  EarlyBirdPhrases._();

  static const List<TitlePhrase> all = [
    TitlePhrase(text: 'Early Bird',         slot: TitleSlot.titleText, condition: 'earlyBird'),
    TitlePhrase(text: 'Before Six',         slot: TitleSlot.titleText, condition: 'earlyBird'),
    TitlePhrase(text: 'First Light',        slot: TitleSlot.titleText, condition: 'earlyBird'),

    TitlePhrase(text: 'Before 6 AM.',              slot: TitleSlot.subtextA, condition: 'earlyBird'),
    TitlePhrase(text: 'Most people were asleep.',  slot: TitleSlot.subtextA, condition: 'earlyBird'),
    TitlePhrase(text: 'You started before the day did.', slot: TitleSlot.subtextA, condition: 'earlyBird'),

    TitlePhrase(text: 'The morning was yours.',   slot: TitleSlot.subtextB, condition: 'earlyBird'),
    TitlePhrase(text: "That's a head start.",     slot: TitleSlot.subtextB, condition: 'earlyBird'),
    TitlePhrase(text: 'The world catches up later.', slot: TitleSlot.subtextB, condition: 'earlyBird'),
  ];
}
