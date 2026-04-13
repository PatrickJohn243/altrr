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
  ];
}
