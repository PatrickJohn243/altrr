import '../../core/phrase.dart';

class CookingActions {
  static const List<Phrase> phrases = [
    // ── Actions ──────────────────────────────────────────────────────────────

    Phrase(
      text: 'Cook something you\'ve never made before',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'trickster', 'playful'],
      categories: ['cooking'],
      shortTitle: 'Try a New Dish',
    ),
    Phrase(
      text: 'Make a proper meal from scratch',
      slot: PhraseSlot.action,
      affinityTags: ['caretaker', 'moderate', 'warm'],
      categories: ['cooking'],
      shortTitle: 'Cook from Scratch',
    ),
    Phrase(
      text: 'Recreate something you ate somewhere',
      slot: PhraseSlot.action,
      affinityTags: ['reflective', 'explorer', 'scholar'],
      categories: ['cooking'],
      shortTitle: 'Recreate a Dish',
    ),
    Phrase(
      text: 'Pick a random ingredient and build something around it',
      slot: PhraseSlot.action,
      affinityTags: ['trickster', 'rogue', 'playful', 'explorer'],
      categories: ['cooking'],
      shortTitle: 'Ingredient Challenge',
    ),
    Phrase(
      text: 'Cook a meal and eat it slowly',
      slot: PhraseSlot.action,
      affinityTags: ['caretaker', 'gentle', 'warm', 'solemn'],
      categories: ['cooking'],
      shortTitle: 'Slow Meal',
    ),

    // ── Character lines ───────────────────────────────────────────────────────

    Phrase(
      text: 'Taste as you go. That\'s the whole point.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['warm', 'caretaker', 'playful', 'culinary'],
      categories: ['cooking'],
    ),
    Phrase(
      text: 'Don\'t follow the recipe exactly.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['trickster', 'rogue', 'explorer', 'playful'],
      categories: ['cooking'],
    ),
    Phrase(
      text: 'Feed yourself like you mean it.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['warrior', 'solemn', 'demanding', 'blunt'],
      categories: ['cooking'],
    ),
    Phrase(
      text: 'Pay attention to what changes when heat hits it.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['scholar', 'reflective', 'moderate', 'philosophical'],
      categories: ['cooking'],
    ),
  ];
}
