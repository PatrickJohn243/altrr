class Feature {
  final bool enabled;
  final bool upcoming;
  final bool hidden;

  const Feature({
    this.enabled = true,
    this.upcoming = false,
    this.hidden = false,
  });

  bool get visible  => !hidden;
  bool get disabled => !enabled && !upcoming;
}

class AppFeatures {
  AppFeatures._();

  static const Feature singularQuests    = Feature();
  static const Feature challengeQuests   = Feature();
  static const Feature chainQuests       = Feature();
  static const Feature breakMode         = Feature();
  static const Feature limitedTimeQuests = Feature(upcoming: true);
}
