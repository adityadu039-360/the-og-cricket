import 'package:flutter/foundation.dart';

@immutable
class MatchConfig {
  final String homeTeam;
  final String awayTeam;

  final int overs;

  final String difficulty;
  final String weather;
  final String rain;
  final String ground;

  final List<String> homePlayingXI;
  final List<String> awayPlayingXI;

  const MatchConfig({
    required this.homeTeam,
    required this.awayTeam,
    required this.overs,
    required this.difficulty,
    required this.weather,
    required this.rain,
    required this.ground,
    this.homePlayingXI = const [],
    this.awayPlayingXI = const [],
  });

  MatchConfig copyWith({
    String? homeTeam,
    String? awayTeam,
    int? overs,
    String? difficulty,
    String? weather,
    String? rain,
    String? ground,
    List<String>? homePlayingXI,
    List<String>? awayPlayingXI,
  }) {
    return MatchConfig(
      homeTeam: homeTeam ?? this.homeTeam,
      awayTeam: awayTeam ?? this.awayTeam,
      overs: overs ?? this.overs,
      difficulty: difficulty ?? this.difficulty,
      weather: weather ?? this.weather,
      rain: rain ?? this.rain,
      ground: ground ?? this.ground,
      homePlayingXI:
      homePlayingXI ?? this.homePlayingXI,
      awayPlayingXI:
      awayPlayingXI ?? this.awayPlayingXI,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'homeTeam': homeTeam,
      'awayTeam': awayTeam,
      'overs': overs,
      'difficulty': difficulty,
      'weather': weather,
      'rain': rain,
      'ground': ground,
      'homePlayingXI': homePlayingXI,
      'awayPlayingXI': awayPlayingXI,
    };
  }

  @override
  String toString() {
    return 'MatchConfig('
        'homeTeam: $homeTeam, '
        'awayTeam: $awayTeam, '
        'overs: $overs, '
        'difficulty: $difficulty, '
        'weather: $weather, '
        'rain: $rain, '
        'ground: $ground'
        ')';
  }
}