import '../../../core/phrase.dart';

class PhysicalCreative {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'Design your own workout today. No repeated exercises.',
      slot: PhraseSlot.action,
      affinityTags: ['warrior', 'competitive', 'mentor'],
      categories: ['physical'],
      nature: QuestNature.creative,
      shortTitle: 'Design a Workout',
    ),
    Phrase(
      text: 'Invent a physical challenge for yourself. Set one rule and follow it.',
      slot: PhraseSlot.action,
      affinityTags: ['trickster', 'rogue', 'competitive'],
      categories: ['physical'],
      nature: QuestNature.creative,
      shortTitle: 'Physical Challenge',
    ),
    Phrase(
      text: 'Create a route you\'ve never run before. No familiar streets.',
      slot: PhraseSlot.action,
      affinityTags: ['explorer', 'wanderer', 'rogue'],
      categories: ['physical'],
      nature: QuestNature.creative,
      shortTitle: 'New Route',
    ),
    Phrase(
      text: 'Make up a game that involves movement. Play it.',
      slot: PhraseSlot.action,
      affinityTags: ['trickster', 'playful', 'explorer'],
      categories: ['physical'],
      nature: QuestNature.creative,
      shortTitle: 'Movement Game',
    ),
    Phrase(
      text: 'Set a personal rule for today\'s workout. Stick to it.',
      slot: PhraseSlot.action,
      affinityTags: ['warrior', 'stoic', 'demanding'],
      categories: ['physical'],
      nature: QuestNature.creative,
      shortTitle: 'One Rule Workout',
    ),
    Phrase(
      text: 'Build a full workout from only bodyweight movements you invent on the spot.',
      slot: PhraseSlot.action,
      affinityTags: ['warrior', 'trickster', 'competitive'],
      categories: ['physical'],
      nature: QuestNature.creative,
      shortTitle: 'Improvised Circuit',
    ),
  ];
}
