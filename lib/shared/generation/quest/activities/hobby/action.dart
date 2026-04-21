import '../../../core/phrase.dart';

class HobbyAction {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'Pick up something you haven\'t touched in weeks',
      slot: PhraseSlot.action,
      affinityTags: ['reflective', 'caretaker', 'gentle'],
      categories: ['hobby'],
      nature: QuestNature.action,
      shortTitle: 'Return to a Hobby',
    ),
    Phrase(
      text: 'Spend time on something just for yourself',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'gentle', 'caretaker'],
      categories: ['hobby'],
      nature: QuestNature.action,
      shortTitle: 'Me Time',
    ),
    Phrase(
      text: 'Work on a project you\'ve been putting off',
      slot: PhraseSlot.action,
      affinityTags: ['mentor', 'competitive', 'demanding', 'moderate'],
      categories: ['hobby'],
      nature: QuestNature.action,
      shortTitle: 'Pick It Back Up',
    ),
    Phrase(
      text: 'Set a timer for an hour and do only what you enjoy.',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'gentle', 'caretaker', 'playful'],
      categories: ['hobby'],
      nature: QuestNature.action,
      shortTitle: 'The Enjoyment Hour',
    ),
    Phrase(
      text: 'Learn the next step in a skill you\'ve been developing.',
      slot: PhraseSlot.action,
      affinityTags: ['mentor', 'scholar', 'moderate'],
      categories: ['hobby'],
      nature: QuestNature.action,
      shortTitle: 'Next Level',
    ),
    Phrase(
      text: 'Take your hobby seriously for one session. Treat it like it matters.',
      slot: PhraseSlot.action,
      affinityTags: ['warrior', 'mentor', 'competitive', 'solemn'],
      categories: ['hobby'],
      nature: QuestNature.action,
      shortTitle: 'Take It Seriously',
    ),
    Phrase(
      text: 'Start something you\'ve been curious about but never tried.',
      slot: PhraseSlot.action,
      affinityTags: ['trickster', 'explorer', 'playful'],
      categories: ['hobby'],
      nature: QuestNature.action,
      shortTitle: 'Try the Thing',
    ),
    Phrase(
      text: 'Document something you\'ve made or created recently.',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'reflective', 'moderate'],
      categories: ['hobby'],
      nature: QuestNature.action,
      shortTitle: 'Document It',
    ),
    Phrase(
      text: 'Do your hobby completely offline. No tutorials, no reference.',
      slot: PhraseSlot.action,
      affinityTags: ['warrior', 'rogue', 'stoic'],
      categories: ['hobby'],
      nature: QuestNature.action,
      shortTitle: 'Offline Session',
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
    Phrase(
      text: 'This is yours. Not a performance.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['warm', 'sage', 'solemn'],
      categories: ['hobby'],
    ),
    Phrase(
      text: 'The best version of this is the one you actually do.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['mentor', 'moderate', 'warm'],
      categories: ['hobby'],
    ),
    Phrase(
      text: 'You need this more than you think.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['caretaker', 'solemn', 'warm', 'sage'],
      categories: ['hobby'],
    ),
  ];
}
