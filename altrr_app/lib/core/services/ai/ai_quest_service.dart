import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../../shared/generation/core/phrase.dart';
import '../../../shared/generation/quest/quest_generator.dart';
import '../../config/ai_config.dart';
import 'ai_model.dart';
import 'ai_prompt_builder.dart';
import 'ai_quest_context.dart';

class AIQuestService {
  AIQuestService._();

  static String? debugLastError;

  static Future<GeneratedQuest?> generate({
    required AIModel model,
    required AIQuestContext context,
  }) async {
    final key = AIConfig.keyFor(model);
    if (key.isEmpty) {
      if (kDebugMode) debugLastError = 'No API key for ${model.name}';
      return null;
    }

    try {
      if (kDebugMode) debugLastError = null;
      final text = await _call(model: model, key: key, context: context)
          .timeout(const Duration(seconds: 5));
      return _parse(text, context);
    } catch (e) {
      if (kDebugMode) {
        debugLastError = e.toString();
        debugPrint('[AIQuestService] $e');
      }
      return null;
    }
  }

  static Future<String> _call({
    required AIModel model,
    required String key,
    required AIQuestContext context,
  }) async {
    final userMsg = AIPromptBuilder.userMessage(context);

    return switch (model) {
      AIModel.gemini => _callGemini(key: key, userMsg: userMsg),
      AIModel.claude => _callClaude(key: key, userMsg: userMsg),
      AIModel.openai => _callOpenAI(key: key, userMsg: userMsg),
    };
  }

  static Future<String> _callGemini({
    required String key,
    required String userMsg,
  }) async {
    final uri = Uri.parse('${AIModel.gemini.endpoint}?key=$key');
    final res = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'system_instruction': {
          'parts': [
            {'text': AIPromptBuilder.system}
          ]
        },
        'contents': [
          {
            'parts': [
              {'text': userMsg}
            ]
          }
        ],
        'generationConfig': {'temperature': 0.9, 'maxOutputTokens': 1024},
      }),
    );
    _assertOk(res);
    final body = jsonDecode(res.body) as Map<String, dynamic>;
    return body['candidates'][0]['content']['parts'][0]['text'] as String;
  }

  static Future<String> _callClaude({
    required String key,
    required String userMsg,
  }) async {
    final res = await http.post(
      Uri.parse(AIModel.claude.endpoint),
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': key,
        'anthropic-version': '2023-06-01',
      },
      body: jsonEncode({
        'model': AIModel.claude.modelId,
        'max_tokens': 300,
        'system': AIPromptBuilder.system,
        'messages': [
          {'role': 'user', 'content': userMsg}
        ],
      }),
    );
    _assertOk(res);
    final body = jsonDecode(res.body) as Map<String, dynamic>;
    return body['content'][0]['text'] as String;
  }

  static Future<String> _callOpenAI({
    required String key,
    required String userMsg,
  }) async {
    final res = await http.post(
      Uri.parse(AIModel.openai.endpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $key',
      },
      body: jsonEncode({
        'model': AIModel.openai.modelId,
        'max_tokens': 300,
        'messages': [
          {'role': 'system', 'content': AIPromptBuilder.system},
          {'role': 'user', 'content': userMsg},
        ],
      }),
    );
    _assertOk(res);
    final body = jsonDecode(res.body) as Map<String, dynamic>;
    return body['choices'][0]['message']['content'] as String;
  }

  static void _assertOk(http.Response res) {
    if (res.statusCode < 200 || res.statusCode >= 300) {
      final body = res.body.length > 300 ? '${res.body.substring(0, 300)}…' : res.body;
      throw Exception('${res.statusCode}: $body');
    }
  }

  static GeneratedQuest? _parse(String text, AIQuestContext context) {
    if (kDebugMode) debugPrint('[AIQuestService] raw response: $text');
    try {
      final json = jsonDecode(_extractJson(text)) as Map<String, dynamic>;
      final title = json['title'] as String? ?? '';
      final questText = json['questText'] as String? ?? '';
      final characterNote = json['characterNote'] as String?;
      final natureStr = json['nature'] as String? ?? '';
      final nature = QuestNature.values.firstWhere(
        (n) => n.name == natureStr,
        orElse: () => context.nature,
      );

      if (title.isEmpty || questText.isEmpty) return null;

      return GeneratedQuest(
        title: title,
        questText: questText,
        nature: nature,
        characterNote: characterNote,
        requires: null,
      );
    } catch (e) {
      if (kDebugMode) debugPrint('[AIQuestService] parse error: $e');
      return null;
    }
  }

  static String _extractJson(String text) {
    final stripped =
        text.replaceAll(RegExp(r'```(?:json)?\s*|\s*```'), '').trim();
    final start = stripped.indexOf('{');
    final end = stripped.lastIndexOf('}');
    if (start == -1 || end == -1 || end <= start) return stripped;
    return stripped.substring(start, end + 1);
  }
}
