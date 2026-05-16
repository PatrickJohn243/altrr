import '../../../core/phrase.dart';

class ReflectionCreative {
  static const List<Phrase> phrases = [
    Phrase(
      text:
          'Write about something that happened this week. Be honest, not polished.',
      slot: PhraseSlot.action,
      affinityTags: ['reflective', 'solemn', 'sage'],
      categories: ['reflection'],
      nature: QuestNature.creative,
      shortTitle: 'Write It Out',
    ),
    Phrase(
      text: 'Write one page about something you\'ve been avoiding saying.',
      slot: PhraseSlot.action,
      affinityTags: ['warrior', 'solemn', 'stoic', 'blunt'],
      categories: ['reflection'],
      nature: QuestNature.creative,
      shortTitle: 'Say the Thing',
    ),
    Phrase(
      text: 'Write a letter to yourself from a year ago. What would you say?',
      slot: PhraseSlot.action,
      affinityTags: ['sage', 'philosophical', 'reflective'],
      categories: ['reflection'],
      nature: QuestNature.creative,
      shortTitle: 'Letter to Past Self',
    ),
    Phrase(
      text: 'Sketch, draw, or write something that captures how you feel right now.',
      slot: PhraseSlot.action,
      affinityTags: ['reflective', 'poetic', 'warm'],
      categories: ['reflection'],
      nature: QuestNature.creative,
      shortTitle: 'Express It',
    ),
    Phrase(
      text: 'Write a list of things you want to stop carrying. Then close the list.',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'solemn', 'caretaker', 'reflective'],
      categories: ['reflection'],
      nature: QuestNature.creative,
      shortTitle: 'Let Go List',
    ),
    Phrase(
      text: 'Write a letter to someone you haven\'t spoken to in a long time.',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'reflective', 'solemn', 'caretaker'],
      categories: ['reflection'],
      nature: QuestNature.creative,
      shortTitle: 'Unsent Letter',
    ),
    Phrase(
      text: 'Write about a version of yourself you used to be. What changed?',
      slot: PhraseSlot.action,
      affinityTags: ['sage', 'philosophical', 'reflective', 'solemn'],
      categories: ['reflection'],
      nature: QuestNature.creative,
      shortTitle: 'Who You Were',
    ),
    Phrase(
      text: 'Make a list of what you believe. Not what you\'re supposed to — what you actually do.',
      slot: PhraseSlot.action,
      affinityTags: ['warrior', 'mentor', 'stoic', 'solemn'],
      categories: ['reflection'],
      nature: QuestNature.creative,
      shortTitle: 'Your Actual Beliefs',
    ),
  ];
}
