enum TooltipContentType { encouragement, progress, skip }

class TooltipContent {
  final TooltipContentType type;
  final String? phrase;
  final String? category;
  final int count;

  const TooltipContent._({
    required this.type,
    this.phrase,
    this.category,
    this.count = 0,
  });

  factory TooltipContent.encouragement(String phrase) =>
      TooltipContent._(type: TooltipContentType.encouragement, phrase: phrase);

  factory TooltipContent.progress(
          {required String category, required int count}) =>
      TooltipContent._(
          type: TooltipContentType.progress, category: category, count: count);

  factory TooltipContent.skip(String phrase) =>
      TooltipContent._(type: TooltipContentType.skip, phrase: phrase);
}
