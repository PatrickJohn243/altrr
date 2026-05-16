import '../../../core/phrase.dart';

class HobbyExplore {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'Try a hobby you\'ve never done before. Just try it.',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'trickster', 'rogue'],
      categories: ['hobby'],
      nature: QuestNature.explore,
      shortTitle: 'New Hobby',
    ),
    Phrase(
      text: 'Find a class, group, or workshop for something you\'re curious about. Go.',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'wanderer', 'socialFocus'],
      categories: ['hobby'],
      nature: QuestNature.explore,
      shortTitle: 'Join a Workshop',
    ),
    Phrase(
      text: 'Walk into a shop or space dedicated to a hobby you know nothing about.',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'wanderer', 'scholar'],
      categories: ['hobby'],
      nature: QuestNature.explore,
      shortTitle: 'Explore a Hobby Space',
    ),
    Phrase(
      text: 'Watch someone skilled at something you\'ve never tried. Pay attention.',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'explorer', 'reflective'],
      categories: ['hobby'],
      nature: QuestNature.explore,
      shortTitle: 'Watch a Master',
    ),
    Phrase(
      text: 'Take your hobby to a new location. See how it feels different.',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'wanderer', 'trickster'],
      categories: ['hobby'],
      nature: QuestNature.explore,
      shortTitle: 'New Setting, Same Hobby',
    ),
    Phrase(
      text: 'Find a community around something you enjoy. Observe or participate.',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'socialFocus', 'wanderer'],
      categories: ['hobby'],
      nature: QuestNature.explore,
      shortTitle: 'Find the Community',
    ),
  ];
}
