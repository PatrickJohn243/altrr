import '../../../core/phrase.dart';

class HobbySocial {
  static const List<Phrase> phrases = [
    Phrase(
      text: 'Do your hobby with someone else today.',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'socialFocus', 'playful'],
      categories: ['hobby'],
      nature: QuestNature.social,
      shortTitle: 'Hobby Together',
    ),
    Phrase(
      text: 'Share something you\'ve made or created with someone.',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'caretaker', 'reflective'],
      categories: ['hobby'],
      nature: QuestNature.social,
      shortTitle: 'Share Your Work',
    ),
    Phrase(
      text: 'Invite someone into your hobby for an hour. Show them what you do.',
      slot: PhraseSlot.action,
      affinityTags: ['mentor', 'warm', 'socialFocus'],
      categories: ['hobby'],
      nature: QuestNature.social,
      shortTitle: 'Show Someone',
    ),
    Phrase(
      text: 'Ask someone to try something you love. Let them experience it your way.',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'mentor', 'playful', 'socialFocus'],
      categories: ['hobby'],
      nature: QuestNature.social,
      shortTitle: 'Let Them Try',
    ),
    Phrase(
      text: 'Make something as a gift for someone you care about.',
      slot: PhraseSlot.action,
      affinityTags: ['caretaker', 'warm', 'solemn', 'gentle'],
      categories: ['hobby'],
      nature: QuestNature.social,
      shortTitle: 'Make a Gift',
    ),
    Phrase(
      text: 'Find someone who shares your interest. Spend time with them in it.',
      slot: PhraseSlot.action,
      affinityTags: ['warm', 'socialFocus', 'explorer'],
      categories: ['hobby'],
      nature: QuestNature.social,
      shortTitle: 'Shared Interest',
    ),
  ];
}
