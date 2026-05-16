import '../title_phrase.dart';

/// Observation / setup fragments — the first half of the subtext.
///
/// Tagged by tier only (category is null = universal).
/// The generator picks one randomly from matching tier entries.
///
/// These are sentence openers or short statements that acknowledge
/// what the user did without over-explaining it.
///
/// To add: append a [TitlePhrase] with slot: TitleSlot.subtextA.

class SubtextA {
  SubtextA._();

  static const List<TitlePhrase> all = [

    // ── Tier 1 ───────────────────────────────────────────────────────────────

    TitlePhrase(text: 'Not perfect —',                          slot: TitleSlot.subtextA, tier: 1),
    TitlePhrase(text: 'You surprised yourself,',               slot: TitleSlot.subtextA, tier: 1),
    TitlePhrase(text: "Most people don't start.",               slot: TitleSlot.subtextA, tier: 1),
    TitlePhrase(text: 'Small. But real.',                       slot: TitleSlot.subtextA, tier: 1),
    TitlePhrase(text: 'You showed up,',                        slot: TitleSlot.subtextA, tier: 1),
    TitlePhrase(text: "It didn't go perfectly.",                slot: TitleSlot.subtextA, tier: 1),
    TitlePhrase(text: 'Once is enough to begin.',              slot: TitleSlot.subtextA, tier: 1),
    TitlePhrase(text: 'Most people start with something easier.', slot: TitleSlot.subtextA, tier: 1),

    // ── Tier 2 ───────────────────────────────────────────────────────────────

    TitlePhrase(text: 'You stopped following the instructions.', slot: TitleSlot.subtextA, tier: 2),
    TitlePhrase(text: 'You started doing it your way.',         slot: TitleSlot.subtextA, tier: 2),
    TitlePhrase(text: "It doesn't feel new anymore.",           slot: TitleSlot.subtextA, tier: 2),
    TitlePhrase(text: 'Nobody asked you to keep going.',        slot: TitleSlot.subtextA, tier: 2),
    TitlePhrase(text: 'You found something worth returning to.', slot: TitleSlot.subtextA, tier: 2),
    TitlePhrase(text: 'The hard part is behind you.',           slot: TitleSlot.subtextA, tier: 2),
    TitlePhrase(text: "You're past the point of quitting.",     slot: TitleSlot.subtextA, tier: 2),
    TitlePhrase(text: 'You kept showing up when you could have stopped.', slot: TitleSlot.subtextA, tier: 2),

    // ── Tier 3 ───────────────────────────────────────────────────────────────

    TitlePhrase(text: 'Nobody taught you this part.',           slot: TitleSlot.subtextA, tier: 3),
    TitlePhrase(text: 'You made it yours.',                     slot: TitleSlot.subtextA, tier: 3),
    TitlePhrase(text: 'Most people stopped long before this.',  slot: TitleSlot.subtextA, tier: 3),
    TitlePhrase(text: "You've been at this a while.",           slot: TitleSlot.subtextA, tier: 3),
    TitlePhrase(text: "It's not something you think about anymore.", slot: TitleSlot.subtextA, tier: 3),
    TitlePhrase(text: 'Nobody told you to go this far.',        slot: TitleSlot.subtextA, tier: 3),
    TitlePhrase(text: "There's no map for where you are.",      slot: TitleSlot.subtextA, tier: 3),
    TitlePhrase(text: 'You went further than the quest asked.', slot: TitleSlot.subtextA, tier: 3),
  ];
}
