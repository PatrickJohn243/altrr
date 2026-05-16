import '../core/phrase.dart';

import 'activities/physical/action.dart';
import 'activities/physical/social.dart';
import 'activities/physical/creative.dart';
import 'activities/physical/explore.dart';
import 'activities/physical/notes.dart';

import 'activities/mental/action.dart';
import 'activities/mental/social.dart';
import 'activities/mental/notes.dart';

import 'activities/social/social.dart';
import 'activities/social/explore.dart';
import 'activities/social/notes.dart';

import 'activities/cooking/action.dart';
import 'activities/cooking/social.dart';
import 'activities/cooking/creative.dart';
import 'activities/cooking/explore.dart';
import 'activities/cooking/notes.dart';

import 'activities/learning/action.dart';
import 'activities/learning/social.dart';
import 'activities/learning/creative.dart';
import 'activities/learning/explore.dart';
import 'activities/learning/notes.dart';

import 'activities/explore/explore.dart';
import 'activities/explore/social.dart';
import 'activities/explore/notes.dart';

import 'activities/hobby/action.dart';
import 'activities/hobby/social.dart';
import 'activities/hobby/creative.dart';
import 'activities/hobby/explore.dart';
import 'activities/hobby/notes.dart';

import 'activities/reflection/action.dart';
import 'activities/reflection/creative.dart';
import 'activities/reflection/notes.dart';

import 'phrases/openers.dart';
import 'phrases/closings.dart';
import 'phrases/universal_lines.dart';

export '../core/phrase.dart';

// ── Phrase pool ───────────────────────────────────────────────────────────────

class PhrasePool {
  static const List<Phrase> all = [
    // Physical
    ...PhysicalAction.phrases,
    ...PhysicalSocial.phrases,
    ...PhysicalCreative.phrases,
    ...PhysicalExplore.phrases,

    // Mental
    ...MentalAction.phrases,
    ...MentalSocial.phrases,

    // Social
    ...SocialAction.phrases,
    ...SocialExplore.phrases,

    // Cooking
    ...CookingAction.phrases,
    ...CookingSocial.phrases,
    ...CookingCreative.phrases,
    ...CookingExplore.phrases,

    // Learning
    ...LearningAction.phrases,
    ...LearningSocial.phrases,
    ...LearningCreative.phrases,
    ...LearningExplore.phrases,

    // Explore
    ...ExploreAction.phrases,
    ...ExploreSocial.phrases,

    // Hobby
    ...HobbyAction.phrases,
    ...HobbySocial.phrases,
    ...HobbyCreative.phrases,
    ...HobbyExplore.phrases,

    // Reflection
    ...ReflectionAction.phrases,
    ...ReflectionCreative.phrases,

    // Universal
    ...SharedOpeners.phrases,
    ...SharedClosings.phrases,
    ...UniversalLines.phrases,
  ];

  /// Returns phrases for [slot], filtered by [category], [nature], and
  /// optionally excluding phrases whose [Phrase.requires] key is in
  /// [excludeRequires].
  ///
  /// Nature filtering only applies to action slot phrases.
  /// Phrases with empty categories list are universal — always included.
  static List<Phrase> forSlot(
    PhraseSlot slot, {
    String? category,
    QuestNature? nature,
    List<String> excludeRequires = const [],
  }) {
    return all.where((p) {
      if (p.slot != slot) return false;
      if (excludeRequires.isNotEmpty &&
          p.requires != null &&
          excludeRequires.contains(p.requires)) return false;
      if (p.categories.isEmpty) return true;
      if (category == null) return true;
      if (!p.categories.contains(category)) return false;
      if (nature != null && slot == PhraseSlot.action && p.nature != null) {
        return p.nature == nature;
      }
      return true;
    }).toList();
  }
}

// ── Character note pool ───────────────────────────────────────────────────────

class CharacterNotePool {
  static List<Phrase> forCategory(String category) {
    return switch (category) {
      'physical'   => PhysicalNotes.phrases,
      'mental'     => MentalNotes.phrases,
      'social'     => SocialNotes.phrases,
      'cooking'    => CookingNotes.phrases,
      'learning'   => LearningNotes.phrases,
      'explore'    => ExploreNotes.phrases,
      'hobby'      => HobbyNotes.phrases,
      'reflection' => ReflectionNotes.phrases,
      _            => const [],
    };
  }
}
