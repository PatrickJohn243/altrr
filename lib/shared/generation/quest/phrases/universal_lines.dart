import '../../core/phrase.dart';

// Character lines with no category — apply to any quest regardless of domain.
class UniversalLines {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'Don\'t overthink it.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['blunt', 'warrior', 'stoic', 'trickster'],
    ),
    Phrase(
      text: 'See what happens.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['trickster', 'playful', 'cryptic', 'explorer'],
    ),
    Phrase(
      text: 'Let it surprise you.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['warm', 'gentle', 'explorer', 'caretaker'],
    ),
    Phrase(
      text: 'You\'ll know when you\'re done.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['sage', 'cryptic', 'solemn', 'moderate'],
    ),
    Phrase(
      text: 'Notice what comes up.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['reflective', 'sage', 'philosophical', 'scholar'],
    ),
    Phrase(
      text: 'Just show up. That\'s enough.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['warm', 'caretaker', 'gentle', 'mentor'],
    ),
    Phrase(
      text: 'Don\'t make it into a thing.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['blunt', 'trickster', 'playful', 'rogue'],
    ),
    Phrase(
      text: 'Let your mind go where it wants to.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['sage', 'poetic', 'reflective', 'cryptic'],
    ),
    Phrase(
      text: 'No plan. Just go.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['rogue', 'trickster', 'explorer', 'blunt'],
    ),
    Phrase(
      text: 'Something will come out of it.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['sage', 'mentor', 'philosophical', 'moderate'],
    ),
    Phrase(
      text: 'Pay attention to how it feels.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['caretaker', 'warm', 'reflective', 'gentle'],
    ),
    Phrase(
      text: 'Make it count.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['warrior', 'competitive', 'demanding', 'stoic'],
    ),
  ];
}
