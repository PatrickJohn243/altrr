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
  ];
}
