import '../../../shared/generation/core/phrase.dart';

class AIQuestContext {
  final String characterName;
  final String characterEpithet;
  final String category;
  final QuestNature nature;
  final List<String> recentTitles;

  const AIQuestContext({
    required this.characterName,
    required this.characterEpithet,
    required this.category,
    required this.nature,
    this.recentTitles = const [],
  });

  Map<String, dynamic> toJson() => {
        'character': characterName,
        'characterEpithet': characterEpithet,
        'category': category,
        'nature': nature.name,
        'recentTitles': recentTitles,
      };
}
