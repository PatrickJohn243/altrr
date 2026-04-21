/// Predefined phrases for the quest card info tooltip.
class TooltipPhrases {
  TooltipPhrases._();

  // ── Encouragement ─────────────────────────────────────────────────────────

  static const List<String> encouragement = [
    "One step. You're already ahead.",
    "Starting was the hard part. You've done it.",
    "Discomfort means you're growing.",
    "Show up. That's the whole secret.",
    "Small actions repeated become who you are.",
    "You don't need to feel ready. Just move.",
    "This moment will matter.",
    "Do it even when it feels like nothing.",
    "Consistency beats motivation.",
    "Every quest shapes who you're becoming.",
  ];

  // ── Category progress post-text ───────────────────────────────────────────

  static String categoryPostText(int count) {
    if (count == 0) return "This is where it starts.";
    if (count < 5) return "Keep showing up.";
    if (count < 10) return "You're building something.";
    if (count < 20) return "This is becoming part of you.";
    return "ALTRR has noticed.";
  }

  // ── Skip reminders ────────────────────────────────────────────────────────

  static const List<String> skipReminders = [
    "Every skip makes the next one easier.",
    "Skipping is always an option. So is not.",
    "You'll only remember that you skipped.",
  ];
}
