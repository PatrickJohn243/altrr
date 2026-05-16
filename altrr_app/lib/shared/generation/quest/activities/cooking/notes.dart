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
    Phrase(
      slot: PhraseSlot.note,
      text: 'You\'ve been surviving meals. Not enjoying them.',
      affinityTags: ['caretaker', 'warm', 'solemn'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'Cooking is one of the quietest forms of self-care.',
      affinityTags: ['sage', 'philosophical', 'reflective'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'You\'ve been outsourcing this too long.',
      affinityTags: ['mentor', 'blunt', 'moderate'],
    ),
  ];
}
