import 'package:flutter/material.dart';
import '../../models/match_config.dart';
import 'bat_bowl_choice_screen.dart';

class TossScreen extends StatefulWidget {
  final MatchConfig config;

  const TossScreen({
    super.key,
    required this.config,
  });

  @override
  State<TossScreen> createState() => _TossScreenState();
}

class _TossScreenState extends State<TossScreen> {
  String? selectedChoice;
  String? tossWinner;

  bool tossCompleted = false;

  void _performToss() {
    if (selectedChoice == null) return;

    final bool homeWins =
        DateTime.now().millisecond % 2 == 0;

    setState(() {
      tossWinner = homeWins
          ? widget.config.homeTeam
          : widget.config.awayTeam;

      tossCompleted = true;
    });
  }

  void _continueToDecision() {
    if (!tossCompleted || tossWinner == null) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BatBowlChoiceScreen(
          config: widget.config,
          tossWinner: tossWinner!,
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
                    child: _tossCard(),
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
            'MATCH TOSS',
            style: TextStyle(
              color: Color(0xFF00E5D4),
              fontSize: 24,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.4,
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

  Widget _tossCard() {
    return Container(
      width: 600,
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
          const Icon(
            Icons.monetization_on,
            color: Color(0xFFFFB52E),
            size: 75,
          ),
          const SizedBox(height: 15),
          const Text(
            'TOSS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w900,
              letterSpacing: 3,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${widget.config.homeTeam}  VS  ${widget.config.awayTeam}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF00E5D4),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Choose heads or tails',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _choiceButton('HEADS'),
              const SizedBox(width: 15),
              _choiceButton('TAILS'),
            ],
          ),
          const SizedBox(height: 25),
          if (tossCompleted)
            _winnerBox(),
          const SizedBox(height: 22),
          SizedBox(
            width: 280,
            height: 52,
            child: ElevatedButton.icon(
              onPressed: selectedChoice == null
                  ? null
                  : tossCompleted
                  ? _continueToDecision
                  : _performToss,
              icon: Icon(
                tossCompleted
                    ? Icons.arrow_forward
                    : Icons.casino,
              ),
              label: Text(
                tossCompleted
                    ? 'CONTINUE'
                    : 'FLIP COIN',
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                const Color(0xFFFF6B00),
                disabledBackgroundColor:
                const Color(0xFF273847),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(7),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _choiceButton(String value) {
    final bool selected =
        selectedChoice == value;

    return GestureDetector(
      onTap: tossCompleted
          ? null
          : () {
        setState(() {
          selectedChoice = value;
        });
      },
      child: AnimatedContainer(
        duration:
        const Duration(milliseconds: 180),
        width: 130,
        height: 52,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFFF6B00)
              : const Color(0xFF172A3B),
          borderRadius:
          BorderRadius.circular(7),
          border: Border.all(
            color: selected
                ? const Color(0xFFFF963D)
                : const Color(0xFF345167),
          ),
        ),
        child: Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  Widget _winnerBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0B4A43),
        borderRadius: BorderRadius.circular(8),
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
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '$tossWinner won the toss!',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}