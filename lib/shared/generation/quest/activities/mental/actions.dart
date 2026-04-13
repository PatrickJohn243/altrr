import '../../../core/phrase.dart';

class MentalActions {
  static const List<Phrase> phrases = [
    // ── Actions ──────────────────────────────────────────────────────────────

    Phrase(
      text: 'Sit somewhere quiet and think',
      slot: PhraseSlot.action,
      affinityTags: ['sage', 'reflective', 'solemn'],
      categories: ['mental'],
      shortTitle: 'Quiet Thinking',
    ),
    Phrase(
      text: 'Write down whatever is in your head',
      slot: PhraseSlot.action,
      affinityTags: ['reflective', 'scholar', 'moderate'],
      categories: ['mental'],
      shortTitle: 'Brain Dump',
    ),
    Phrase(
      text: 'Go outside and take a walk',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'gentle', 'caretaker'],
      categories: ['mental'],
      shortTitle: 'Clearing Walk',
    ),
    Phrase(
      text: 'Read something unrelated to your day',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'sage', 'solitary'],
      categories: ['mental'],
      shortTitle: 'Read Something',
    ),
    Phrase(
      text: 'Sit and think about one thing you want to build',
      slot: PhraseSlot.action,
      affinityTags: ['mentor', 'philosophical', 'competitive'],
      categories: ['mental'],
      shortTitle: 'Idea Session',
    ),
    Phrase(
      text: 'Put your phone down and sit with your thoughts',
      slot: PhraseSlot.action,
      affinityTags: ['sage', 'solemn', 'stoic'],
      categories: ['mental'],
      shortTitle: 'Sit With It',
    ),

    // ── Character lines ───────────────────────────────────────────────────────

    Phrase(
      text: 'Think about ideas you can create.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['mentor', 'warm', 'gentle', 'philosophical'],
      categories: ['mental'],
    ),
    Phrase(
      text: 'Think of one thing you can improve.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['mentor', 'competitive', 'moderate'],
      categories: ['mental'],
    ),
    Phrase(
      text: 'Let the thought breathe.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['sage', 'poetic', 'reflective', 'cryptic'],
      categories: ['mental'],
    ),
    Phrase(
      text: 'Your mind needs room to move.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['sage', 'warm', 'moderate', 'philosophical'],
      categories: ['mental'],
    ),
    Phrase(
      text: 'Write it out. You\'ll see it differently.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['mentor', 'scholar', 'reflective', 'blunt'],
      categories: ['mental'],
    ),
    Phrase(
      text: 'Don\'t try to solve anything. Just think.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['sage', 'cryptic', 'solemn', 'reflective'],
      categories: ['mental'],
    ),
  ];
}
