class CricketPlayer {
  final String name;
  final String role;

  const CricketPlayer({
    required this.name,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'role': role,
    };
  }

  factory CricketPlayer.fromMap(
      Map<String, dynamic> map,
      ) {
    return CricketPlayer(
      name: map['name'] as String,
      role: map['role'] as String,
    );
  }
}