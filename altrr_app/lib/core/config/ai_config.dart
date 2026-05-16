import '../services/ai/ai_model.dart';

class AIConfig {
  AIConfig._();

  static AIModel activeModel = AIModel.gemini;

  static const _geminiKey = String.fromEnvironment('GEMINI_KEY');
  static const _claudeKey = String.fromEnvironment('CLAUDE_KEY');
  static const _openaiKey = String.fromEnvironment('OPENAI_KEY');

  static String keyFor(AIModel model) => switch (model) {
        AIModel.gemini => _geminiKey,
        AIModel.claude => _claudeKey,
        AIModel.openai => _openaiKey,
      };
}
