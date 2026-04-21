import '../../../core/phrase.dart';

class SocialNotes {
  static const List<Phrase> phrases = [
    Phrase(
      slot: PhraseSlot.note,
      text: 'You\'ve been quiet lately.',
      affinityTags: ['warm', 'caretaker', 'gentle'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'You\'ve been keeping to yourself.',
      affinityTags: ['sage', 'reflective', 'solemn'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'You\'re overdue for a conversation.',
      affinityTags: ['blunt', 'warrior', 'stoic'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'Someone out there could use you.',
      affinityTags: ['mentor', 'warm', 'philosophical'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'You\'ve been going through this alone.',
      affinityTags: ['caretaker', 'warm', 'gentle'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'The people in your life are still there.',
      affinityTags: ['warm', 'sage', 'solemn'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'Isolation builds quietly. Break it.',
      affinityTags: ['warrior', 'blunt', 'solemn'],
    ),
  ];
}
