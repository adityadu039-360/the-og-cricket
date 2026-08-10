import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TeamSelectionScreen extends StatefulWidget {
  const TeamSelectionScreen({super.key});

  @override
  State<TeamSelectionScreen> createState() => _TeamSelectionScreenState();
}

class _TeamSelectionScreenState extends State<TeamSelectionScreen> {
  int selectedLeft = 0;
  int selectedRight = 1;

  String selectedCategory = 'INTERNATIONAL';

  final Map<String, List<TeamData>> teams = {
    'INTERNATIONAL': [
      TeamData(
        name: 'India',
        shortName: 'IND',
        flag: '🇮🇳',
        batting: 91,
        bowling: 88,
        fielding: 90,
      ),
      TeamData(
        name: 'Australia',
        shortName: 'AUS',
        flag: '🇦🇺',
        batting: 89,
        bowling: 87,
        fielding: 88,
      ),
      TeamData(
        name: 'England',
        shortName: 'ENG',
        flag: '🏴',
        batting: 88,
        bowling: 84,
        fielding: 86,
      ),
      TeamData(
        name: 'South Africa',
        shortName: 'SA',
        flag: '🇿🇦',
        batting: 86,
        bowling: 89,
        fielding: 87,
      ),
      TeamData(
        name: 'New Zealand',
        shortName: 'NZ',
        flag: '🇳🇿',
        batting: 84,
        bowling: 86,
        fielding: 88,
      ),
      TeamData(
        name: 'Pakistan',
        shortName: 'PAK',
        flag: '🇵🇰',
        batting: 85,
        bowling: 90,
        fielding: 84,
      ),
      TeamData(
        name: 'Sri Lanka',
        shortName: 'SL',
        flag: '🇱🇰',
        batting: 81,
        bowling: 82,
        fielding: 84,
      ),
      TeamData(
        name: 'Bangladesh',
        shortName: 'BAN',
        flag: '🇧🇩',
        batting: 78,
        bowling: 80,
        fielding: 79,
      ),
    ],
    'INDIAN OG LEAGUE': [
      TeamData(
        name: 'Chennai Thunderhawks',
        shortName: 'CT',
        flag: '🦁',
        batting: 88,
        bowling: 86,
        fielding: 87,
      ),
      TeamData(
        name: 'Mumbai Stormriders',
        shortName: 'MS',
        flag: '⚡',
        batting: 91,
        bowling: 88,
        fielding: 89,
      ),
      TeamData(
        name: 'Bengaluru Blazeforce',
        shortName: 'BB',
        flag: '🔥',
        batting: 89,
        bowling: 84,
        fielding: 88,
      ),
      TeamData(
        name: 'Kolkata Nightblazers',
        shortName: 'KN',
        flag: '🐯',
        batting: 86,
        bowling: 87,
        fielding: 85,
      ),
      TeamData(
        name: 'Hyderabad Skyhawks',
        shortName: 'HS',
        flag: '🦅',
        batting: 87,
        bowling: 85,
        fielding: 86,
      ),
      TeamData(
        name: 'Rajasthan Royalsword',
        shortName: 'RR',
        flag: '👑',
        batting: 84,
        bowling: 83,
        fielding: 88,
      ),
      TeamData(
        name: 'Delhi Firehawks',
        shortName: 'DF',
        flag: '💥',
        batting: 85,
        bowling: 84,
        fielding: 83,
      ),
      TeamData(
        name: 'Punjab Lionhearts',
        shortName: 'PL',
        flag: '🦁',
        batting: 86,
        bowling: 81,
        fielding: 84,
      ),
      TeamData(
        name: 'Lucknow Wolfpack',
        shortName: 'LW',
        flag: '🐺',
        batting: 83,
        bowling: 86,
        fielding: 85,
      ),
      TeamData(
        name: 'Gujarat Titanshield',
        shortName: 'GT',
        flag: '🦏',
        batting: 87,
        bowling: 89,
        fielding: 88,
      ),
    ],
  };

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  List<TeamData> get currentTeams => teams[selectedCategory]!;

  TeamData get leftTeam => currentTeams[selectedLeft];

  TeamData get rightTeam => currentTeams[selectedRight];

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
              _buildHeader(),
              _buildCategoryBar(),
              Expanded(
                child: _buildSelectionArea(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
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
              fontSize: 25,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.4,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.04),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.white.withOpacity(0.12),
              ),
            ),
            child: const Text(
              'THE OG CRICKET',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryBar() {
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
          border: Border.all(
            color: selected
                ? const Color(0xFFFF8A32)
                : Colors.white12,
          ),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: selected
                ? Colors.white
                : Colors.white60,
            fontSize: 12,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.8,
          ),
        ),
      ),
    );
  }

  Widget _buildSelectionArea() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 18,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: _buildTeamCard(
                      team: leftTeam,
                      isLeft: true,
                    ),
                  ),
                  SizedBox(
                    width: constraints.maxWidth * 0.08,
                    child: _buildVsSection(),
                  ),
                  Expanded(
                    child: _buildTeamCard(
                      team: rightTeam,
                      isLeft: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTeamCard({
    required TeamData team,
    required bool isLeft,
  }) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 360,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF10283A).withOpacity(0.95),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFF2B5068),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            isLeft ? 'HOME TEAM' : 'AWAY TEAM',
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            team.flag,
            style: const TextStyle(
              fontSize: 62,
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
          const SizedBox(height: 3),
          Text(
            team.shortName,
            style: const TextStyle(
              color: Color(0xFF00E5D4),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 20),
          _buildRatings(team),
          const Spacer(),
          _buildTeamChanger(isLeft),
        ],
      ),
    );
  }

  Widget _buildRatings(TeamData team) {
    return Column(
      children: [
        _ratingRow(
          'BATTING',
          team.batting,
        ),
        const SizedBox(height: 8),
        _ratingRow(
          'BOWLING',
          team.bowling,
        ),
        const SizedBox(height: 8),
        _ratingRow(
          'FIELDING',
          team.fielding,
        ),
      ],
    );
  }

  Widget _ratingRow(String label, int value) {
    return Row(
      children: [
        SizedBox(
          width: 65,
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
              minHeight: 7,
              backgroundColor: const Color(0xFF08121E),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF00CFC0),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 28,
          child: Text(
            '$value%',
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTeamChanger(bool isLeft) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            _changeTeam(isLeft, -1);
          },
          icon: const Icon(
            Icons.chevron_left,
            size: 34,
            color: Colors.white,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            'CHANGE TEAM',
            style: TextStyle(
              color: Color(0xFFFF6B00),
              fontSize: 11,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            _changeTeam(isLeft, 1);
          },
          icon: const Icon(
            Icons.chevron_right,
            size: 34,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  void _changeTeam(bool isLeft, int direction) {
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

  Widget _buildVsSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 68,
          height: 68,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF101F31),
            border: Border.all(
              color: const Color(0xFF00E5D4),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00E5D4).withOpacity(0.2),
                blurRadius: 18,
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'VS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 2,
          width: 45,
          color: const Color(0xFFFF6B00),
        ),
      ],
    );
  }
}

class TeamData {
  final String name;
  final String shortName;
  final String flag;
  final int batting;
  final int bowling;
  final int fielding;

  const TeamData({
    required this.name,
    required this.shortName,
    required this.flag,
    required this.batting,
    required this.bowling,
    required this.fielding,
  });
}