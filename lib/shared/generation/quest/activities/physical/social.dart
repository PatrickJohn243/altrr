import '../../../core/phrase.dart';

class PhysicalSocial {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'Go for a walk with someone. No phones while you\'re moving.',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'caretaker', 'socialFocus'],
      categories: ['physical'],
      nature: QuestNature.social,
      shortTitle: 'Walk Together',
    ),
    Phrase(
      text: 'Work out with someone today. Push each other.',
      slot: PhraseSlot.action,
      affinityTags: ['warrior', 'competitive', 'demanding'],
      categories: ['physical'],
      nature: QuestNature.social,
      shortTitle: 'Train Together',
    ),
    Phrase(
      text: 'Ask someone to join you for a run. Go at their pace.',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'caretaker', 'gentle'],
      categories: ['physical'],
      nature: QuestNature.social,
      shortTitle: 'Run with Someone',
    ),
    Phrase(
      text: 'Do a physical activity with someone you haven\'t spent time with recently.',
      slot: PhraseSlot.action,
      affinityTags: ['socialFocus', 'warm', 'reflective'],
      categories: ['physical'],
      nature: QuestNature.social,
      shortTitle: 'Move Together',
    ),
    Phrase(
      text: 'Challenge someone to a physical bet. Keep it friendly.',
      slot: PhraseSlot.action,
      affinityTags: ['warrior', 'trickster', 'competitive', 'playful'],
      categories: ['physical'],
      nature: QuestNature.social,
      shortTitle: 'Friendly Challenge',
    ),
    Phrase(
      text: 'Stretch with someone. Guide them through it.',
      slot: PhraseSlot.action,
      affinityTags: ['caretaker', 'warm', 'mentor', 'gentle'],
      categories: ['physical'],
      nature: QuestNature.social,
      shortTitle: 'Stretch Together',
    ),
    Phrase(
      text: 'Go cycling with someone. Match their rhythm.',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'explorer', 'socialFocus'],
      categories: ['physical'],
      nature: QuestNature.social,
      shortTitle: 'Cycle Together',
      requires: 'bike',
    ),
    Phrase(
      text: 'Play something physical with another person. Let it be fun.',
      slot: PhraseSlot.action,
      affinityTags: ['playful', 'trickster', 'socialFocus', 'warm'],
      categories: ['physical'],
      nature: QuestNature.social,
      shortTitle: 'Play a Sport',
    ),
  ];
}
