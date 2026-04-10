// Aggregator — collects all domain and shared phrase pools into a single
// queryable interface. quest_generator.dart imports only this file.
//
// To add phrases: edit the relevant domain or shared file.
// To add a new domain: create its folder, add actions.dart + notes.dart,
// then add the class to PhrasePool.all and CharacterNotePool below.

import '../core/phrase.dart';

import '../activities/physical/actions.dart';
import '../activities/physical/notes.dart';
import '../activities/mental/actions.dart';
import '../activities/mental/notes.dart';
import '../activities/social/actions.dart';
import '../activities/social/notes.dart';
import '../activities/cooking/actions.dart';
import '../activities/cooking/notes.dart';
import '../activities/learning/actions.dart';
import '../activities/learning/notes.dart';
import '../activities/explore/actions.dart';
import '../activities/explore/notes.dart';
import '../activities/hobby/actions.dart';
import '../activities/hobby/notes.dart';
import '../activities/reflection/actions.dart';
import '../activities/reflection/notes.dart';

import '../shared/openers.dart';
import '../shared/closings.dart';
import '../shared/durations.dart';
import '../shared/settings.dart';
import '../shared/universal_lines.dart';

export '../core/phrase.dart';

// ── Phrase pool ───────────────────────────────────────────────────────────────

class PhrasePool {
  static const List<Phrase> all = [
    ...PhysicalActions.phrases,
    ...MentalActions.phrases,
    ...SocialActions.phrases,
    ...CookingActions.phrases,
    ...LearningActions.phrases,
    ...ExploreActions.phrases,
    ...HobbyActions.phrases,
    ...ReflectionActions.phrases,
    ...SharedOpeners.phrases,
    ...SharedClosings.phrases,
    ...SharedDurations.phrases,
    ...SharedSettings.phrases,
    ...UniversalLines.phrases,
  ];

  /// Returns all phrases for [slot], optionally filtered to [category].
  /// Phrases with an empty categories list are universal — always included.
  static List<Phrase> forSlot(PhraseSlot slot, {String? category}) {
    return all.where((p) {
      if (p.slot != slot) return false;
      if (p.categories.isEmpty) return true;
      if (category == null) return true;
      return p.categories.contains(category);
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
