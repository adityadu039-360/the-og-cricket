class GameConfig {
  GameConfig._();

  // Match
  static const int defaultOvers = 5;
  static const int maximumOvers = 20;
  static const int ballsPerOver = 6;
  static const int maximumWickets = 10;

  // Teams
  static const int playersPerTeam = 11;

  // Gameplay
  static const int minimumRun = 0;
  static const int maximumNormalRun = 6;

  // Timing
  static const Duration splashDuration = Duration(seconds: 3);
  static const Duration ballAnimationDuration =
  Duration(milliseconds: 700);
  static const Duration shotAnimationDuration =
  Duration(milliseconds: 500);

  // Difficulty
  static const String easy = 'Easy';
  static const String medium = 'Medium';
  static const String hard = 'Hard';

  // Game Version
  static const String version = '1.0.0';
}