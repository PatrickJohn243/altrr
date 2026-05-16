import '../../../core/phrase.dart';

class LearningNotes {
  static const List<Phrase> phrases = [
    Phrase(
      slot: PhraseSlot.note,
      text: 'Your mind\'s been idle.',
      affinityTags: ['warrior', 'demanding', 'competitive'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'There\'s something you\'ve been meaning to understand.',
      affinityTags: ['sage', 'philosophical', 'cryptic'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'Pick up something new.',
      affinityTags: ['mentor', 'moderate', 'explorer'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'You\'re due for something unfamiliar.',
      affinityTags: ['trickster', 'explorer', 'playful'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'You haven\'t challenged your mind lately.',
      affinityTags: ['mentor', 'scholar', 'competitive'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'Curiosity doesn\'t maintain itself. Feed it.',
      affinityTags: ['mentor', 'philosophical', 'solemn'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'What do you not know yet that you should?',
      affinityTags: ['sage', 'cryptic', 'philosophical'],
    ),
  ];
}
