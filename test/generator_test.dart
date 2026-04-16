import 'package:flutter_test/flutter_test.dart';
import 'package:altrr_app/shared/generation/character/character_roster.dart';
import 'package:altrr_app/shared/generation/quest/quest_generator.dart';

void main() {
  test('generates quests for all characters and categories', () {
    final date = DateTime(2026, 4, 9);

    for (final definition in CharacterRoster.characters) {
      final character = definition.toCharacter();

      for (final category in definition.domains) {
        final result = QuestGenerator.generate(
          character: character,
          category: category,
          date: date,
        );

        // ignore: avoid_print
        print('\n── ${definition.name} (${definition.epithet}) · $category');
        if (result.characterNote != null) {
          // ignore: avoid_print
          print('  note: ${result.characterNote}');
        }
        // ignore: avoid_print
        print('  title: ${result.title}');
        // ignore: avoid_print
        print('  quest: ${result.questText}');

        expect(result.title, isNotEmpty);
        expect(result.questText, isNotEmpty);
      }
    }
  });

  test('same inputs always produce the same output', () {
    final date = DateTime(2026, 4, 9);
    final definition = CharacterRoster.characters.first;
    final character = definition.toCharacter();
    final category = definition.domains.first;

    final first = QuestGenerator.generate(
      character: character,
      category: category,
      date: date,
    );
    final second = QuestGenerator.generate(
      character: character,
      category: category,
      date: date,
    );

    expect(first.title, equals(second.title));
    expect(first.questText, equals(second.questText));
    expect(first.characterNote, equals(second.characterNote));
  });

  test('different days produce different output', () {
    final definition = CharacterRoster.characters.first;
    final character = definition.toCharacter();
    final category = definition.domains.first;

    final results = List.generate(7, (i) {
      return QuestGenerator.generate(
        character: character,
        category: category,
        date: DateTime(2026, 4, 9 + i),
      ).questText;
    });

    // ignore: avoid_print
    print('\n── 7 days of quests for ${definition.name} · $category');
    for (final r in results) {
      // ignore: avoid_print
      print('  $r');
    }

    // Not all 7 should be identical
    final unique = results.toSet();
    expect(unique.length, greaterThan(1));
  });
}
