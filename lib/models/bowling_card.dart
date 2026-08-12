class BowlingCard {
  final String playerName;
  final int balls;
  final int runsConceded;
  final int wickets;
  final int maidens;

  const BowlingCard({
    required this.playerName,
    this.balls = 0,
    this.runsConceded = 0,
    this.wickets = 0,
    this.maidens = 0,
  });

  int get completedOvers => balls ~/ 6;

  int get ballsInCurrentOver => balls % 6;

  String get oversDisplay {
    return '$completedOvers.$ballsInCurrentOver';
  }

  double get economy {
    if (balls == 0) {
      return 0;
    }

    return (runsConceded / balls) * 6;
  }

  BowlingCard addDelivery({
    int runs = 0,
    int wickets = 0,
  }) {
    return BowlingCard(
      playerName: playerName,
      balls: balls + 1,
      runsConceded: runsConceded + runs,
      wickets: this.wickets + wickets,
      maidens: maidens,
    );
  }

  BowlingCard addMaiden() {
    return BowlingCard(
      playerName: playerName,
      balls: balls + 6,
      runsConceded: runsConceded,
      wickets: wickets,
      maidens: maidens + 1,
    );
  }

  BowlingCard copyWith({
    String? playerName,
    int? balls,
    int? runsConceded,
    int? wickets,
    int? maidens,
  }) {
    return BowlingCard(
      playerName: playerName ?? this.playerName,
      balls: balls ?? this.balls,
      runsConceded: runsConceded ?? this.runsConceded,
      wickets: wickets ?? this.wickets,
      maidens: maidens ?? this.maidens,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'playerName': playerName,
      'balls': balls,
      'runsConceded': runsConceded,
      'wickets': wickets,
      'maidens': maidens,
    };
  }

  factory BowlingCard.fromMap(Map<String, dynamic> map) {
    return BowlingCard(
      playerName: map['playerName'] as String? ?? '',
      balls: map['balls'] as int? ?? 0,
      runsConceded: map['runsConceded'] as int? ?? 0,
      wickets: map['wickets'] as int? ?? 0,
      maidens: map['maidens'] as int? ?? 0,
    );
  }
}