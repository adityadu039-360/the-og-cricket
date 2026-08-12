class BattingCard {
  final String playerName;
  final int runs;
  final int balls;
  final int fours;
  final int sixes;
  final bool out;

  const BattingCard({
    required this.playerName,
    this.runs = 0,
    this.balls = 0,
    this.fours = 0,
    this.sixes = 0,
    this.out = false,
  });

  double get strikeRate {
    if (balls == 0) {
      return 0;
    }

    return (runs / balls) * 100;
  }

  String get scoreDisplay {
    return '$runs ($balls)';
  }

  BattingCard addRuns(
      int value, {
        int ballsFaced = 1,
        int fours = 0,
        int sixes = 0,
      }) {
    return BattingCard(
      playerName: playerName,
      runs: runs + value,
      balls: balls + ballsFaced,
      fours: this.fours + fours,
      sixes: this.sixes + sixes,
      out: out,
    );
  }

  BattingCard markOut() {
    return BattingCard(
      playerName: playerName,
      runs: runs,
      balls: balls,
      fours: fours,
      sixes: sixes,
      out: true,
    );
  }

  BattingCard copyWith({
    String? playerName,
    int? runs,
    int? balls,
    int? fours,
    int? sixes,
    bool? out,
  }) {
    return BattingCard(
      playerName: playerName ?? this.playerName,
      runs: runs ?? this.runs,
      balls: balls ?? this.balls,
      fours: fours ?? this.fours,
      sixes: sixes ?? this.sixes,
      out: out ?? this.out,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'playerName': playerName,
      'runs': runs,
      'balls': balls,
      'fours': fours,
      'sixes': sixes,
      'out': out,
    };
  }

  factory BattingCard.fromMap(Map<String, dynamic> map) {
    return BattingCard(
      playerName: map['playerName'] as String? ?? '',
      runs: map['runs'] as int? ?? 0,
      balls: map['balls'] as int? ?? 0,
      fours: map['fours'] as int? ?? 0,
      sixes: map['sixes'] as int? ?? 0,
      out: map['out'] as bool? ?? false,
    );
  }
}