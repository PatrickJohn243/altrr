import '../../../core/phrase.dart';

class MentalNotes {
  static const List<Phrase> phrases = [
    Phrase(
      slot: PhraseSlot.note,
      text: 'You\'ve been off your mind lately.',
      affinityTags: ['warm', 'gentle', 'caretaker'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'Something\'s been left unexamined.',
      affinityTags: ['sage', 'cryptic', 'philosophical'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'Your head needs clearing.',
      affinityTags: ['blunt', 'warrior', 'stoic'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'You\'ve been running without thinking.',
      affinityTags: ['mentor', 'moderate', 'reflective'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'There\'s something worth thinking about.',
      affinityTags: ['sage', 'solemn', 'warm'],
    ),
  ];
}
