import '../../core/phrase.dart';

class ExploreNotes {
  static const List<Phrase> phrases = [
    Phrase(
      slot: PhraseSlot.note,
      text: 'You\'ve been in the same places too long.',
      affinityTags: ['explorer', 'trickster', 'wanderer'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'The city hasn\'t shown you everything yet.',
      affinityTags: ['sage', 'cryptic', 'poetic'],
    ),
    Phrase(
      slot: PhraseSlot.note,
      text: 'Go somewhere different.',
      affinityTags: ['blunt', 'warrior', 'rogue'],
    ),
  ];
}
