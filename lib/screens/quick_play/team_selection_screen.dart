import 'package:flutter/material.dart';

import '../../models/cricket_player.dart';
import 'quick_play_settings_screen.dart';
import 'squad_selection_screen.dart';

class TeamSelectionScreen extends StatefulWidget {
  const TeamSelectionScreen({super.key});

  @override
  State<TeamSelectionScreen> createState() =>
      _TeamSelectionScreenState();
}

class _TeamSelectionScreenState extends State<TeamSelectionScreen> {
  int selectedLeft = 0;
  int selectedRight = 1;

  String selectedCategory = 'INTERNATIONAL';

  final Map<String, List<TeamData>> teams = {
    'INTERNATIONAL': [
      TeamData('India', 'IND', '🇮🇳', 91, 88, 90),
      TeamData('Australia', 'AUS', '🇦🇺', 89, 87, 88),
      TeamData('England', 'ENG', '🏴', 88, 84, 86),
      TeamData('South Africa', 'SA', '🇿🇦', 86, 89, 87),
      TeamData('New Zealand', 'NZ', '🇳🇿', 84, 86, 88),
      TeamData('Pakistan', 'PAK', '🇵🇰', 85, 90, 84),
      TeamData('Sri Lanka', 'SL', '🇱🇰', 81, 82, 84),
      TeamData('Bangladesh', 'BAN', '🇧🇩', 78, 80, 79),
    ],
    'INDIAN OG LEAGUE': [
      TeamData('Chennai Thunderhawks', 'CT', '🦁', 88, 86, 87),
      TeamData('Mumbai Stormriders', 'MS', '⚡', 91, 88, 89),
      TeamData('Bengaluru Blazeforce', 'BB', '🔥', 89, 84, 88),
      TeamData('Kolkata Nightblazers', 'KN', '🐯', 86, 87, 85),
      TeamData('Hyderabad Skyhawks', 'HS', '🦅', 87, 85, 86),
      TeamData('Rajasthan Royalsword', 'RR', '👑', 84, 83, 88),
      TeamData('Delhi Firehawks', 'DF', '💥', 85, 84, 83),
      TeamData('Punjab Lionhearts', 'PL', '🦁', 86, 81, 84),
      TeamData('Lucknow Wolfpack', 'LW', '🐺', 83, 86, 85),
      TeamData('Gujarat Titanshield', 'GT', '🦏', 87, 89, 88),
    ],
  };

  List<TeamData> get currentTeams => teams[selectedCategory]!;

  TeamData get leftTeam => currentTeams[selectedLeft];

  TeamData get rightTeam => currentTeams[selectedRight];

  Future<void> _openSquad(bool isLeft) async {
    final TeamData team = isLeft ? leftTeam : rightTeam;

    await Navigator.push<List<CricketPlayer>>(
      context,
      MaterialPageRoute(
        builder: (_) => SquadSelectionScreen(
          teamName: team.name,
        ),
      ),
    );
  }

  void _openMatchSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuickPlaySettingsScreen(
          homeTeam: leftTeam.name,
          awayTeam: rightTeam.name,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050D19),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF07111F),
                Color(0xFF102D43),
                Color(0xFF050B16),
              ],
            ),
          ),
          child: Column(
            children: [
              _header(),
              _categoryBar(),
              Expanded(
                child: _selectionArea(),
              ),
              _continueButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: Color(0xFF172D3F),
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFFF6B00),
            width: 3,
          ),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'TEAM SELECTION',
            style: TextStyle(
              color: Color(0xFF00E5D4),
              fontSize: 24,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.3,
            ),
          ),
          const Spacer(),
          const Text(
            'THE OG CRICKET',
            style: TextStyle(
              color: Colors.white38,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryBar() {
    return Container(
      height: 58,
      padding: const EdgeInsets.symmetric(horizontal: 28),
      color: const Color(0xFF091827),
      child: Row(
        children: [
          _categoryButton('INTERNATIONAL'),
          const SizedBox(width: 12),
          _categoryButton('INDIAN OG LEAGUE'),
        ],
      ),
    );
  }

  Widget _categoryButton(String category) {
    final bool selected = selectedCategory == category;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
          selectedLeft = 0;
          selectedRight = 1;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 11,
        ),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFFF6B00)
              : const Color(0xFF172D3F),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: selected
                ? Colors.white
                : Colors.white60,
            fontSize: 12,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  Widget _selectionArea() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            Expanded(
              child: _teamCard(
                leftTeam,
                true,
              ),
            ),
            const SizedBox(width: 30),
            _vs(),
            const SizedBox(width: 30),
            Expanded(
              child: _teamCard(
                rightTeam,
                false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _teamCard(
      TeamData team,
      bool isLeft,
      ) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 370,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF10283A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFF2B5068),
        ),
      ),
      child: Column(
        children: [
          Text(
            isLeft ? 'HOME TEAM' : 'AWAY TEAM',
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            team.emoji,
            style: const TextStyle(
              fontSize: 60,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            team.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            team.shortName,
            style: const TextStyle(
              color: Color(0xFF00E5D4),
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 18),
          _rating('BATTING', team.batting),
          _rating('BOWLING', team.bowling),
          _rating('FIELDING', team.fielding),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => _changeTeam(isLeft, -1),
                icon: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const SizedBox(width: 5),
              OutlinedButton.icon(
                onPressed: () => _openSquad(isLeft),
                icon: const Icon(
                  Icons.groups,
                  size: 18,
                ),
                label: const Text(
                  'SQUAD',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF00E5D4),
                  side: const BorderSide(
                    color: Color(0xFF00E5D4),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              IconButton(
                onPressed: () => _changeTeam(isLeft, 1),
                icon: const Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _rating(String label, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 70,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: value / 100,
                minHeight: 6,
                backgroundColor: const Color(0xFF08121E),
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Color(0xFF00CFC0),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '$value',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _vs() {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF101F31),
        border: Border.all(
          color: const Color(0xFF00E5D4),
          width: 2,
        ),
      ),
      child: const Center(
        child: Text(
          'VS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  Widget _continueButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        24,
        10,
        24,
        18,
      ),
      child: SizedBox(
        width: 330,
        height: 50,
        child: ElevatedButton.icon(
          onPressed: _openMatchSettings,
          icon: const Icon(
            Icons.arrow_forward,
            size: 20,
          ),
          label: const Text(
            'CONTINUE TO MATCH SETTINGS',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.8,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF6B00),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ),
      ),
    );
  }

  void _changeTeam(
      bool isLeft,
      int direction,
      ) {
    setState(() {
      if (isLeft) {
        selectedLeft =
            (selectedLeft + direction + currentTeams.length) %
                currentTeams.length;

        if (selectedLeft == selectedRight) {
          selectedLeft =
              (selectedLeft + direction + currentTeams.length) %
                  currentTeams.length;
        }
      } else {
        selectedRight =
            (selectedRight + direction + currentTeams.length) %
                currentTeams.length;

        if (selectedRight == selectedLeft) {
          selectedRight =
              (selectedRight + direction + currentTeams.length) %
                  currentTeams.length;
        }
      }
    });
  }
}

class TeamData {
  final String name;
  final String shortName;
  final String emoji;
  final int batting;
  final int bowling;
  final int fielding;

  const TeamData(
      this.name,
      this.shortName,
      this.emoji,
      this.batting,
      this.bowling,
      this.fielding,
      );
}