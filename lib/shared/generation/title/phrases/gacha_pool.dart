/// Predefined gacha title drops.
///
/// These are fixed title + subtext pairs — no generation, no assembly.
/// Each entry is a one-time drop. Once a user earns one it is never
/// awarded again. The list is intentionally weird, surprising, and funny.
///
/// To add a new gacha title: append a [GachaTitle] to [GachaTitlePool.titles].
/// Order does not matter — the picker selects randomly from unclaimed entries.

class GachaTitle {
  final String titleText;
  final String subtext;

  const GachaTitle({required this.titleText, required this.subtext});
}

class GachaTitlePool {
  GachaTitlePool._();

  static const List<GachaTitle> titles = [
    GachaTitle(
      titleText: 'Error 404',
      subtext: "You weren't supposed to get this. But here we are.",
    ),
    GachaTitle(
      titleText: 'NaN',
      subtext: 'The system tried to calculate your worth. It failed.',
    ),
    GachaTitle(
      titleText: 'The Glitch',
      subtext: 'Something went wrong. Or maybe everything went right.',
    ),
    GachaTitle(
      titleText: 'Undefined',
      subtext: 'We have no category for what you just did.',
    ),
    GachaTitle(
      titleText: 'Null Pointer',
      subtext: "You reached somewhere the code didn't expect.",
    ),
    GachaTitle(
      titleText: 'Access Granted',
      subtext: "Nobody was supposed to let you in here.",
    ),
    GachaTitle(
      titleText: 'The Anomaly',
      subtext: 'You exist outside the expected distribution.',
    ),
    GachaTitle(
      titleText: 'Wrong Timeline',
      subtext: "This title belongs to someone else. Apparently that's you now.",
    ),
    GachaTitle(
      titleText: 'Hidden Track',
      subtext: "You weren't supposed to find this.",
    ),
    GachaTitle(
      titleText: 'Certified Menace',
      subtext: 'The algorithm flagged you. We agreed.',
    ),
    GachaTitle(
      titleText: 'The Side Effect',
      subtext: "This wasn't in the documentation.",
    ),
    GachaTitle(
      titleText: 'Stack Overflow',
      subtext: "You did too much. The system couldn't keep up.",
    ),
    GachaTitle(
      titleText: 'Unhandled Exception',
      subtext: "We wrote a handler for everything. Not this.",
    ),
    GachaTitle(
      titleText: 'Root Access',
      subtext: 'How did you even get here.',
    ),
    GachaTitle(
      titleText: 'The Easter Egg',
      subtext: "Someone hid this here years ago. Today it's yours.",
    ),
    GachaTitle(
      titleText: 'Corrupted Save',
      subtext: "Your data doesn't make sense. Neither does this title.",
    ),
    GachaTitle(
      titleText: 'Divine RNG',
      subtext: '1%. You hit it. Go buy a lottery ticket.',
    ),
    GachaTitle(
      titleText: 'Off the Record',
      subtext: 'This conversation never happened.',
    ),
    GachaTitle(
      titleText: 'Final Boss',
      subtext: "You weren't supposed to make it this far.",
    ),
    GachaTitle(
      titleText: 'Out of Bounds',
      subtext: 'The map ended. You kept walking.',
    ),
  ];
}
