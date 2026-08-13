class DifficultyLevel {
  final String name;
  final int aiReaction;
  final int aiAccuracy;
  final String description;

  const DifficultyLevel({
    required this.name,
    required this.aiReaction,
    required this.aiAccuracy,
    required this.description,
  });
}

class DifficultyCatalog {
  static const List<DifficultyLevel> levels = [
    DifficultyLevel(
      name: 'EASY',
      aiReaction: 40,
      aiAccuracy: 55,
      description: 'Relaxed gameplay for beginners',
    ),
    DifficultyLevel(
      name: 'MEDIUM',
      aiReaction: 65,
      aiAccuracy: 72,
      description: 'Balanced competitive gameplay',
    ),
    DifficultyLevel(
      name: 'HARD',
      aiReaction: 82,
      aiAccuracy: 88,
      description: 'Challenging gameplay for experienced players',
    ),
    DifficultyLevel(
      name: 'LEGEND',
      aiReaction: 95,
      aiAccuracy: 96,
      description: 'Maximum challenge',
    ),
  ];

  static DifficultyLevel get defaultLevel => levels[1];

  static DifficultyLevel? findByName(String name) {
    for (final level in levels) {
      if (level.name.toLowerCase() == name.toLowerCase()) {
        return level;
      }
    }

    return null;
  }
}