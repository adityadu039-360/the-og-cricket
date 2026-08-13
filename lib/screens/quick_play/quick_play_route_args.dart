class QuickPlayRouteArgs {
  final String homeTeam;
  final String awayTeam;

  const QuickPlayRouteArgs({
    required this.homeTeam,
    required this.awayTeam,
  });

  bool get hasValidTeams {
    final home = homeTeam.trim();
    final away = awayTeam.trim();

    return home.isNotEmpty &&
        away.isNotEmpty &&
        home != away;
  }

  QuickPlayRouteArgs copyWith({
    String? homeTeam,
    String? awayTeam,
  }) {
    return QuickPlayRouteArgs(
      homeTeam: homeTeam ?? this.homeTeam,
      awayTeam: awayTeam ?? this.awayTeam,
    );
  }

  Map<String, String> toMap() {
    return {
      'homeTeam': homeTeam,
      'awayTeam': awayTeam,
    };
  }

  factory QuickPlayRouteArgs.fromMap(
      Map<String, dynamic> map,
      ) {
    return QuickPlayRouteArgs(
      homeTeam: map['homeTeam'] as String? ?? '',
      awayTeam: map['awayTeam'] as String? ?? '',
    );
  }
}