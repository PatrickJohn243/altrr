import '../../title_phrase.dart';

/// Night Owl — complete a quest after midnight (12:00 AM – 3:59 AM).

class NightOwlPhrases {
  NightOwlPhrases._();

  static const List<TitlePhrase> all = [
    TitlePhrase(text: 'Night Owl',          slot: TitleSlot.titleText, condition: 'nightOwl'),
    TitlePhrase(text: 'Past Midnight',      slot: TitleSlot.titleText, condition: 'nightOwl'),
    TitlePhrase(text: 'After Hours',        slot: TitleSlot.titleText, condition: 'nightOwl'),

    TitlePhrase(text: 'Past midnight.',              slot: TitleSlot.subtextA, condition: 'nightOwl'),
    TitlePhrase(text: 'Everyone else logged off.',   slot: TitleSlot.subtextA, condition: 'nightOwl'),
    TitlePhrase(text: 'You were still going.',       slot: TitleSlot.subtextA, condition: 'nightOwl'),

    TitlePhrase(text: "That's dedication. Or insomnia. We won't ask.", slot: TitleSlot.subtextB, condition: 'nightOwl'),
    TitlePhrase(text: 'The quiet hours belong to you.',                slot: TitleSlot.subtextB, condition: 'nightOwl'),
    TitlePhrase(text: "Nobody saw it. You'll remember.",               slot: TitleSlot.subtextB, condition: 'nightOwl'),
  ];
}
