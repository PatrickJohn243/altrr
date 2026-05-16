import 'dart:math';
import 'phrase.dart';

/// Scores phrases against a character's active trait tags and picks a winner.
class TraitScorer {
  static double score(Phrase phrase, List<String> characterTags) {
    double s = phrase.baseWeight;
    for (final tag in phrase.affinityTags) {
      if (characterTags.contains(tag)) s += 1.0;
    }
    return s < 0.1 ? 0.1 : s;
  }

  /// Scores all [candidates], sorts descending, then picks randomly
  /// from the top 3 so the result isn't always identical.
  static Phrase pickWeighted(
    List<Phrase> candidates,
    List<String> characterTags,
    Random rng,
  ) {
    assert(candidates.isNotEmpty, 'pickWeighted called with empty list');

    final scored = candidates
        .map((p) => _Scored(p, score(p, characterTags)))
        .toList()
      ..sort((a, b) => b.score.compareTo(a.score));

    final topN = scored.take(min(3, scored.length)).toList();
    return topN[rng.nextInt(topN.length)].phrase;
  }
}

class _Scored {
  final Phrase phrase;
  final double score;
  _Scored(this.phrase, this.score);
}
