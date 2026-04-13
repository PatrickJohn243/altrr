import '../../../core/phrase.dart';

class PhysicalNotes {
  static const List<Phrase> phrases = [
    Phrase(
      slot: PhraseSlot.note,
      text: 'You\'ve been sitting too long.',
      affinityTags: ['warrior', 'blunt', 'demanding'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'Your body\'s been waiting.',
      affinityTags: ['warrior', 'stoic', 'physical'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'You need to move.',
      affinityTags: ['caretaker', 'warm', 'gentle'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'Something needs to shift.',
      affinityTags: ['sage', 'cryptic', 'solemn'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'You\'ve been still for too long.',
      affinityTags: ['mentor', 'moderate', 'reflective'],
    ),
  ];
}
