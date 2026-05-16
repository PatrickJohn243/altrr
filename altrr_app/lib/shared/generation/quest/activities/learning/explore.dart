import '../../../core/phrase.dart';

class LearningExplore {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'Walk into a library, bookshop, or museum. Learn something you didn\'t plan to.',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'explorer', 'wanderer'],
      categories: ['learning'],
      nature: QuestNature.explore,
      shortTitle: 'Unplanned Learning',
    ),
    Phrase(
      text: 'Find a documentary on a topic you know nothing about. Watch it.',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'explorer', 'playful'],
      categories: ['learning'],
      nature: QuestNature.explore,
      shortTitle: 'Unknown Documentary',
    ),
    Phrase(
      text: 'Pick a subject completely outside your usual interests. Spend time in it.',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'trickster', 'rogue'],
      categories: ['learning'],
      nature: QuestNature.explore,
      shortTitle: 'Foreign Subject',
    ),
    Phrase(
      text: 'Visit a museum, gallery, or exhibit you\'ve never been to.',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'explorer', 'wanderer', 'reflective'],
      categories: ['learning'],
      nature: QuestNature.explore,
      shortTitle: 'Museum Visit',
    ),
    Phrase(
      text: 'Attend a talk, seminar, or class you know nothing about going in.',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'explorer', 'mentor'],
      categories: ['learning'],
      nature: QuestNature.explore,
      shortTitle: 'Attend a Talk',
    ),
    Phrase(
      text: 'Browse a secondhand bookshop. Buy the first interesting thing you find.',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'trickster', 'wanderer', 'playful'],
      categories: ['learning'],
      nature: QuestNature.explore,
      shortTitle: 'Bookshop Find',
    ),
  ];
}
