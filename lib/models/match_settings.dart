class MatchSettings {
  final String format;
  final int overs;
  final String difficulty;
  final String venue;
  final bool dayNight;

  const MatchSettings({
    required this.format,
    required this.overs,
    required this.difficulty,
    required this.venue,
    required this.dayNight,
  });

  MatchSettings copyWith({
    String? format,
    int? overs,
    String? difficulty,
    String? venue,
    bool? dayNight,
  }) {
    return MatchSettings(
      format: format ?? this.format,
      overs: overs ?? this.overs,
      difficulty: difficulty ?? this.difficulty,
      venue: venue ?? this.venue,
      dayNight: dayNight ?? this.dayNight,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'format': format,
      'overs': overs,
      'difficulty': difficulty,
      'venue': venue,
      'dayNight': dayNight,
    };
  }

  factory MatchSettings.fromMap(Map<String, dynamic> map) {
    return MatchSettings(
      format: map['format'] as String? ?? 'T20',
      overs: map['overs'] as int? ?? 20,
      difficulty: map['difficulty'] as String? ?? 'NORMAL',
      venue: map['venue'] as String? ?? 'OG STADIUM',
      dayNight: map['dayNight'] as bool? ?? true,
    );
  }
}