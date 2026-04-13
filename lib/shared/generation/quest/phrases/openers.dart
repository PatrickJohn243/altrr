import '../../core/phrase.dart';

class SharedOpeners {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'Tonight,',
      slot: PhraseSlot.opener,
      affinityTags: ['nightOwl', 'solemn', 'warm'],
    ),
    Phrase(
      text: 'Just once,',
      slot: PhraseSlot.opener,
      affinityTags: ['gentle', 'moderate', 'caretaker'],
    ),
    Phrase(
      text: 'No pressure —',
      slot: PhraseSlot.opener,
      affinityTags: ['warm', 'caretaker', 'gentle'],
    ),
    Phrase(
      text: 'Try this —',
      slot: PhraseSlot.opener,
      affinityTags: ['playful', 'trickster', 'mentor', 'explorer'],
    ),
    Phrase(
      text: 'When you get a moment,',
      slot: PhraseSlot.opener,
      affinityTags: ['gentle', 'warm', 'moderate'],
    ),
    Phrase(
      text: 'Here\'s one for you:',
      slot: PhraseSlot.opener,
      affinityTags: ['playful', 'warm', 'mentor'],
    ),
    Phrase(
      text: 'Before you sleep,',
      slot: PhraseSlot.opener,
      affinityTags: ['nightOwl', 'solemn', 'reflective'],
    ),
  ];
}
