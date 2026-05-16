import '../../../core/phrase.dart';

class MentalSocial {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'Talk through something that\'s been on your mind with someone you trust.',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'caretaker', 'socialFocus'],
      categories: ['mental'],
      nature: QuestNature.social,
      shortTitle: 'Talk It Out',
    ),
    Phrase(
      text: 'Ask someone a question you\'ve been sitting with. Really listen to the answer.',
      slot: PhraseSlot.action,
      affinityTags: ['sage', 'reflective', 'philosophical'],
      categories: ['mental'],
      nature: QuestNature.social,
      shortTitle: 'Ask and Listen',
    ),
    Phrase(
      text: 'Have a real conversation today. No small talk.',
      slot: PhraseSlot.action,
      affinityTags: ['warrior', 'blunt', 'solemn'],
      categories: ['mental'],
      nature: QuestNature.social,
      shortTitle: 'Real Conversation',
    ),
    Phrase(
      text: 'Ask someone how they\'re actually doing. Give them time to answer.',
      slot: PhraseSlot.action,
      affinityTags: ['caretaker', 'warm', 'gentle', 'solemn'],
      categories: ['mental'],
      nature: QuestNature.social,
      shortTitle: 'Actually Ask',
    ),
    Phrase(
      text: 'Tell someone about something you\'re working through. Be honest.',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'reflective', 'solemn'],
      categories: ['mental'],
      nature: QuestNature.social,
      shortTitle: 'Be Honest',
    ),
    Phrase(
      text: 'Ask someone to challenge your opinion on something you feel strongly about.',
      slot: PhraseSlot.action,
      affinityTags: ['warrior', 'competitive', 'scholar', 'philosophical'],
      categories: ['mental'],
      nature: QuestNature.social,
      shortTitle: 'Challenge Your View',
    ),
    Phrase(
      text: 'Find someone older or wiser than you. Ask them something you\'ve been wondering.',
      slot: PhraseSlot.action,
      affinityTags: ['sage', 'mentor', 'reflective', 'philosophical'],
      categories: ['mental'],
      nature: QuestNature.social,
      shortTitle: 'Seek Wisdom',
    ),
  ];
}
