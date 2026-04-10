import '../../core/phrase.dart';

class ReflectionActions {
  static const List<Phrase> phrases = [
    // ── Actions ──────────────────────────────────────────────────────────────

    Phrase(
      text: 'Sit in silence',
      slot: PhraseSlot.action,
      affinityTags: ['sage', 'solemn', 'reflective', 'stoic'],
      categories: ['reflection'],
      shortTitle: 'Sit in Silence',
    ),
    Phrase(
      text: 'Reflect on what you\'re grateful for today',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'caretaker', 'solemn', 'philosophical'],
      categories: ['reflection'],
      shortTitle: 'Gratitude Moment',
    ),
    Phrase(
      text: 'Read something meaningful to you',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'solemn', 'sage'],
      categories: ['reflection'],
      shortTitle: 'Meaningful Read',
    ),
    Phrase(
      text: 'Write about something you\'ve been carrying',
      slot: PhraseSlot.action,
      affinityTags: ['reflective', 'solemn', 'sage', 'philosophical'],
      categories: ['reflection'],
      shortTitle: 'Let It Out',
    ),

    // ── Character lines ───────────────────────────────────────────────────────

    Phrase(
      text: 'No phone. No input. Just you.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['warrior', 'stoic', 'blunt', 'solemn'],
      categories: ['reflection'],
    ),
    Phrase(
      text: 'Let what surfaces, surface.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['sage', 'cryptic', 'reflective', 'philosophical'],
      categories: ['reflection'],
    ),
    Phrase(
      text: 'You already know what needs attention.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['sage', 'solemn', 'stoic', 'mentor'],
      categories: ['reflection'],
    ),
  ];
}
