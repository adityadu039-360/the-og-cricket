class MatchResult {
  final String homeTeam;
  final String awayTeam;
  final int homeScore;
  final int awayScore;
  final int homeWickets;
  final int awayWickets;
  final int homeOvers;
  final int awayOvers;

  const MatchResult({
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
    required this.homeWickets,
    required this.awayWickets,
    required this.homeOvers,
    required this.awayOvers,
  });

  String get winner {
    if (homeScore > awayScore) {
      return homeTeam;
    }

    if (awayScore > homeScore) {
      return awayTeam;
    }

    return 'DRAW';
  }

  bool get isDraw => homeScore == awayScore;

  Map<String, dynamic> toMap() {
    return {
      'homeTeam': homeTeam,
      'awayTeam': awayTeam,
      'homeScore': homeScore,
      'awayScore': awayScore,
      'homeWickets': homeWickets,
      'awayWickets': awayWickets,
      'homeOvers': homeOvers,
      'awayOvers': awayOvers,
    };
  }

  factory MatchResult.fromMap(Map<String, dynamic> map) {
    return MatchResult(
      homeTeam: map['homeTeam'] as String? ?? '',
      awayTeam: map['awayTeam'] as String? ?? '',
      homeScore: map['homeScore'] as int? ?? 0,
      awayScore: map['awayScore'] as int? ?? 0,
      homeWickets: map['homeWickets'] as int? ?? 0,
      awayWickets: map['awayWickets'] as int? ?? 0,
      homeOvers: map['homeOvers'] as int? ?? 0,
      awayOvers: map['awayOvers'] as int? ?? 0,
    );
  }
}