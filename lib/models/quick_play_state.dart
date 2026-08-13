import 'package:flutter/foundation.dart';

class QuickPlayState extends ChangeNotifier {
  String homeTeam;
  String awayTeam;

  String format;
  int overs;

  String difficulty;
  String venue;

  bool homeSquadConfirmed;
  bool awaySquadConfirmed;

  QuickPlayState({
    this.homeTeam = '',
    this.awayTeam = '',
    this.format = '',
    this.overs = 0,
    this.difficulty = '',
    this.venue = '',
    this.homeSquadConfirmed = false,
    this.awaySquadConfirmed = false,
  });

  bool get teamsReady =>
      homeTeam.trim().isNotEmpty &&
          awayTeam.trim().isNotEmpty &&
          homeTeam != awayTeam;

  bool get matchSettingsReady =>
      format.trim().isNotEmpty &&
          overs > 0 &&
          difficulty.trim().isNotEmpty &&
          venue.trim().isNotEmpty;

  bool get squadsReady =>
      homeSquadConfirmed && awaySquadConfirmed;

  bool get readyForMatch =>
      teamsReady &&
          matchSettingsReady &&
          squadsReady;

  void setTeams({
    required String home,
    required String away,
  }) {
    homeTeam = home;
    awayTeam = away;
    notifyListeners();
  }

  void setMatchSettings({
    required String matchFormat,
    required int matchOvers,
    required String matchDifficulty,
    required String matchVenue,
  }) {
    format = matchFormat;
    overs = matchOvers;
    difficulty = matchDifficulty;
    venue = matchVenue;
    notifyListeners();
  }

  void confirmHomeSquad() {
    homeSquadConfirmed = true;
    notifyListeners();
  }

  void confirmAwaySquad() {
    awaySquadConfirmed = true;
    notifyListeners();
  }

  void resetSquads() {
    homeSquadConfirmed = false;
    awaySquadConfirmed = false;
    notifyListeners();
  }

  void reset() {
    homeTeam = '';
    awayTeam = '';
    format = '';
    overs = 0;
    difficulty = '';
    venue = '';
    homeSquadConfirmed = false;
    awaySquadConfirmed = false;
    notifyListeners();
  }
}