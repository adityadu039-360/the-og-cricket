enum TossDecision {
  bat,
  bowl,
}

enum TossWinner {
  home,
  away,
}

class TossConfig {
  final TossWinner winner;
  final TossDecision decision;

  const TossConfig({
    required this.winner,
    required this.decision,
  });

  String get winnerLabel {
    switch (winner) {
      case TossWinner.home:
        return 'HOME TEAM';
      case TossWinner.away:
        return 'AWAY TEAM';
    }
  }

  String get decisionLabel {
    switch (decision) {
      case TossDecision.bat:
        return 'BAT FIRST';
      case TossDecision.bowl:
        return 'BOWL FIRST';
    }
  }

  TossConfig copyWith({
    TossWinner? winner,
    TossDecision? decision,
  }) {
    return TossConfig(
      winner: winner ?? this.winner,
      decision: decision ?? this.decision,
    );
  }

  @override
  String toString() {
    return 'TossConfig('
        'winner: $winner, '
        'decision: $decision'
        ')';
  }
}