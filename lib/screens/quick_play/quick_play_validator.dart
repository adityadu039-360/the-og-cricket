class QuickPlayValidator {
  const QuickPlayValidator._();

  static String? validateTeams({
    required String homeTeam,
    required String awayTeam,
  }) {
    final home = homeTeam.trim();
    final away = awayTeam.trim();

    if (home.isEmpty) {
      return 'Please select the home team.';
    }

    if (away.isEmpty) {
      return 'Please select the away team.';
    }

    if (home == away) {
      return 'Home and away teams must be different.';
    }

    return null;
  }

  static String? validateOvers(int overs) {
    if (overs <= 0) {
      return 'Please select the number of overs.';
    }

    return null;
  }

  static String? validateFormat(String format) {
    if (format.trim().isEmpty) {
      return 'Please select a match format.';
    }

    return null;
  }

  static String? validateDifficulty(String difficulty) {
    if (difficulty.trim().isEmpty) {
      return 'Please select the difficulty.';
    }

    return null;
  }

  static String? validateVenue(String venue) {
    if (venue.trim().isEmpty) {
      return 'Please select a venue.';
    }

    return null;
  }

  static bool isReady({
    required String homeTeam,
    required String awayTeam,
    required int overs,
    required String format,
    required String difficulty,
    required String venue,
  }) {
    return validateTeams(
      homeTeam: homeTeam,
      awayTeam: awayTeam,
    ) ==
        null &&
        validateOvers(overs) == null &&
        validateFormat(format) == null &&
        validateDifficulty(difficulty) == null &&
        validateVenue(venue) == null;
  }
}