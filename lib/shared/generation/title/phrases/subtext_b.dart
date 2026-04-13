import '../title_phrase.dart';

/// Payoff / sentiment fragments — the second half of the subtext.
///
/// Tagged by tier only (category is null = universal).
/// The generator picks one randomly from matching tier entries,
/// independent of the subtextA pick.
///
/// These are sentence closers or short punchy lines that land the feeling.
/// They complete the thought started by subtextA or stand alone.
///
/// To add: append a [TitlePhrase] with slot: TitleSlot.subtextB.

class SubtextB {
  SubtextB._();

  static const List<TitlePhrase> all = [

    // ── Tier 1 ───────────────────────────────────────────────────────────────

    TitlePhrase(text: "but that's what matters most.",          slot: TitleSlot.subtextB, tier: 1),
    TitlePhrase(text: "didn't you?",                            slot: TitleSlot.subtextB, tier: 1),
    TitlePhrase(text: "That's the whole game.",                 slot: TitleSlot.subtextB, tier: 1),
    TitlePhrase(text: 'Keep going.',                            slot: TitleSlot.subtextB, tier: 1),
    TitlePhrase(text: "That's enough.",                         slot: TitleSlot.subtextB, tier: 1),
    TitlePhrase(text: 'Everything else follows.',               slot: TitleSlot.subtextB, tier: 1),
    TitlePhrase(text: 'It counts.',                             slot: TitleSlot.subtextB, tier: 1),
    TitlePhrase(text: "That's where it starts.",                slot: TitleSlot.subtextB, tier: 1),

    // ── Tier 2 ───────────────────────────────────────────────────────────────

    TitlePhrase(text: 'Nobody noticed but you.',                slot: TitleSlot.subtextB, tier: 2),
    TitlePhrase(text: "That's the whole point.",                slot: TitleSlot.subtextB, tier: 2),
    TitlePhrase(text: "That's worth something.",                slot: TitleSlot.subtextB, tier: 2),
    TitlePhrase(text: 'You already know this.',                 slot: TitleSlot.subtextB, tier: 2),
    TitlePhrase(text: 'Stick with it.',                         slot: TitleSlot.subtextB, tier: 2),
    TitlePhrase(text: "You're further than you think.",         slot: TitleSlot.subtextB, tier: 2),
    TitlePhrase(text: "Don't stop now.",                        slot: TitleSlot.subtextB, tier: 2),
    TitlePhrase(text: 'The best part is still ahead.',          slot: TitleSlot.subtextB, tier: 2),

    // ── Tier 3 ───────────────────────────────────────────────────────────────

    TitlePhrase(text: 'I have nothing to teach you anymore.',   slot: TitleSlot.subtextB, tier: 3),
    TitlePhrase(text: "That's rare.",                           slot: TitleSlot.subtextB, tier: 3),
    TitlePhrase(text: 'Most people only get here in their imagination.', slot: TitleSlot.subtextB, tier: 3),
    TitlePhrase(text: "You've earned this.",                    slot: TitleSlot.subtextB, tier: 3),
    TitlePhrase(text: "This is just the beginning of what comes next.", slot: TitleSlot.subtextB, tier: 3),
    TitlePhrase(text: 'The quest assigned you, not the other way around.', slot: TitleSlot.subtextB, tier: 3),
    TitlePhrase(text: "We didn't expect you here this soon.",   slot: TitleSlot.subtextB, tier: 3),
    TitlePhrase(text: 'Whatever comes next — you are ready.',   slot: TitleSlot.subtextB, tier: 3),
  ];
}
