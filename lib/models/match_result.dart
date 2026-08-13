class MatchResult {
  final String homeTeam;
  final String awayTeam;

  final int homeRuns;
  final int homeWickets;

  final int awayRuns;
  final int awayWickets;

  final int homeOvers;
  final int awayOvers;

  final String winner;
  final String resultText;

  const MatchResult({
    required this.homeTeam,
    required this.awayTeam,
    required this.homeRuns,
    required this.homeWickets,
    required this.awayRuns,
    required this.awayWickets,
    required this.homeOvers,
    required this.awayOvers,
    required this.winner,
    required this.resultText,
  });

  bool get isDraw => winner.isEmpty;

  String get scoreSummary {
    return '$homeTeam $homeRuns/$homeWickets '
        'vs $awayTeam $awayRuns/$awayWickets';
  }

  Map<String, dynamic> toMap() {
    return {
      'homeTeam': homeTeam,
      'awayTeam': awayTeam,
      'homeRuns': homeRuns,
      'homeWickets': homeWickets,
      'awayRuns': awayRuns,
      'awayWickets': awayWickets,
      'homeOvers': homeOvers,
      'awayOvers': awayOvers,
      'winner': winner,
      'resultText': resultText,
    };
  }

  factory MatchResult.fromMap(Map<String, dynamic> map) {
    return MatchResult(
      homeTeam: map['homeTeam'] as String? ?? '',
      awayTeam: map['awayTeam'] as String? ?? '',
      homeRuns: map['homeRuns'] as int? ?? 0,
      homeWickets: map['homeWickets'] as int? ?? 0,
      awayRuns: map['awayRuns'] as int? ?? 0,
      awayWickets: map['awayWickets'] as int? ?? 0,
      homeOvers: map['homeOvers'] as int? ?? 0,
      awayOvers: map['awayOvers'] as int? ?? 0,
      winner: map['winner'] as String? ?? '',
      resultText: map['resultText'] as String? ?? '',
    );
  }

  MatchResult copyWith({
    String? homeTeam,
    String? awayTeam,
    int? homeRuns,
    int? homeWickets,
    int? awayRuns,
    int? awayWickets,
    int? homeOvers,
    int? awayOvers,
    String? winner,
    String? resultText,
  }) {
    return MatchResult(
      homeTeam: homeTeam ?? this.homeTeam,
      awayTeam: awayTeam ?? this.awayTeam,
      homeRuns: homeRuns ?? this.homeRuns,
      homeWickets: homeWickets ?? this.homeWickets,
      awayRuns: awayRuns ?? this.awayRuns,
      awayWickets: awayWickets ?? this.awayWickets,
      homeOvers: homeOvers ?? this.homeOvers,
      awayOvers: awayOvers ?? this.awayOvers,
      winner: winner ?? this.winner,
      resultText: resultText ?? this.resultText,
    );
  }
}