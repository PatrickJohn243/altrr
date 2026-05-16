import '../../../core/phrase.dart';

class PhysicalExplore {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'Go for a run somewhere you\'ve never been before.',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'wanderer', 'warrior'],
      categories: ['physical'],
      nature: QuestNature.explore,
      shortTitle: 'Run Somewhere New',
    ),
    Phrase(
      text: 'Find a trail or path you\'ve never walked. Go.',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'wanderer', 'rogue'],
      categories: ['physical'],
      nature: QuestNature.explore,
      shortTitle: 'New Trail',
    ),
    Phrase(
      text: 'Take your workout somewhere new. Change the environment entirely.',
      slot: PhraseSlot.action,
      affinityTags: ['warrior', 'explorer', 'trickster'],
      categories: ['physical'],
      nature: QuestNature.explore,
      shortTitle: 'New Environment',
    ),
    Phrase(
      text: 'Walk into a part of your city you always pass but never enter.',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'reflective', 'wanderer'],
      categories: ['physical'],
      nature: QuestNature.explore,
      shortTitle: 'Unexplored Block',
    ),
    Phrase(
      text: 'Take a bike route you\'ve never tried before.',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'wanderer', 'playful'],
      categories: ['physical'],
      nature: QuestNature.explore,
      shortTitle: 'New Bike Route',
      requires: 'bike',
    ),
    Phrase(
      text: 'Find an outdoor space to exercise that you\'ve never used.',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'warrior', 'rogue'],
      categories: ['physical'],
      nature: QuestNature.explore,
      shortTitle: 'New Outdoor Spot',
      requires: 'outdoor_space',
    ),
    Phrase(
      text: 'Walk in one direction for 30 minutes. Then find your way back.',
      slot: PhraseSlot.action,
      affinityTags: ['wanderer', 'rogue', 'explorer', 'trickster'],
      categories: ['physical'],
      nature: QuestNature.explore,
      shortTitle: '30-Minute Direction',
    ),
  ];
}
