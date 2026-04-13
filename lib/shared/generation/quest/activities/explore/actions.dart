import '../../../core/phrase.dart';

class ExploreActions {
  static const List<Phrase> phrases = [
    // ── Actions ──────────────────────────────────────────────────────────────

    Phrase(
      text: 'Go somewhere in your city you\'ve never been',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'wanderer', 'rogue'],
      categories: ['explore'],
      shortTitle: 'New Spot',
    ),
    Phrase(
      text: 'Take a completely different route today',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'trickster', 'wanderer'],
      categories: ['explore'],
      shortTitle: 'Different Route',
    ),
    Phrase(
      text: 'Visit a place you\'ve always walked past',
      slot: PhraseSlot.action,
      affinityTags: ['reflective', 'explorer', 'wanderer'],
      categories: ['explore'],
      shortTitle: 'Stop and Visit',
    ),
    Phrase(
      text: 'Go outside with no destination in mind',
      slot: PhraseSlot.action,
      affinityTags: ['rogue', 'cryptic', 'trickster', 'wanderer'],
      categories: ['explore'],
      shortTitle: 'No Destination',
    ),

    // ── Character lines ───────────────────────────────────────────────────────

    Phrase(
      text: 'Let the place show you something.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['sage', 'cryptic', 'explorer', 'reflective'],
      categories: ['explore'],
    ),
    Phrase(
      text: 'Look up more than you usually do.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['explorer', 'playful', 'trickster', 'wanderer'],
      categories: ['explore'],
    ),
    Phrase(
      text: 'Pretend you\'re seeing it for the first time.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['playful', 'trickster', 'explorer', 'rogue'],
      categories: ['explore'],
    ),
    Phrase(
      text: 'The city has more than you think.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['sage', 'poetic', 'solemn', 'wanderer'],
      categories: ['explore'],
    ),
  ];
}
