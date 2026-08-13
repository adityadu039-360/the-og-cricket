import '../../data/match/difficulty_catalog.dart';
import '../../data/match/match_format_catalog.dart';
import '../../data/match/venue_catalog.dart';
import '../../models/match_config.dart';

class MatchConfigBuilder {
  String _homeTeam = 'India';
  String _awayTeam = 'Australia';

  MatchFormat _format = MatchFormatCatalog.defaultFormat;
  DifficultyLevel _difficulty = DifficultyCatalog.defaultLevel;
  CricketVenue _venue = VenueCatalog.defaultVenue;

  void setTeams({
    required String homeTeam,
    required String awayTeam,
  }) {
    _homeTeam = homeTeam;
    _awayTeam = awayTeam;
  }

  void setFormat(MatchFormat format) {
    _format = format;
  }

  void setDifficulty(DifficultyLevel difficulty) {
    _difficulty = difficulty;
  }

  void setVenue(CricketVenue venue) {
    _venue = venue;
  }

  MatchConfig build() {
    return MatchConfig(
      homeTeam: _homeTeam,
      awayTeam: _awayTeam,
      format: _format.name,
      overs: _format.overs,
      difficulty: _difficulty.name,
      venue: _venue.name,
    );
  }

  void reset() {
    _homeTeam = 'India';
    _awayTeam = 'Australia';
    _format = MatchFormatCatalog.defaultFormat;
    _difficulty = DifficultyCatalog.defaultLevel;
    _venue = VenueCatalog.defaultVenue;
  }
}