enum TournamentType {
  league,
  worldCup,
  knockout,
}

enum TournamentStage {
  groupStage,
  leagueStage,
  playoffs,
  semiFinal,
  finalMatch,
}

class Tournament {
  final String id;
  final String name;
  final String shortName;
  final int season;
  final TournamentType type;
  final List<String> teamIds;
  final int oversPerMatch;
  final bool hasLeagueStage;
  final bool hasPlayoffs;

  const Tournament({
    required this.id,
    required this.name,
    required this.shortName,
    required this.season,
    required this.type,
    required this.teamIds,
    required this.oversPerMatch,
    required this.hasLeagueStage,
    required this.hasPlayoffs,
  });

  int get teamCount => teamIds.length;

  Tournament copyWith({
    String? id,
    String? name,
    String? shortName,
    int? season,
    TournamentType? type,
    List<String>? teamIds,
    int? oversPerMatch,
    bool? hasLeagueStage,
    bool? hasPlayoffs,
  }) {
    return Tournament(
      id: id ?? this.id,
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
      season: season ?? this.season,
      type: type ?? this.type,
      teamIds: teamIds ?? this.teamIds,
      oversPerMatch: oversPerMatch ?? this.oversPerMatch,
      hasLeagueStage: hasLeagueStage ?? this.hasLeagueStage,
      hasPlayoffs: hasPlayoffs ?? this.hasPlayoffs,
    );
  }
}
