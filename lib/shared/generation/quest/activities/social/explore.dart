import '../../../core/phrase.dart';

class SocialExplore {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'Start a conversation with a complete stranger today.',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'rogue', 'trickster', 'playful'],
      categories: ['social'],
      nature: QuestNature.explore,
      shortTitle: 'Talk to a Stranger',
    ),
    Phrase(
      text: 'Go to a social event or gathering you\'ve never attended before.',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'wanderer', 'socialFocus'],
      categories: ['social'],
      nature: QuestNature.explore,
      shortTitle: 'New Gathering',
    ),
    Phrase(
      text: 'Find a community doing something you\'re curious about. Show up.',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'rogue', 'wanderer'],
      categories: ['social'],
      nature: QuestNature.explore,
      shortTitle: 'Find a Community',
    ),
    Phrase(
      text: 'Strike up a conversation with someone you see often but don\'t know.',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'trickster', 'playful', 'rogue'],
      categories: ['social'],
      nature: QuestNature.explore,
      shortTitle: 'Meet Your Regular',
    ),
    Phrase(
      text: 'Introduce yourself to a neighbor you\'ve never spoken to.',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'caretaker', 'explorer'],
      categories: ['social'],
      nature: QuestNature.explore,
      shortTitle: 'Meet a Neighbor',
    ),
    Phrase(
      text: 'Go somewhere new and make at least one genuine connection.',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'wanderer', 'socialFocus'],
      categories: ['social'],
      nature: QuestNature.explore,
      shortTitle: 'New Place, New Face',
    ),
    Phrase(
      text: 'Accept an invitation you\'d normally decline.',
      slot: PhraseSlot.action,
      affinityTags: ['rogue', 'trickster', 'explorer', 'warm'],
      categories: ['social'],
      nature: QuestNature.explore,
      shortTitle: 'Say Yes',
    ),
  ];
}
