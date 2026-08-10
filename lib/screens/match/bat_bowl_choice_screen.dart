import 'package:flutter/material.dart';
import '../../models/match_config.dart';

class BatBowlChoiceScreen extends StatefulWidget {
  final MatchConfig config;
  final String tossWinner;

  const BatBowlChoiceScreen({
    super.key,
    required this.config,
    required this.tossWinner,
  });

  @override
  State<BatBowlChoiceScreen> createState() =>
      _BatBowlChoiceScreenState();
}

class _BatBowlChoiceScreenState
    extends State<BatBowlChoiceScreen> {
  String? selectedDecision;

  String get otherTeam {
    return widget.tossWinner == widget.config.homeTeam
        ? widget.config.awayTeam
        : widget.config.homeTeam;
  }

  void _confirmDecision() {
    if (selectedDecision == null) return;

    final bool tossWinnerBats =
        selectedDecision == 'BAT';

    final String battingTeam =
    tossWinnerBats
        ? widget.tossWinner
        : otherTeam;

    final String bowlingTeam =
    tossWinnerBats
        ? otherTeam
        : widget.tossWinner;

    Navigator.pop(
      context,
      {
        'tossWinner': widget.tossWinner,
        'decision': selectedDecision,
        'battingTeam': battingTeam,
        'bowlingTeam': bowlingTeam,
      },
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
                    padding: const EdgeInsets.all(30),
                    child: _choiceCard(),
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
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'MATCH DECISION',
            style: TextStyle(
              color: Color(0xFF00E5D4),
              fontSize: 24,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.2,
            ),
          ),
          const Spacer(),
          Text(
            '${widget.config.overs} OVERS',
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _choiceCard() {
    return Container(
      width: 650,
      padding: const EdgeInsets.all(32),
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
          const Icon(
            Icons.emoji_events_outlined,
            color: Color(0xFFFFB52E),
            size: 65,
          ),
          const SizedBox(height: 14),
          const Text(
            'TOSS WON',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            widget.tossWinner,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF00E5D4),
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'What do you want to do?',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              Expanded(
                child: _decisionCard(
                  title: 'BAT FIRST',
                  subtitle: 'Set the target',
                  icon: Icons.sports_cricket,
                  value: 'BAT',
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: _decisionCard(
                  title: 'BOWL FIRST',
                  subtitle: 'Chase the target',
                  icon: Icons.sports_baseball,
                  value: 'BOWL',
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          _matchPreview(),
          const SizedBox(height: 25),
          SizedBox(
            width: 300,
            height: 52,
            child: ElevatedButton.icon(
              onPressed: selectedDecision == null
                  ? null
                  : _confirmDecision,
              icon: const Icon(
                Icons.arrow_forward,
              ),
              label: const Text(
                'CONFIRM & START MATCH',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.8,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                const Color(0xFFFF6B00),
                disabledBackgroundColor:
                const Color(0xFF273847),
                foregroundColor: Colors.white,
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

  Widget _decisionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required String value,
  }) {
    final bool selected = selectedDecision == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDecision = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        height: 145,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFF0B4A43)
              : const Color(0xFF172A3B),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected
                ? const Color(0xFF00E5D4)
                : const Color(0xFF345167),
            width: selected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: selected
                  ? const Color(0xFF00E5D4)
                  : Colors.white70,
              size: 35,
            ),
            const SizedBox(height: 9),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _matchPreview() {
    final bool battingSelected =
        selectedDecision == 'BAT';

    final String battingTeam = battingSelected
        ? widget.tossWinner
        : otherTeam;

    final String bowlingTeam = battingSelected
        ? otherTeam
        : widget.tossWinner;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF0B1926),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.center,
        children: [
          _teamStatus(
            'BAT',
            battingTeam,
            Icons.sports_cricket,
          ),
          const SizedBox(width: 30),
          const Text(
            'VS',
            style: TextStyle(
              color: Colors.white38,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(width: 30),
          _teamStatus(
            'BOWL',
            bowlingTeam,
            Icons.sports_baseball,
          ),
        ],
      ),
    );
  }

  Widget _teamStatus(
      String label,
      String team,
      IconData icon,
      ) {
    return Column(
      children: [
        Icon(
          icon,
          color: const Color(0xFF00E5D4),
          size: 20,
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white38,
            fontSize: 8,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          team,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}