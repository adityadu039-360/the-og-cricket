class MatchConfig {
  final String homeTeam;
  final String awayTeam;
  final String format;
  final int overs;
  final String difficulty;
  final String venue;

  const MatchConfig({
    required this.homeTeam,
    required this.awayTeam,
    required this.format,
    required this.overs,
    required this.difficulty,
    required this.venue,
  });

  MatchConfig copyWith({
    String? homeTeam,
    String? awayTeam,
    String? format,
    int? overs,
    String? difficulty,
    String? venue,
  }) {
    return MatchConfig(
      homeTeam: homeTeam ?? this.homeTeam,
      awayTeam: awayTeam ?? this.awayTeam,
      format: format ?? this.format,
      overs: overs ?? this.overs,
      difficulty: difficulty ?? this.difficulty,
      venue: venue ?? this.venue,
    );
  }

  @override
  String toString() {
    return 'MatchConfig('
        'homeTeam: $homeTeam, '
        'awayTeam: $awayTeam, '
        'format: $format, '
        'overs: $overs, '
        'difficulty: $difficulty, '
        'venue: $venue'
        ')';
  }
}