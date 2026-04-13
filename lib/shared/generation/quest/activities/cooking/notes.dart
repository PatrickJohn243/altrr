import '../../../core/phrase.dart';

class CookingNotes {
  static const List<Phrase> phrases = [
    Phrase(
      slot: PhraseSlot.note,
      text: 'You haven\'t fed yourself properly in a while.',
      affinityTags: ['caretaker', 'warm', 'gentle'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'You\'ve been eating without thinking.',
      affinityTags: ['sage', 'philosophical', 'reflective'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'Time to use that kitchen.',
      affinityTags: ['blunt', 'warrior', 'trickster'],
    ),
  ];
}
