import '../../../core/phrase.dart';

class LearningCreative {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'Apply something you\'ve been learning. Make or build something with it.',
      slot: PhraseSlot.action,
      affinityTags: ['mentor', 'scholar', 'competitive'],
      categories: ['learning'],
      nature: QuestNature.creative,
      shortTitle: 'Apply It',
    ),
    Phrase(
      text: 'Explain something you learned recently as if teaching a 10-year-old. Write it down.',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'mentor', 'warm'],
      categories: ['learning'],
      nature: QuestNature.creative,
      shortTitle: 'Explain Simply',
    ),
    Phrase(
      text: 'Turn something you\'re learning into a practical experiment. Do the experiment.',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'trickster', 'explorer'],
      categories: ['learning'],
      nature: QuestNature.creative,
      shortTitle: 'Run an Experiment',
    ),
    Phrase(
      text: 'Write a short summary of something you\'ve recently learned. One page.',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'reflective', 'moderate'],
      categories: ['learning'],
      nature: QuestNature.creative,
      shortTitle: 'Write the Summary',
    ),
    Phrase(
      text: 'Make a visual map or diagram of something complex you\'re trying to understand.',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'trickster', 'playful'],
      categories: ['learning'],
      nature: QuestNature.creative,
      shortTitle: 'Map It Out',
    ),
    Phrase(
      text: 'Build a small prototype of something you\'ve only read about.',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'competitor', 'explorer', 'trickster'],
      categories: ['learning'],
      nature: QuestNature.creative,
      shortTitle: 'Build a Prototype',
    ),
  ];
}
