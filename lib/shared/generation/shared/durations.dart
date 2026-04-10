import '../core/phrase.dart';

class SharedDurations {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'for 10 minutes',
      slot: PhraseSlot.duration,
      affinityTags: ['gentle', 'moderate', 'warm'],
    ),
    Phrase(
      text: 'for 20 minutes',
      slot: PhraseSlot.duration,
      affinityTags: ['moderate', 'demanding', 'mentor'],
    ),
    Phrase(
      text: 'for a few minutes',
      slot: PhraseSlot.duration,
      affinityTags: ['gentle', 'warm', 'caretaker'],
    ),
    Phrase(
      text: 'until it feels right',
      slot: PhraseSlot.duration,
      affinityTags: ['sage', 'reflective', 'warm', 'cryptic'],
    ),
    Phrase(
      text: 'without timing it',
      slot: PhraseSlot.duration,
      affinityTags: ['sage', 'cryptic', 'trickster', 'rogue'],
    ),
  ];
}
