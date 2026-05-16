import '../../../core/phrase.dart';

class CookingSocial {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'Cook for someone today. Make it deliberate.',
      slot: PhraseSlot.action,
      affinityTags: ['caretaker', 'warm', 'socialFocus'],
      categories: ['cooking'],
      nature: QuestNature.social,
      shortTitle: 'Cook for Someone',
    ),
    Phrase(
      text: 'Cook a meal with someone else. Split the work.',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'socialFocus', 'playful'],
      categories: ['cooking'],
      nature: QuestNature.social,
      shortTitle: 'Cook Together',
    ),
    Phrase(
      text: 'Make enough to share. Then share it.',
      slot: PhraseSlot.action,
      affinityTags: ['caretaker', 'warm', 'gentle'],
      categories: ['cooking'],
      nature: QuestNature.social,
      shortTitle: 'Share a Meal',
    ),
    Phrase(
      text: 'Bring food to someone who could use it today.',
      slot: PhraseSlot.action,
      affinityTags: ['caretaker', 'warm', 'solemn'],
      categories: ['cooking'],
      nature: QuestNature.social,
      shortTitle: 'Bring Food',
    ),
    Phrase(
      text: 'Cook a recipe someone in your family taught you. Do it their way.',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'reflective', 'solemn', 'caretaker'],
      categories: ['cooking'],
      nature: QuestNature.social,
      shortTitle: 'Family Recipe',
    ),
    Phrase(
      text: 'Host a meal. Even a small one.',
      slot: PhraseSlot.action,
      affinityTags: ['caretaker', 'warm', 'socialFocus', 'gentle'],
      categories: ['cooking'],
      nature: QuestNature.social,
      shortTitle: 'Host a Meal',
    ),
    Phrase(
      text: 'Teach someone a dish you know well.',
      slot: PhraseSlot.action,
      affinityTags: ['mentor', 'warm', 'socialFocus'],
      categories: ['cooking'],
      nature: QuestNature.social,
      shortTitle: 'Teach a Dish',
    ),
  ];
}
