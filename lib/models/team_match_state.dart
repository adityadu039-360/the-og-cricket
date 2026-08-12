class TeamMatchState {
  final String teamName;
  final int runs;
  final int wickets;
  final int balls;

  const TeamMatchState({
    required this.teamName,
    this.runs = 0,
    this.wickets = 0,
    this.balls = 0,
  });

  int get overs => balls ~/ 6;

  int get remainingBalls => balls % 6;

  String get score => '$runs/$wickets';

  String get oversDisplay => '$overs.$remainingBalls';

  TeamMatchState copyWith({
    String? teamName,
    int? runs,
    int? wickets,
    int? balls,
  }) {
    return TeamMatchState(
      teamName: teamName ?? this.teamName,
      runs: runs ?? this.runs,
      wickets: wickets ?? this.wickets,
      balls: balls ?? this.balls,
    );
  }

  TeamMatchState addRuns(int value) {
    return copyWith(
      runs: runs + value,
      balls: balls + 1,
    );
  }

  TeamMatchState addWicket() {
    return copyWith(
      wickets: wickets + 1,
      balls: balls + 1,
    );
  }

  @override
  String toString() {
    return '$teamName $score ($oversDisplay overs)';
  }
}