import '../../../core/phrase.dart';

class CookingExplore {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'Cook something from a cuisine you\'ve never tried before.',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'wanderer', 'playful'],
      categories: ['cooking'],
      nature: QuestNature.explore,
      shortTitle: 'New Cuisine',
    ),
    Phrase(
      text: 'Go to a food spot you\'ve never been to. Eat something unfamiliar.',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'wanderer', 'rogue'],
      categories: ['cooking'],
      nature: QuestNature.explore,
      shortTitle: 'New Food Spot',
    ),
    Phrase(
      text: 'Go to a store you\'ve never been to. Buy one ingredient you don\'t recognize. Use it.',
      slot: PhraseSlot.action,
      affinityTags: ['trickster', 'explorer', 'rogue'],
      categories: ['cooking'],
      nature: QuestNature.explore,
      shortTitle: 'Mystery Ingredient',
    ),
    Phrase(
      text: 'Find a local market you\'ve never visited. Buy ingredients. Cook them.',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'wanderer', 'warm'],
      categories: ['cooking'],
      nature: QuestNature.explore,
      shortTitle: 'Market Trip',
    ),
    Phrase(
      text: 'Order something at a restaurant you\'d normally skip. Eat the whole thing.',
      slot: PhraseSlot.action,
      affinityTags: ['trickster', 'rogue', 'explorer'],
      categories: ['cooking'],
      nature: QuestNature.explore,
      shortTitle: 'Unexpected Order',
    ),
    Phrase(
      text: 'Find a recipe in a language you don\'t speak. Cook it anyway.',
      slot: PhraseSlot.action,
      affinityTags: ['trickster', 'rogue', 'playful'],
      categories: ['cooking'],
      nature: QuestNature.explore,
      shortTitle: 'Foreign Recipe',
    ),
  ];
}
