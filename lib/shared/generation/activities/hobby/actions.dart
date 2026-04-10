import '../../core/phrase.dart';

class HobbyActions {
  static const List<Phrase> phrases = [
    // ── Actions ──────────────────────────────────────────────────────────────

    Phrase(
      text: 'Pick up something you haven\'t touched in weeks',
      slot: PhraseSlot.action,
      affinityTags: ['reflective', 'caretaker', 'gentle'],
      categories: ['hobby'],
      shortTitle: 'Return to a Hobby',
    ),
    Phrase(
      text: 'Spend time on something just for yourself',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'gentle', 'caretaker'],
      categories: ['hobby'],
      shortTitle: 'Me Time',
    ),
    Phrase(
      text: 'Try making something with your hands',
      slot: PhraseSlot.action,
      affinityTags: ['rogue', 'trickster', 'explorer', 'playful'],
      categories: ['hobby'],
      shortTitle: 'Make Something',
    ),
    Phrase(
      text: 'Work on a project you\'ve been putting off',
      slot: PhraseSlot.action,
      affinityTags: ['mentor', 'competitive', 'demanding', 'moderate'],
      categories: ['hobby'],
      shortTitle: 'Pick It Back Up',
    ),

    // ── Character lines ───────────────────────────────────────────────────────

    Phrase(
      text: 'Don\'t aim for a result. Aim for the time spent.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['sage', 'philosophical', 'reflective'],
      categories: ['hobby'],
    ),
    Phrase(
      text: 'Remember why you started it.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['reflective', 'warm', 'caretaker', 'solemn'],
      categories: ['hobby'],
    ),
    Phrase(
      text: 'Make something imperfect.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['trickster', 'rogue', 'playful'],
      categories: ['hobby'],
    ),
  ];
}
