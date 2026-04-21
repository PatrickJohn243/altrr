import '../../../core/phrase.dart';

class LearningAction {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'Learn one thing you know nothing about',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'mentor', 'explorer'],
      categories: ['learning'],
      nature: QuestNature.action,
      shortTitle: 'Learn Something New',
    ),
    Phrase(
      text: 'Watch a short tutorial on something unrelated to your work',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'explorer', 'playful'],
      categories: ['learning'],
      nature: QuestNature.action,
      shortTitle: 'Quick Tutorial',
    ),
    Phrase(
      text: 'Read about a field you\'ve always been curious about',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'sage', 'philosophical'],
      categories: ['learning'],
      nature: QuestNature.action,
      shortTitle: 'Curious Reading',
    ),
    Phrase(
      text: 'Find one fact about something you use every day',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'trickster', 'playful'],
      categories: ['learning'],
      nature: QuestNature.action,
      shortTitle: 'Everyday Fact',
    ),
    Phrase(
      text: 'Read a chapter of a nonfiction book you\'ve been meaning to start',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'sage', 'moderate'],
      categories: ['learning'],
      nature: QuestNature.action,
      shortTitle: 'Read a Chapter',
    ),
    Phrase(
      text: 'Pick a skill you want to have. Spend time on step one.',
      slot: PhraseSlot.action,
      affinityTags: ['mentor', 'competitive', 'scholar'],
      categories: ['learning'],
      nature: QuestNature.action,
      shortTitle: 'Step One',
    ),
    Phrase(
      text: 'Watch a talk or lecture on something that challenges how you think.',
      slot: PhraseSlot.action,
      affinityTags: ['philosopher', 'scholar', 'sage', 'reflective'],
      categories: ['learning'],
      nature: QuestNature.action,
      shortTitle: 'Challenging Talk',
    ),
    Phrase(
      text: 'Spend 30 minutes learning something practical. Something you can actually use.',
      slot: PhraseSlot.action,
      affinityTags: ['mentor', 'moderate', 'scholar'],
      categories: ['learning'],
      nature: QuestNature.action,
      shortTitle: 'Practical Skill',
    ),
    Phrase(
      text: 'Write down three things you don\'t understand but want to.',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'reflective', 'moderate'],
      categories: ['learning'],
      nature: QuestNature.action,
      shortTitle: 'Curiosity List',
    ),
    Phrase(
      text: 'Read the history of something you\'ve taken for granted.',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'sage', 'philosophical', 'reflective'],
      categories: ['learning'],
      nature: QuestNature.action,
      shortTitle: 'History of the Ordinary',
    ),

    // ── Character lines ───────────────────────────────────────────────────────

    Phrase(
      text: 'Don\'t try to memorize it. Just absorb.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['sage', 'reflective', 'cryptic'],
      categories: ['learning'],
    ),
    Phrase(
      text: 'Ask yourself what you didn\'t know an hour ago.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['scholar', 'mentor', 'philosophical'],
      categories: ['learning'],
    ),
    Phrase(
      text: 'The rabbit hole is the point.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['trickster', 'explorer', 'playful', 'rogue'],
      categories: ['learning'],
    ),
    Phrase(
      text: 'The more you learn, the more you see what you don\'t know.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['sage', 'philosophical', 'solemn'],
      categories: ['learning'],
    ),
    Phrase(
      text: 'Take it seriously. Knowledge changes how you see things.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['mentor', 'solemn', 'stoic'],
      categories: ['learning'],
    ),
    Phrase(
      text: 'Learn it like you\'re going to teach it.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['mentor', 'scholar', 'competitive'],
      categories: ['learning'],
    ),
    Phrase(
      text: 'Curiosity is the only engine that matters.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['sage', 'poetic', 'philosophical', 'explorer'],
      categories: ['learning'],
    ),
  ];
}
