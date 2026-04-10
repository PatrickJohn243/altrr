import '../core/phrase.dart';

class SharedClosings {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'That\'s it.',
      slot: PhraseSlot.closing,
      affinityTags: ['blunt', 'stoic', 'warrior', 'brief'],
    ),
    Phrase(
      text: 'No excuses.',
      slot: PhraseSlot.closing,
      affinityTags: ['warrior', 'demanding', 'blunt', 'ruthless'],
    ),
    Phrase(
      text: 'See what happens.',
      slot: PhraseSlot.closing,
      affinityTags: ['trickster', 'cryptic', 'playful', 'explorer'],
    ),
    Phrase(
      text: 'You\'ll know when you\'re done.',
      slot: PhraseSlot.closing,
      affinityTags: ['sage', 'cryptic', 'solemn', 'reflective'],
    ),
    Phrase(
      text: 'You deserve this.',
      slot: PhraseSlot.closing,
      affinityTags: ['warm', 'caretaker', 'gentle'],
    ),
    Phrase(
      text: 'It matters more than you think.',
      slot: PhraseSlot.closing,
      affinityTags: ['sage', 'philosophical', 'solemn', 'mentor'],
    ),
    Phrase(
      text: 'Don\'t skip it.',
      slot: PhraseSlot.closing,
      affinityTags: ['warrior', 'demanding', 'stoic', 'competitive'],
    ),
  ];
}
