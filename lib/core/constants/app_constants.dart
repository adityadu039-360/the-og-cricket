class AppConstants {
  AppConstants._();

  // App Information
  static const String appName = 'The OG Cricket';
  static const String appVersion = '1.0.0';
  static const String appTagline = 'PLAY. COMPETE. BECOME THE OG.';

  // Game Configuration
  static const int defaultOvers = 5;
  static const int maximumOvers = 20;
  static const int defaultWickets = 10;

  // Match Modes
  static const String quickMatch = 'Quick Match';
  static const String careerMode = 'Career';
  static const String tournamentMode = 'Tournament';
  static const String practiceMode = 'Practice';

  // Gameplay
  static const int maximumPlayersPerTeam = 11;
  static const int minimumPlayersPerTeam = 2;
  static const int ballsPerOver = 6;

  // Animation Durations
  static const int fastAnimationMilliseconds = 200;
  static const int normalAnimationMilliseconds = 350;
  static const int slowAnimationMilliseconds = 700;

  // UI
  static const double defaultBorderRadius = 16.0;
  static const double largeBorderRadius = 22.0;
  static const double defaultHorizontalPadding = 24.0;

  // Version / Development
  static const String developmentStage = 'Alpha';
}
