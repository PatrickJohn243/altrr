import '../core/phrase.dart';

enum PromptType { yesNo, options }

class QuestPrompt {
  final String question;
  final PromptType type;
  final List<String>? options;

  /// If true, answer is stored in AppPreferences and never asked again.
  /// If false, asked every time the quest is assigned.
  final bool cacheAnswer;

  const QuestPrompt({
    required this.question,
    required this.type,
    this.options,
    required this.cacheAnswer,
  });
}

/// All prompts keyed by their [Phrase.requires] value.
/// Add a new entry here when adding a phrase with a new requires key.
const Map<String, QuestPrompt> questPrompts = {
  'bike': QuestPrompt(
    question: 'Do you have a bike?',
    type: PromptType.yesNo,
    cacheAnswer: true,
  ),
  'ingredients': QuestPrompt(
    question: 'What do you have at home right now?',
    type: PromptType.options,
    options: ['Full fridge', 'Some stuff', 'Almost empty'],
    cacheAnswer: false,
  ),
  'gym_access': QuestPrompt(
    question: 'Do you have access to a gym?',
    type: PromptType.yesNo,
    cacheAnswer: true,
  ),
  'car': QuestPrompt(
    question: 'Do you have a car available today?',
    type: PromptType.yesNo,
    cacheAnswer: false,
  ),
  'outdoor_space': QuestPrompt(
    question: 'Do you have outdoor space nearby?',
    type: PromptType.yesNo,
    cacheAnswer: true,
  ),
};

/// Returns the prompt for [requires], or null if not found.
QuestPrompt? promptFor(String? requires) {
  if (requires == null) return null;
  return questPrompts[requires];
}
