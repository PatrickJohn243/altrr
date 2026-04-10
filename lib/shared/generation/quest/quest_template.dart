import 'dart:math';
import '../../models/character.dart';
import '../core/phrase.dart';

/// A slot in a quest template, with an optional flag.
///
/// Optional slots have a 40% chance of being skipped by the generator,
/// adding sentence length variety without requiring separate template defs.
class TemplateSlot {
  final PhraseSlot slot;
  final bool optional;
  const TemplateSlot(this.slot, {this.optional = false});
}

/// A sequence of [TemplateSlot]s that defines a quest sentence structure.
///
/// The generator fills each slot with a phrase scored against the character's
/// traits. Which template is chosen depends on [CharacterArchetype] and
/// [CharacterVerbosity].
class QuestTemplate {
  final List<TemplateSlot> slots;
  const QuestTemplate(this.slots);

  /// Picks a template appropriate for [character] using [rng].
  static QuestTemplate pickFor(Character character, Random rng) {
    final options = _forCharacter(character);
    return options[rng.nextInt(options.length)];
  }

  static List<QuestTemplate> _forCharacter(Character character) {
    if (character.verbosity == CharacterVerbosity.brief) return _brief;
    if (character.verbosity == CharacterVerbosity.elaborate) return _elaborate;

    return switch (character.archetype) {
      CharacterArchetype.warrior                                          => _warrior,
      CharacterArchetype.sage                                             => _sage,
      CharacterArchetype.caretaker                                        => _caretaker,
      CharacterArchetype.explorer || CharacterArchetype.rogue             => _explorer,
      CharacterArchetype.scholar                                          => _scholar,
      _                                                                   => _default,
    };
  }

  // ── Brief: action + characterLine, minimal extras ─────────────────────────
  static const _brief = [
    QuestTemplate([
      TemplateSlot(PhraseSlot.action),
      TemplateSlot(PhraseSlot.characterLine),
    ]),
    QuestTemplate([
      TemplateSlot(PhraseSlot.opener, optional: true),
      TemplateSlot(PhraseSlot.action),
      TemplateSlot(PhraseSlot.characterLine),
    ]),
  ];

  // ── Warrior: direct, optional duration, strong characterLine ──────────────
  static const _warrior = [
    QuestTemplate([
      TemplateSlot(PhraseSlot.action),
      TemplateSlot(PhraseSlot.duration, optional: true),
      TemplateSlot(PhraseSlot.characterLine),
    ]),
    QuestTemplate([
      TemplateSlot(PhraseSlot.action),
      TemplateSlot(PhraseSlot.characterLine),
      TemplateSlot(PhraseSlot.closing),
    ]),
  ];

  // ── Sage: opener, setting, reflective characterLine ───────────────────────
  static const _sage = [
    QuestTemplate([
      TemplateSlot(PhraseSlot.opener, optional: true),
      TemplateSlot(PhraseSlot.action),
      TemplateSlot(PhraseSlot.setting, optional: true),
      TemplateSlot(PhraseSlot.characterLine),
    ]),
    QuestTemplate([
      TemplateSlot(PhraseSlot.action),
      TemplateSlot(PhraseSlot.setting, optional: true),
      TemplateSlot(PhraseSlot.characterLine),
      TemplateSlot(PhraseSlot.closing, optional: true),
    ]),
  ];

  // ── Caretaker: warm opener, duration, gentle characterLine ────────────────
  static const _caretaker = [
    QuestTemplate([
      TemplateSlot(PhraseSlot.opener, optional: true),
      TemplateSlot(PhraseSlot.action),
      TemplateSlot(PhraseSlot.duration),
      TemplateSlot(PhraseSlot.characterLine),
    ]),
    QuestTemplate([
      TemplateSlot(PhraseSlot.opener),
      TemplateSlot(PhraseSlot.action),
      TemplateSlot(PhraseSlot.characterLine),
    ]),
  ];

  // ── Explorer/Rogue: opener, action, setting, surprise characterLine ────────
  static const _explorer = [
    QuestTemplate([
      TemplateSlot(PhraseSlot.opener, optional: true),
      TemplateSlot(PhraseSlot.action),
      TemplateSlot(PhraseSlot.setting, optional: true),
      TemplateSlot(PhraseSlot.characterLine),
    ]),
    QuestTemplate([
      TemplateSlot(PhraseSlot.action),
      TemplateSlot(PhraseSlot.characterLine),
      TemplateSlot(PhraseSlot.closing, optional: true),
    ]),
  ];

  // ── Scholar: action, optional setting, characterLine, closing ─────────────
  static const _scholar = [
    QuestTemplate([
      TemplateSlot(PhraseSlot.action),
      TemplateSlot(PhraseSlot.setting, optional: true),
      TemplateSlot(PhraseSlot.characterLine),
      TemplateSlot(PhraseSlot.closing, optional: true),
    ]),
  ];

  // ── Elaborate: all slots, no optionals ────────────────────────────────────
  static const _elaborate = [
    QuestTemplate([
      TemplateSlot(PhraseSlot.opener),
      TemplateSlot(PhraseSlot.action),
      TemplateSlot(PhraseSlot.setting, optional: true),
      TemplateSlot(PhraseSlot.duration, optional: true),
      TemplateSlot(PhraseSlot.characterLine),
      TemplateSlot(PhraseSlot.closing),
    ]),
  ];

  // ── Default: flexible moderate ────────────────────────────────────────────
  static const _default = [
    QuestTemplate([
      TemplateSlot(PhraseSlot.opener, optional: true),
      TemplateSlot(PhraseSlot.action),
      TemplateSlot(PhraseSlot.duration, optional: true),
      TemplateSlot(PhraseSlot.characterLine),
    ]),
    QuestTemplate([
      TemplateSlot(PhraseSlot.action),
      TemplateSlot(PhraseSlot.setting, optional: true),
      TemplateSlot(PhraseSlot.characterLine),
      TemplateSlot(PhraseSlot.closing, optional: true),
    ]),
  ];
}
