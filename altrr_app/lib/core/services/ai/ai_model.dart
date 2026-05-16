enum AIModel { gemini, claude, openai }

extension AIModelX on AIModel {
  String get displayName => switch (this) {
        AIModel.gemini => 'Gemini 2.5 Flash',
        AIModel.claude => 'Claude Haiku',
        AIModel.openai => 'GPT-4o Mini',
      };

  String get modelId => switch (this) {
        AIModel.gemini => 'gemini-2.5-flash',
        AIModel.claude => 'claude-haiku-4-5-20251001',
        AIModel.openai => 'gpt-4o-mini',
      };

  String get endpoint => switch (this) {
        AIModel.gemini =>
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent',
        AIModel.claude => 'https://api.anthropic.com/v1/messages',
        AIModel.openai => 'https://api.openai.com/v1/chat/completions',
      };

  AIModel get next => switch (this) {
        AIModel.gemini => AIModel.claude,
        AIModel.claude => AIModel.openai,
        AIModel.openai => AIModel.gemini,
      };
}
