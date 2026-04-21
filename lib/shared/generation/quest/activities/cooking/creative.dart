import '../../../core/phrase.dart';

class CookingCreative {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'Open your fridge. Make something using only what\'s already there.',
      slot: PhraseSlot.action,
      affinityTags: ['trickster', 'rogue', 'playful'],
      categories: ['cooking'],
      nature: QuestNature.creative,
      shortTitle: 'Fridge Raid',
    ),
    Phrase(
      text: 'Pick a random ingredient and build a full meal around it.',
      slot: PhraseSlot.action,
      affinityTags: ['trickster', 'explorer', 'playful'],
      categories: ['cooking'],
      nature: QuestNature.creative,
      shortTitle: 'Ingredient Challenge',
      requires: 'ingredients',
    ),
    Phrase(
      text: 'Cook without a recipe. Trust your instincts.',
      slot: PhraseSlot.action,
      affinityTags: ['rogue', 'warrior', 'blunt'],
      categories: ['cooking'],
      nature: QuestNature.creative,
      shortTitle: 'No Recipe',
    ),
    Phrase(
      text: 'Change one ingredient from how you\'d normally make it. See what happens.',
      slot: PhraseSlot.action,
      affinityTags: ['trickster', 'scholar', 'moderate'],
      categories: ['cooking'],
      nature: QuestNature.creative,
      shortTitle: 'Ingredient Swap',
    ),
    Phrase(
      text: 'Invent a dish name first. Then cook whatever it suggests.',
      slot: PhraseSlot.action,
      affinityTags: ['trickster', 'playful', 'rogue'],
      categories: ['cooking'],
      nature: QuestNature.creative,
      shortTitle: 'Name It First',
    ),
    Phrase(
      text: 'Take a dish you know and add one thing that shouldn\'t work.',
      slot: PhraseSlot.action,
      affinityTags: ['trickster', 'rogue', 'explorer'],
      categories: ['cooking'],
      nature: QuestNature.creative,
      shortTitle: 'Twist a Classic',
    ),
    Phrase(
      text: 'Bake something from scratch. No shortcuts.',
      slot: PhraseSlot.action,
      affinityTags: ['caretaker', 'moderate', 'warm'],
      categories: ['cooking'],
      nature: QuestNature.creative,
      shortTitle: 'Bake Something',
    ),
  ];
}
