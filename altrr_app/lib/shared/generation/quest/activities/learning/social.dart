import '../../../core/phrase.dart';

class LearningSocial {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'Ask someone who knows something you don\'t to teach you. Really listen.',
      slot: PhraseSlot.action,
      affinityTags: ['mentor', 'warm', 'philosophical'],
      categories: ['learning'],
      nature: QuestNature.social,
      shortTitle: 'Learn from Someone',
    ),
    Phrase(
      text: 'Teach someone something you recently learned. See how much you retained.',
      slot: PhraseSlot.action,
      affinityTags: ['mentor', 'scholar', 'socialFocus'],
      categories: ['learning'],
      nature: QuestNature.social,
      shortTitle: 'Teach It Back',
    ),
    Phrase(
      text: 'Have a conversation about a topic you\'re actively learning about.',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'philosophical', 'socialFocus'],
      categories: ['learning'],
      nature: QuestNature.social,
      shortTitle: 'Learning Conversation',
    ),
    Phrase(
      text: 'Find someone who disagrees with you on something. Ask why. Listen.',
      slot: PhraseSlot.action,
      affinityTags: ['warrior', 'scholar', 'solemn', 'philosophical'],
      categories: ['learning'],
      nature: QuestNature.social,
      shortTitle: 'Hear the Other Side',
    ),
    Phrase(
      text: 'Recommend something you\'ve been learning to someone else. Explain what made it click.',
      slot: PhraseSlot.action,
      affinityTags: ['mentor', 'warm', 'socialFocus'],
      categories: ['learning'],
      nature: QuestNature.social,
      shortTitle: 'Recommend and Explain',
    ),
    Phrase(
      text: 'Interview someone older than you about something they know deeply.',
      slot: PhraseSlot.action,
      affinityTags: ['sage', 'reflective', 'warm', 'philosophical'],
      categories: ['learning'],
      nature: QuestNature.social,
      shortTitle: 'The Interview',
    ),
  ];
}
