import 'tournaments/indian_og_league_tournament.dart';
import '../models/tournament.dart';

class TournamentCatalog {
  TournamentCatalog._();

  static const List<Tournament> availableTournaments = [
    IndianOGLeagueTournament.tournament,
    _worldCup,
  ];

  static const Tournament _worldCup = Tournament(
    id: 'world_cup_2026',
    name: 'World Cup',
    shortName: 'WC',
    season: 2026,
    type: TournamentType.worldCup,
    teamIds: [
      'india',
      'australia',
      'england',
      'south_africa',
      'new_zealand',
      'pakistan',
      'sri_lanka',
      'bangladesh',
      'afghanistan',
      'west_indies',
    ],
    oversPerMatch: 5,
    hasLeagueStage: true,
    hasPlayoffs: true,
  );

  static Tournament? findById(String id) {
    for (final tournament in availableTournaments) {
      if (tournament.id == id) {
        return tournament;
      }
    }

    return null;
  }

  static List<Tournament> get all {
    return List.unmodifiable(availableTournaments);
  }
}