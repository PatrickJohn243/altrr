import '../../core/phrase.dart';

// Settings apply only where a location makes sense.
// Explore and cooking are excluded — their actions already contain location.
class SharedSettings {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'somewhere you\'ve never been',
      slot: PhraseSlot.setting,
      affinityTags: ['explorer', 'wanderer', 'trickster', 'rogue'],
      categories: ['physical', 'mental', 'social', 'hobby'],
    ),
    Phrase(
      text: 'somewhere quiet',
      slot: PhraseSlot.setting,
      affinityTags: ['sage', 'reflective', 'solemn', 'solitary'],
      categories: ['physical', 'mental', 'reflection', 'learning'],
    ),
    Phrase(
      text: 'outside',
      slot: PhraseSlot.setting,
      affinityTags: ['physical', 'explorer', 'wanderer', 'warrior'],
      categories: ['mental', 'reflection', 'hobby'],
    ),
    Phrase(
      text: 'somewhere unfamiliar',
      slot: PhraseSlot.setting,
      affinityTags: ['explorer', 'trickster', 'rogue', 'wanderer'],
      categories: ['physical', 'mental', 'social'],
    ),
  ];
}
