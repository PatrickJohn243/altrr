import '../../../core/phrase.dart';

class ReflectionNotes {
  static const List<Phrase> phrases = [
    Phrase(
      slot: PhraseSlot.note,
      text: 'You\'ve been moving without pausing.',
      affinityTags: ['sage', 'solemn', 'reflective'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'Something needs your attention.',
      affinityTags: ['sage', 'cryptic', 'philosophical'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'Stop for a moment.',
      affinityTags: ['warm', 'caretaker', 'gentle'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'You\'ve been skipping this.',
      affinityTags: ['warrior', 'blunt', 'stoic'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'You don\'t have to process everything. But you have to process something.',
      affinityTags: ['mentor', 'solemn', 'moderate'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'You\'ve been too busy to check in with yourself.',
      affinityTags: ['caretaker', 'warm', 'reflective'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'The un-examined stuff doesn\'t go away. It just waits.',
      affinityTags: ['sage', 'cryptic', 'solemn', 'philosophical'],
    ),
  ];
}
