import '../../title_phrase.dart';

/// Speed Milestone — earn 2 titles within a 10-day window.

class SpeedMilestonePhrases {
  SpeedMilestonePhrases._();

  static const List<TitlePhrase> all = [
    TitlePhrase(text: 'Double Drop',        slot: TitleSlot.titleText, condition: 'speedMilestone'),
    TitlePhrase(text: 'Ten Days, Two Titles', slot: TitleSlot.titleText, condition: 'speedMilestone'),
    TitlePhrase(text: 'Fast Track',         slot: TitleSlot.titleText, condition: 'speedMilestone'),

    TitlePhrase(text: 'Two titles in ten days.',         slot: TitleSlot.subtextA, condition: 'speedMilestone'),
    TitlePhrase(text: 'You stacked milestones quickly.', slot: TitleSlot.subtextA, condition: 'speedMilestone'),
    TitlePhrase(text: 'The system barely kept up.',      slot: TitleSlot.subtextA, condition: 'speedMilestone'),

    TitlePhrase(text: "That's not supposed to happen this fast.", slot: TitleSlot.subtextB, condition: 'speedMilestone'),
    TitlePhrase(text: "We're taking notes.",                      slot: TitleSlot.subtextB, condition: 'speedMilestone'),
    TitlePhrase(text: 'At this rate — what comes next?',          slot: TitleSlot.subtextB, condition: 'speedMilestone'),
  ];
}
