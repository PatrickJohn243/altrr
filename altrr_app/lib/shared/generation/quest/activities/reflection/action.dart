import '../../../core/phrase.dart';

class ReflectionAction {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'Sit in silence for a few minutes. No agenda.',
      slot: PhraseSlot.action,
      affinityTags: ['sage', 'solemn', 'reflective', 'stoic'],
      categories: ['reflection'],
      nature: QuestNature.action,
      shortTitle: 'Sit in Silence',
    ),
    Phrase(
      text: 'Think about one thing you\'re genuinely grateful for today',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'caretaker', 'solemn', 'philosophical'],
      categories: ['reflection'],
      nature: QuestNature.action,
      shortTitle: 'Gratitude Moment',
    ),
    Phrase(
      text: 'Read something meaningful to you',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'solemn', 'sage'],
      categories: ['reflection'],
      nature: QuestNature.action,
      shortTitle: 'Meaningful Read',
    ),
    Phrase(
      text: 'Think back on the last 7 days. What actually mattered?',
      slot: PhraseSlot.action,
      affinityTags: ['sage', 'reflective', 'solemn', 'philosophical'],
      categories: ['reflection'],
      nature: QuestNature.action,
      shortTitle: 'Week Review',
    ),
    Phrase(
      text: 'Think about one decision you made this week. Was it the right one?',
      slot: PhraseSlot.action,
      affinityTags: ['mentor', 'reflective', 'stoic', 'solemn'],
      categories: ['reflection'],
      nature: QuestNature.action,
      shortTitle: 'Decision Check',
    ),
    Phrase(
      text: 'Name three things that drained you this week and three that fed you.',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'reflective', 'caretaker', 'moderate'],
      categories: ['reflection'],
      nature: QuestNature.action,
      shortTitle: 'Energy Map',
    ),
    Phrase(
      text: 'Sit with a memory from your past. Don\'t judge it — just revisit it.',
      slot: PhraseSlot.action,
      affinityTags: ['sage', 'reflective', 'solemn', 'philosophical'],
      categories: ['reflection'],
      nature: QuestNature.action,
      shortTitle: 'Revisit a Memory',
    ),
    Phrase(
      text: 'Think about what you\'ve been avoiding. Just acknowledge it exists.',
      slot: PhraseSlot.action,
      affinityTags: ['warrior', 'solemn', 'stoic', 'sage'],
      categories: ['reflection'],
      nature: QuestNature.action,
      shortTitle: 'Name What You\'re Avoiding',
    ),
    Phrase(
      text: 'Think about what kind of person you want to be. Not what you want to have.',
      slot: PhraseSlot.action,
      affinityTags: ['sage', 'philosophical', 'mentor', 'solemn'],
      categories: ['reflection'],
      nature: QuestNature.action,
      shortTitle: 'Identity Check',
    ),
    Phrase(
      text: 'Notice how you felt today. Not what happened — how you felt.',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'caretaker', 'gentle', 'reflective'],
      categories: ['reflection'],
      nature: QuestNature.action,
      shortTitle: 'Feelings Audit',
    ),

    // ── Character lines ───────────────────────────────────────────────────────

    Phrase(
      text: 'No phone. No input. Just you.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['warrior', 'stoic', 'blunt', 'solemn'],
      categories: ['reflection'],
    ),
    Phrase(
      text: 'Let what surfaces, surface.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['sage', 'cryptic', 'reflective', 'philosophical'],
      categories: ['reflection'],
    ),
    Phrase(
      text: 'You already know what needs attention.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['sage', 'solemn', 'stoic', 'mentor'],
      categories: ['reflection'],
    ),
    Phrase(
      text: 'Stillness is harder than it looks. Stay in it.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['warrior', 'solemn', 'stoic'],
      categories: ['reflection'],
    ),
    Phrase(
      text: 'The answer is usually already there. You just haven\'t asked.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['sage', 'cryptic', 'philosophical'],
      categories: ['reflection'],
    ),
    Phrase(
      text: 'You carry more than you admit. Put some of it down.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['warm', 'caretaker', 'solemn', 'gentle'],
      categories: ['reflection'],
    ),
    Phrase(
      text: 'Reflection is how you make meaning, not just memories.',
      slot: PhraseSlot.characterLine,
      affinityTags: ['sage', 'philosophical', 'poetic'],
      categories: ['reflection'],
    ),
  ];
}
