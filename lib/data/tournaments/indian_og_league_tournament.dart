import '../../models/tournament.dart';

class IndianOGLeagueTournament {
  IndianOGLeagueTournament._();

  static const Tournament tournament = Tournament(
    id: 'indian_og_league_2026',
    name: 'Indian OG League',
    shortName: 'IOL',
    season: 2026,
    type: TournamentType.league,

    teamIds: [
      'chennai_thunderhawks',
      'mumbai_stormriders',
      'bengaluru_blazeforce',
      'kolkata_nightblazers',
      'hyderabad_skyhawks',
      'rajasthan_royalsword',
      'delhi_firehawks',
      'punjab_lionhearts',
      'lucknow_wolfpack',
      'gujarat_titanshield',
    ],

    // Short-format default for the first playable version.
    oversPerMatch: 5,

    hasLeagueStage: true,
    hasPlayoffs: true,
  );
}