class InningsState {
  final int runs;
  final int wickets;
  final int balls;
  final int totalBalls;

  const InningsState({
    this.runs = 0,
    this.wickets = 0,
    this.balls = 0,
    this.totalBalls = 120,
  });

  int get completedOvers => balls ~/ 6;

  int get ballsInCurrentOver => balls % 6;

  double get overs {
    return completedOvers + (ballsInCurrentOver / 10);
  }

  bool get isAllOut => wickets >= 10;

  bool get isCompleted => balls >= totalBalls || isAllOut;

  InningsState addRuns(int value) {
    return InningsState(
      runs: runs + value,
      wickets: wickets,
      balls: balls,
      totalBalls: totalBalls,
    );
  }

  InningsState addBall() {
    return InningsState(
      runs: runs,
      wickets: wickets,
      balls: balls + 1,
      totalBalls: totalBalls,
    );
  }

  InningsState addWicket() {
    return InningsState(
      runs: runs,
      wickets: wickets + 1,
      balls: balls + 1,
      totalBalls: totalBalls,
    );
  }

  InningsState copyWith({
    int? runs,
    int? wickets,
    int? balls,
    int? totalBalls,
  }) {
    return InningsState(
      runs: runs ?? this.runs,
      wickets: wickets ?? this.wickets,
      balls: balls ?? this.balls,
      totalBalls: totalBalls ?? this.totalBalls,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'runs': runs,
      'wickets': wickets,
      'balls': balls,
      'totalBalls': totalBalls,
    };
  }

  factory InningsState.fromMap(Map<String, dynamic> map) {
    return InningsState(
      runs: map['runs'] as int? ?? 0,
      wickets: map['wickets'] as int? ?? 0,
      balls: map['balls'] as int? ?? 0,
      totalBalls: map['totalBalls'] as int? ?? 120,
    );
  }
}