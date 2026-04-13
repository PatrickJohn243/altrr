import '../../title_phrase.dart';

/// Clean Run — complete 10 quests in a row without skipping any.

class CleanRunPhrases {
  CleanRunPhrases._();

  static const List<TitlePhrase> all = [
    TitlePhrase(text: 'Clean Slate',        slot: TitleSlot.titleText, condition: 'cleanRun'),
    TitlePhrase(text: 'No Skips',           slot: TitleSlot.titleText, condition: 'cleanRun'),
    TitlePhrase(text: 'Perfect Record',     slot: TitleSlot.titleText, condition: 'cleanRun'),

    TitlePhrase(text: 'Ten quests. Zero skipped.',    slot: TitleSlot.subtextA, condition: 'cleanRun'),
    TitlePhrase(text: 'Not one was passed over.',     slot: TitleSlot.subtextA, condition: 'cleanRun'),
    TitlePhrase(text: 'You took everything they gave you.', slot: TitleSlot.subtextA, condition: 'cleanRun'),

    TitlePhrase(text: "That's discipline.",           slot: TitleSlot.subtextB, condition: 'cleanRun'),
    TitlePhrase(text: 'No excuses made.',             slot: TitleSlot.subtextB, condition: 'cleanRun'),
    TitlePhrase(text: 'The record speaks for itself.', slot: TitleSlot.subtextB, condition: 'cleanRun'),
  ];
}
