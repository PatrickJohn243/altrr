import '../../core/phrase.dart';

class PhysicalActions {
  static const List<Phrase> phrases = [
    // ── Actions ──────────────────────────────────────────────────────────────

    Phrase(
      text: 'Go outside and walk',
      slot: PhraseSlot.action,
      categories: ['physical'],
      shortTitle: 'Take a Walk',
    ),
    Phrase(
      text: 'Go for a run',
      slot: PhraseSlot.action,
      affinityTags: ['warrior', 'demanding', 'competitive'],
      categories: ['physical'],
      shortTitle: 'Go for a Run',
    ),
    Phrase(
      text: 'Do a set of pushups',
      slot: PhraseSlot.action,
      affinityTags: ['warrior', 'demanding', 'physical'],
      categories: ['physical'],
      shortTitle: 'Pushup Set',
    ),
    Phrase(
      text: 'Stretch for a bit',
      slot: PhraseSlot.action,
      affinityTags: ['gentle', 'warm', 'caretaker'],
      categories: ['physical'],
      shortTitle: 'Stretch It Out',
    ),
    Phrase(
      text: 'Take yourself for a slow walk',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'caretaker', 'reflective'],
      categories: ['physical'],
      shortTitle: 'Slow Walk',
    ),
    Phrase(
      text: 'Find a set of stairs and climb them',
      slot: PhraseSlot.action,
      affinityTags: ['warrior', 'trickster', 'explorer'],
      categories: ['physical'],
      shortTitle: 'Stair Climb',
    ),

    // ── Character lines ───────────────────────────────────────────────────────

    Phrase(
      text: 'Push until your body remembers it\'s alive.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['warrior', 'demanding', 'competitive', 'physical'],
      categories: ['physical'],
    ),
    Phrase(
      text: 'Feel where it gets hard. Stay there a moment.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['warrior', 'stoic', 'demanding'],
      categories: ['physical'],
    ),
    Phrase(
      text: 'Your body knows what it needs.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['caretaker', 'warm', 'gentle'],
      categories: ['physical'],
    ),
    Phrase(
      text: 'Let your legs do the thinking.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['sage', 'cryptic', 'reflective'],
      categories: ['physical'],
    ),
    Phrase(
      text: 'Move like you mean it.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['warrior', 'blunt', 'competitive'],
      categories: ['physical'],
    ),
  ];
}
