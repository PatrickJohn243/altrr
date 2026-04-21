import '../../../core/phrase.dart';

class ExploreSocial {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'Go somewhere new with someone. Let them pick the destination.',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'warm', 'socialFocus'],
      categories: ['explore'],
      nature: QuestNature.social,
      shortTitle: 'Explore Together',
    ),
    Phrase(
      text: 'Find a place neither of you has been to. Go together.',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'wanderer', 'playful'],
      categories: ['explore'],
      nature: QuestNature.social,
      shortTitle: 'New Place Together',
    ),
    Phrase(
      text: 'Take someone on an unplanned trip somewhere local.',
      slot: PhraseSlot.action,
      affinityTags: ['rogue', 'trickster', 'socialFocus'],
      categories: ['explore'],
      nature: QuestNature.social,
      shortTitle: 'Spontaneous Trip',
    ),
    Phrase(
      text: 'Ask someone to show you their favourite spot. Let them guide.',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'explorer', 'reflective'],
      categories: ['explore'],
      nature: QuestNature.social,
      shortTitle: 'Their Favourite Spot',
    ),
    Phrase(
      text: 'Take a long walk with someone. No route planned.',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'wanderer', 'gentle', 'socialFocus'],
      categories: ['explore'],
      nature: QuestNature.social,
      shortTitle: 'Wander Together',
    ),
    Phrase(
      text: 'Plan a short day trip with someone. Go.',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'socialFocus', 'playful'],
      categories: ['explore'],
      nature: QuestNature.social,
      shortTitle: 'Day Trip',
    ),
  ];
}
