import '../../../core/phrase.dart';

class HobbyNotes {
  static const List<Phrase> phrases = [
    Phrase(
      slot: PhraseSlot.note,
      text: 'You\'ve been neglecting something you love.',
      affinityTags: ['warm', 'caretaker', 'reflective'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'You\'ve been too busy for yourself.',
      affinityTags: ['sage', 'solemn', 'philosophical'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'Pick it back up.',
      affinityTags: ['blunt', 'warrior', 'mentor'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'What you enjoy deserves more of your time.',
      affinityTags: ['caretaker', 'warm', 'gentle'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'You\'re not just what you produce.',
      affinityTags: ['sage', 'philosophical', 'solemn'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'Fun isn\'t a reward for finishing. It\'s part of it.',
      affinityTags: ['warm', 'mentor', 'gentle'],
    ),
  ];
}
