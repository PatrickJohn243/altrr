import '../../../core/phrase.dart';

class HobbyCreative {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'Make something from scratch with whatever you have available.',
      slot: PhraseSlot.action,
      affinityTags: ['trickster', 'rogue', 'playful'],
      categories: ['hobby'],
      nature: QuestNature.creative,
      shortTitle: 'Make Something',
    ),
    Phrase(
      text: 'Start a creative project with no plan. See where it goes.',
      slot: PhraseSlot.action,
      affinityTags: ['rogue', 'explorer', 'trickster'],
      categories: ['hobby'],
      nature: QuestNature.creative,
      shortTitle: 'No Plan Project',
    ),
    Phrase(
      text: 'Finish something you started and abandoned.',
      slot: PhraseSlot.action,
      affinityTags: ['warrior', 'mentor', 'competitive'],
      categories: ['hobby'],
      nature: QuestNature.creative,
      shortTitle: 'Finish It',
    ),
    Phrase(
      text: 'Make something and give it away.',
      slot: PhraseSlot.action,
      affinityTags: ['caretaker', 'warm', 'solemn'],
      categories: ['hobby'],
      nature: QuestNature.creative,
      shortTitle: 'Make and Give',
    ),
    Phrase(
      text: 'Combine two of your interests in one project.',
      slot: PhraseSlot.action,
      affinityTags: ['trickster', 'scholar', 'explorer'],
      categories: ['hobby'],
      nature: QuestNature.creative,
      shortTitle: 'Crossover Project',
    ),
    Phrase(
      text: 'Try to recreate something you admire. Don\'t copy — interpret it.',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'reflective', 'moderate'],
      categories: ['hobby'],
      nature: QuestNature.creative,
      shortTitle: 'Interpret It',
    ),
    Phrase(
      text: 'Set a time limit. Make something in under 45 minutes.',
      slot: PhraseSlot.action,
      affinityTags: ['warrior', 'trickster', 'competitive'],
      categories: ['hobby'],
      nature: QuestNature.creative,
      shortTitle: 'Timed Creation',
    ),
  ];
}
