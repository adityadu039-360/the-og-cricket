class MatchFormat {
  final String name;
  final int overs;
  final String description;

  const MatchFormat({
    required this.name,
    required this.overs,
    required this.description,
  });
}

class MatchFormatCatalog {
  static const List<MatchFormat> formats = [
    MatchFormat(
      name: 'T10',
      overs: 10,
      description: 'Fast-paced 10 over match',
    ),
    MatchFormat(
      name: 'T20',
      overs: 20,
      description: 'Standard 20 over match',
    ),
    MatchFormat(
      name: 'ODI',
      overs: 50,
      description: 'One Day International',
    ),
  ];

  static MatchFormat get defaultFormat => formats[1];

  static MatchFormat? findByName(String name) {
    for (final format in formats) {
      if (format.name.toLowerCase() == name.toLowerCase()) {
        return format;
      }
    }

    return null;
  }
}