import '../../core/phrase.dart';

class LearningActions {
  static const List<Phrase> phrases = [
    // ── Actions ──────────────────────────────────────────────────────────────

    Phrase(
      text: 'Learn one thing you know nothing about',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'mentor', 'explorer'],
      categories: ['learning'],
      shortTitle: 'Learn Something New',
    ),
    Phrase(
      text: 'Watch a short tutorial on something unrelated to your work',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'explorer', 'playful'],
      categories: ['learning'],
      shortTitle: 'Quick Tutorial',
    ),
    Phrase(
      text: 'Read about a field you\'ve always been curious about',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'sage', 'philosophical'],
      categories: ['learning'],
      shortTitle: 'Curious Reading',
    ),
    Phrase(
      text: 'Find one fact about something you use every day',
      slot: PhraseSlot.action,
      affinityTags: ['scholar', 'trickster', 'playful'],
      categories: ['learning'],
      shortTitle: 'Everyday Fact',
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
  ];
}
