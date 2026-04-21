import '../../../core/phrase.dart';

class CookingAction {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'Make a proper meal from scratch',
      slot: PhraseSlot.action,
      affinityTags: ['caretaker', 'moderate', 'warm'],
      categories: ['cooking'],
      nature: QuestNature.action,
      shortTitle: 'Cook from Scratch',
    ),
    Phrase(
      text: 'Cook something you\'ve never made before',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'trickster', 'playful'],
      categories: ['cooking'],
      nature: QuestNature.action,
      shortTitle: 'Try a New Dish',
    ),
    Phrase(
      text: 'Recreate something you ate somewhere and enjoyed',
      slot: PhraseSlot.action,
      affinityTags: ['reflective', 'explorer', 'scholar'],
      categories: ['cooking'],
      nature: QuestNature.action,
      shortTitle: 'Recreate a Dish',
    ),
    Phrase(
      text: 'Cook a meal and eat it slowly. No distractions.',
      slot: PhraseSlot.action,
      affinityTags: ['caretaker', 'gentle', 'warm', 'solemn'],
      categories: ['cooking'],
      nature: QuestNature.action,
      shortTitle: 'Slow Meal',
    ),
    Phrase(
      text: 'Make breakfast properly. Not a snack — a meal.',
      slot: PhraseSlot.action,
      affinityTags: ['caretaker', 'warm', 'moderate'],
      categories: ['cooking'],
      nature: QuestNature.action,
      shortTitle: 'Real Breakfast',
    ),
    Phrase(
      text: 'Make something you used to eat as a kid.',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'reflective', 'caretaker', 'solemn'],
      categories: ['cooking'],
      nature: QuestNature.action,
      shortTitle: 'Childhood Dish',
    ),
    Phrase(
      text: 'Prep meals for the next few days. One cook session.',
      slot: PhraseSlot.action,
      affinityTags: ['mentor', 'moderate', 'competitive'],
      categories: ['cooking'],
      nature: QuestNature.action,
      shortTitle: 'Meal Prep',
    ),
    Phrase(
      text: 'Cook a full three-course meal for yourself.',
      slot: PhraseSlot.action,
      affinityTags: ['caretaker', 'warm', 'solemn', 'playful'],
      categories: ['cooking'],
      nature: QuestNature.action,
      shortTitle: 'Three Courses',
    ),
    Phrase(
      text: 'Make a soup or stew from whatever is available.',
      slot: PhraseSlot.action,
      affinityTags: ['trickster', 'warm', 'rogue'],
      categories: ['cooking'],
      nature: QuestNature.action,
      shortTitle: 'Improvised Soup',
    ),
    Phrase(
      text: 'Make a sauce from scratch. Let it simmer.',
      slot: PhraseSlot.action,
      affinityTags: ['caretaker', 'moderate', 'reflective'],
      categories: ['cooking'],
      nature: QuestNature.action,
      shortTitle: 'Homemade Sauce',
    ),
    Phrase(
      text: 'Cook something that takes at least an hour of attention.',
      slot: PhraseSlot.action,
      affinityTags: ['solemn', 'moderate', 'caretaker', 'mentor'],
      categories: ['cooking'],
      nature: QuestNature.action,
      shortTitle: 'Slow Cook',
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
    Phrase(
      text: 'Cooking is one of the few things that rewards full attention.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['sage', 'solemn', 'philosophical', 'reflective'],
      categories: ['cooking'],
    ),
    Phrase(
      text: 'Make it with care. That\'s the ingredient nobody lists.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['caretaker', 'warm', 'gentle', 'solemn'],
      categories: ['cooking'],
    ),
    Phrase(
      text: 'You\'ll eat better when you made it yourself.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['mentor', 'moderate', 'blunt'],
      categories: ['cooking'],
    ),
  ];
}
