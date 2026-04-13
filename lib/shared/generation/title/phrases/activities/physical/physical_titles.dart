import '../../../title_phrase.dart';

class PhysicalTitles {
  PhysicalTitles._();

  static const List<TitlePhrase> all = [
    TitlePhrase(text: 'The First Step Out',      slot: TitleSlot.titleText, category: 'physical', tier: 1),
    TitlePhrase(text: 'Something Aches',         slot: TitleSlot.titleText, category: 'physical', tier: 1),
    TitlePhrase(text: "You Didn't Stop",         slot: TitleSlot.titleText, category: 'physical', tier: 1),

    TitlePhrase(text: 'A Body That Shows Up',    slot: TitleSlot.titleText, category: 'physical', tier: 2),
    TitlePhrase(text: 'Finding the Pace',        slot: TitleSlot.titleText, category: 'physical', tier: 2),
    TitlePhrase(text: 'Past the Breaking Point', slot: TitleSlot.titleText, category: 'physical', tier: 2),

    TitlePhrase(text: 'The Long Game',           slot: TitleSlot.titleText, category: 'physical', tier: 3),
    TitlePhrase(text: 'Built Over Time',         slot: TitleSlot.titleText, category: 'physical', tier: 3),
    TitlePhrase(text: 'Nothing Left to Prove',   slot: TitleSlot.titleText, category: 'physical', tier: 3),
  ];
}
