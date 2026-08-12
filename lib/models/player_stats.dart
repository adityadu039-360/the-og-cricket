class PlayerStats {
  final String playerName;

  final int runs;
  final int ballsFaced;
  final int fours;
  final int sixes;

  final int wickets;
  final int runsConceded;
  final int ballsBowled;

  const PlayerStats({
    required this.playerName,
    this.runs = 0,
    this.ballsFaced = 0,
    this.fours = 0,
    this.sixes = 0,
    this.wickets = 0,
    this.runsConceded = 0,
    this.ballsBowled = 0,
  });

  double get strikeRate {
    if (ballsFaced == 0) {
      return 0;
    }

    return (runs / ballsFaced) * 100;
  }

  double get economyRate {
    if (ballsBowled == 0) {
      return 0;
    }

    return (runsConceded / ballsBowled) * 6;
  }

  PlayerStats addBattingRuns(
      int value, {
        int balls = 1,
        int fours = 0,
        int sixes = 0,
      }) {
    return PlayerStats(
      playerName: playerName,
      runs: runs + value,
      ballsFaced: ballsFaced + balls,
      fours: this.fours + fours,
      sixes: this.sixes + sixes,
      wickets: wickets,
      runsConceded: runsConceded,
      ballsBowled: ballsBowled,
    );
  }

  PlayerStats addBowlingBall({
    int runs = 0,
    int wickets = 0,
  }) {
    return PlayerStats(
      playerName: playerName,
      runs: this.runs,
      ballsFaced: ballsFaced,
      fours: fours,
      sixes: sixes,
      wickets: this.wickets + wickets,
      runsConceded: runsConceded + runs,
      ballsBowled: ballsBowled + 1,
    );
  }

  PlayerStats copyWith({
    String? playerName,
    int? runs,
    int? ballsFaced,
    int? fours,
    int? sixes,
    int? wickets,
    int? runsConceded,
    int? ballsBowled,
  }) {
    return PlayerStats(
      playerName: playerName ?? this.playerName,
      runs: runs ?? this.runs,
      ballsFaced: ballsFaced ?? this.ballsFaced,
      fours: fours ?? this.fours,
      sixes: sixes ?? this.sixes,
      wickets: wickets ?? this.wickets,
      runsConceded: runsConceded ?? this.runsConceded,
      ballsBowled: ballsBowled ?? this.ballsBowled,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'playerName': playerName,
      'runs': runs,
      'ballsFaced': ballsFaced,
      'fours': fours,
      'sixes': sixes,
      'wickets': wickets,
      'runsConceded': runsConceded,
      'ballsBowled': ballsBowled,
    };
  }

  factory PlayerStats.fromMap(Map<String, dynamic> map) {
    return PlayerStats(
      playerName: map['playerName'] as String? ?? '',
      runs: map['runs'] as int? ?? 0,
      ballsFaced: map['ballsFaced'] as int? ?? 0,
      fours: map['fours'] as int? ?? 0,
      sixes: map['sixes'] as int? ?? 0,
      wickets: map['wickets'] as int? ?? 0,
      runsConceded: map['runsConceded'] as int? ?? 0,
      ballsBowled: map['ballsBowled'] as int? ?? 0,
    );
  }
}