import 'package:flutter/material.dart';
import '../../models/match_config.dart';

class PreMatchScreen extends StatelessWidget {
  final MatchConfig config;
  final String tossWinner;
  final String decision;
  final String battingTeam;
  final String bowlingTeam;

  const PreMatchScreen({
    super.key,
    required this.config,
    required this.tossWinner,
    required this.decision,
    required this.battingTeam,
    required this.bowlingTeam,
  });

  void _startMatch(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Match engine will start in the next development stage.',
        ),
        backgroundColor: Color(0xFF087F73),
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
                Color(0xFF071321),
                Color(0xFF102D43),
                Color(0xFF050A13),
              ],
            ),
          ),
          child: Column(
            children: [
              _header(),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(28),
                    child: _matchCard(context),
                  ),
                ),
              ),
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
            onPressed: () {},
            icon: const Icon(
              Icons.sports_cricket,
              color: Color(0xFFFF6B00),
            ),
          ),
          const Text(
            'THE OG CRICKET',
            style: TextStyle(
              color: Color(0xFF00E5D4),
              fontSize: 22,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.2,
            ),
          ),
          const Spacer(),
          const Text(
            'MATCH READY',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _matchCard(BuildContext context) {
    return Container(
      width: 720,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color(0xFF10283A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF2B5068),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 25,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'MATCH READY',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${config.overs} OVER MATCH',
            style: const TextStyle(
              color: Color(0xFF00E5D4),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 30),
          _teams(),
          const SizedBox(height: 25),
          _matchInformation(),
          const SizedBox(height: 25),
          _tossInformation(),
          const SizedBox(height: 30),
          SizedBox(
            width: 330,
            height: 55,
            child: ElevatedButton.icon(
              onPressed: () => _startMatch(context),
              icon: const Icon(
                Icons.play_arrow,
                size: 24,
              ),
              label: const Text(
                'START MATCH',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6B00),
                foregroundColor: Colors.white,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _teams() {
    return Row(
      children: [
        Expanded(
          child: _teamBox(
            config.homeTeam,
            battingTeam == config.homeTeam,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'VS',
            style: TextStyle(
              color: Colors.white38,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Expanded(
          child: _teamBox(
            config.awayTeam,
            battingTeam == config.awayTeam,
          ),
        ),
      ],
    );
  }

  Widget _teamBox(
      String team,
      bool batting,
      ) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF0B1926),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: batting
              ? const Color(0xFFFF6B00)
              : const Color(0xFF29475D),
          width: batting ? 2 : 1,
        ),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.shield_outlined,
            color: Color(0xFF00E5D4),
            size: 35,
          ),
          const SizedBox(height: 8),
          Text(
            team,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            batting ? 'BATTING FIRST' : 'BOWLING FIRST',
            style: TextStyle(
              color: batting
                  ? const Color(0xFFFF963D)
                  : Colors.white54,
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _matchInformation() {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 12,
      runSpacing: 12,
      children: [
        _infoChip(
          Icons.timer_outlined,
          '${config.overs} Overs',
        ),
        _infoChip(
          Icons.speed,
          config.difficulty,
        ),
        _infoChip(
          Icons.wb_sunny_outlined,
          config.weather,
        ),
        _infoChip(
          Icons.water_drop_outlined,
          'Rain: ${config.rain}',
        ),
        _infoChip(
          Icons.stadium_outlined,
          config.ground,
        ),
      ],
    );
  }

  Widget _infoChip(
      IconData icon,
      String text,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF172A3B),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: const Color(0xFF29475D),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: const Color(0xFF00E5D4),
            size: 16,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _tossInformation() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0B4A43),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: const Color(0xFF00E5D4),
        ),
      ),
      child: Column(
        children: [
          const Text(
            'TOSS RESULT',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 9,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.4,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '$tossWinner won the toss',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '$tossWinner chose to '
                '${decision == 'BAT' ? 'bat first' : 'bowl first'}',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}