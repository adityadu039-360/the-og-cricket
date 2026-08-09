import 'indian_og_league_2026.dart';
import 'world_cup.dart';
import '../models/cricket_team.dart';

class TeamCatalog {
  TeamCatalog._();

  static List<CricketTeam> get indianOGLeagueTeams {
    return List.unmodifiable(
      IndianOGLeague2026.teams,
    );
  }

  static List<CricketTeam> get worldCupTeams {
    return List.unmodifiable(
      WorldCup.teams,
    );
  }

  static List<CricketTeam> get allTeams {
    final Map<String, CricketTeam> uniqueTeams = {};

    for (final team in indianOGLeagueTeams) {
      uniqueTeams[team.id] = team;
    }

    for (final team in worldCupTeams) {
      uniqueTeams[team.id] = team;
    }

    return List.unmodifiable(
      uniqueTeams.values,
    );
  }

  static CricketTeam? findById(String id) {
    for (final team in allTeams) {
      if (team.id == id) {
        return team;
      }
    }

    return null;
  }

  static List<CricketTeam> search(String query) {
    final searchText = query.trim().toLowerCase();

    if (searchText.isEmpty) {
      return allTeams;
    }

    return allTeams.where((team) {
      return team.name.toLowerCase().contains(searchText) ||
          team.shortName.toLowerCase().contains(searchText) ||
          team.city.toLowerCase().contains(searchText);
    }).toList();
  }
}