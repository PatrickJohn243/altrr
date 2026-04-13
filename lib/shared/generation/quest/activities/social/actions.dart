import '../../../core/phrase.dart';

class SocialActions {
  static const List<Phrase> phrases = [
    // ── Actions ──────────────────────────────────────────────────────────────

    Phrase(
      text: 'Call someone you care about',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'caretaker', 'socialFocus'],
      categories: ['social'],
      shortTitle: 'Make a Call',
    ),
    Phrase(
      text: 'Reach out to someone you haven\'t spoken to in a while',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'reflective', 'caretaker'],
      categories: ['social'],
      shortTitle: 'Reconnect',
    ),
    Phrase(
      text: 'Start a conversation with someone new',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'rogue', 'trickster', 'playful'],
      categories: ['social'],
      shortTitle: 'New Conversation',
    ),
    Phrase(
      text: 'Check in on someone',
      slot: PhraseSlot.action,
      affinityTags: ['caretaker', 'warm', 'gentle'],
      categories: ['social'],
      shortTitle: 'Check In',
    ),
    Phrase(
      text: 'Send a message to someone you\'ve been thinking about',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'gentle', 'reflective'],
      categories: ['social'],
      shortTitle: 'Send a Message',
    ),

    // ── Character lines ───────────────────────────────────────────────────────

    Phrase(
      text: 'The conversation doesn\'t have to go anywhere.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['warm', 'caretaker', 'gentle'],
      categories: ['social'],
    ),
    Phrase(
      text: 'Just be there. That\'s enough.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['warm', 'caretaker', 'solemn', 'gentle'],
      categories: ['social'],
    ),
    Phrase(
      text: 'You might be surprised what comes out.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['playful', 'trickster', 'explorer'],
      categories: ['social'],
    ),
    Phrase(
      text: 'Say something real.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['warrior', 'blunt', 'solemn', 'stoic'],
      categories: ['social'],
    ),
    Phrase(
      text: 'People remember who shows up.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['mentor', 'solemn', 'philosophical', 'warm'],
      categories: ['social'],
    ),
  ];
}
