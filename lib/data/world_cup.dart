import '../models/cricket_team.dart';

class WorldCup {
  WorldCup._();

  static const String tournamentName = 'World Cup';
  static const int season = 2026;

  static const List<CricketTeam> teams = [
    CricketTeam(
      id: 'india',
      name: 'India',
      shortName: 'IND',
      city: 'India',
      emoji: '🇮🇳',
      primaryColor: '#1565C0',
      secondaryColor: '#FDD835',
      logoAsset: 'assets/logos/world_cup/india.png',
    ),

    CricketTeam(
      id: 'australia',
      name: 'Australia',
      shortName: 'AUS',
      city: 'Australia',
      emoji: '🇦🇺',
      primaryColor: '#FDD835',
      secondaryColor: '#1B5E20',
      logoAsset: 'assets/logos/world_cup/australia.png',
    ),

    CricketTeam(
      id: 'england',
      name: 'England',
      shortName: 'ENG',
      city: 'England',
      emoji: '🏴',
      primaryColor: '#1565C0',
      secondaryColor: '#FFFFFF',
      logoAsset: 'assets/logos/world_cup/england.png',
    ),

    CricketTeam(
      id: 'south_africa',
      name: 'South Africa',
      shortName: 'SA',
      city: 'South Africa',
      emoji: '🇿🇦',
      primaryColor: '#2E7D32',
      secondaryColor: '#FDD835',
      logoAsset: 'assets/logos/world_cup/south_africa.png',
    ),

    CricketTeam(
      id: 'new_zealand',
      name: 'New Zealand',
      shortName: 'NZ',
      city: 'New Zealand',
      emoji: '🇳🇿',
      primaryColor: '#212121',
      secondaryColor: '#FFFFFF',
      logoAsset: 'assets/logos/world_cup/new_zealand.png',
    ),

    CricketTeam(
      id: 'pakistan',
      name: 'Pakistan',
      shortName: 'PAK',
      city: 'Pakistan',
      emoji: '🇵🇰',
      primaryColor: '#2E7D32',
      secondaryColor: '#FFFFFF',
      logoAsset: 'assets/logos/world_cup/pakistan.png',
    ),

    CricketTeam(
      id: 'sri_lanka',
      name: 'Sri Lanka',
      shortName: 'SL',
      city: 'Sri Lanka',
      emoji: '🇱🇰',
      primaryColor: '#1565C0',
      secondaryColor: '#FDD835',
      logoAsset: 'assets/logos/world_cup/sri_lanka.png',
    ),

    CricketTeam(
      id: 'bangladesh',
      name: 'Bangladesh',
      shortName: 'BAN',
      city: 'Bangladesh',
      emoji: '🇧🇩',
      primaryColor: '#00695C',
      secondaryColor: '#E53935',
      logoAsset: 'assets/logos/world_cup/bangladesh.png',
    ),

    CricketTeam(
      id: 'afghanistan',
      name: 'Afghanistan',
      shortName: 'AFG',
      city: 'Afghanistan',
      emoji: '🇦🇫',
      primaryColor: '#1565C0',
      secondaryColor: '#E53935',
      logoAsset: 'assets/logos/world_cup/afghanistan.png',
    ),

    CricketTeam(
      id: 'west_indies',
      name: 'West Indies',
      shortName: 'WI',
      city: 'West Indies',
      emoji: '🏝️',
      primaryColor: '#512DA8',
      secondaryColor: '#FDD835',
      logoAsset: 'assets/logos/world_cup/west_indies.png',
    ),
  ];
}