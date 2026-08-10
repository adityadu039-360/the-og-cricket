import 'package:flutter/material.dart';

class SquadPlayer {
  final String name;
  final String role;
  final int batting;
  final int bowling;
  final int fielding;
  final String bowlingType;

  const SquadPlayer({
    required this.name,
    required this.role,
    required this.batting,
    required this.bowling,
    required this.fielding,
    required this.bowlingType,
  });
}

class SquadSelectionScreen extends StatefulWidget {
  final String teamName;

  const SquadSelectionScreen({
    super.key,
    required this.teamName,
  });

  @override
  State<SquadSelectionScreen> createState() =>
      _SquadSelectionScreenState();
}

class _SquadSelectionScreenState
    extends State<SquadSelectionScreen> {
  late List<SquadPlayer> players;
  final List<SquadPlayer> selectedPlayers = [];

  @override
  void initState() {
    super.initState();
    players = _getPlayers(widget.teamName);

    // Default Final XI
    selectedPlayers.addAll(
      players.take(players.length >= 11 ? 11 : players.length),
    );
  }

  List<SquadPlayer> _getPlayers(String team) {
    // The catalog is intentionally expandable.
    // Add complete squads here without changing the UI.
    const commonInternational = <SquadPlayer>[
      SquadPlayer(
        name: 'A. Sharma',
        role: 'All Rounder',
        batting: 88,
        bowling: 76,
        fielding: 86,
        bowlingType: 'Left Arm Spin',
      ),
      SquadPlayer(
        name: 'R. Sharma',
        role: 'Batter',
        batting: 91,
        bowling: 30,
        fielding: 82,
        bowlingType: 'Off Break',
      ),
      SquadPlayer(
        name: 'V. Kohli',
        role: 'Batter',
        batting: 94,
        bowling: 28,
        fielding: 90,
        bowlingType: 'Medium',
      ),
      SquadPlayer(
        name: 'S. Yadav',
        role: 'Batter',
        batting: 92,
        bowling: 42,
        fielding: 88,
        bowlingType: 'Off Break',
      ),
      SquadPlayer(
        name: 'S. Gill',
        role: 'Batter',
        batting: 89,
        bowling: 20,
        fielding: 84,
        bowlingType: 'None',
      ),
      SquadPlayer(
        name: 'R. Pant',
        role: 'Wicket Keeper',
        batting: 88,
        bowling: 18,
        fielding: 92,
        bowlingType: 'None',
      ),
      SquadPlayer(
        name: 'H. Pandya',
        role: 'All Rounder',
        batting: 86,
        bowling: 82,
        fielding: 87,
        bowlingType: 'Medium Fast',
      ),
      SquadPlayer(
        name: 'R. Jadeja',
        role: 'All Rounder',
        batting: 82,
        bowling: 89,
        fielding: 95,
        bowlingType: 'Left Arm Spin',
      ),
      SquadPlayer(
        name: 'A. Patel',
        role: 'All Rounder',
        batting: 80,
        bowling: 84,
        fielding: 86,
        bowlingType: 'Left Arm Spin',
      ),
      SquadPlayer(
        name: 'K. Yadav',
        role: 'Bowler',
        batting: 48,
        bowling: 91,
        fielding: 82,
        bowlingType: 'Left Arm Spin',
      ),
      SquadPlayer(
        name: 'J. Bumrah',
        role: 'Bowler',
        batting: 35,
        bowling: 96,
        fielding: 88,
        bowlingType: 'Fast',
      ),
      SquadPlayer(
        name: 'M. Siraj',
        role: 'Bowler',
        batting: 30,
        bowling: 87,
        fielding: 82,
        bowlingType: 'Fast',
      ),
      SquadPlayer(
        name: 'A. Singh',
        role: 'Bowler',
        batting: 32,
        bowling: 86,
        fielding: 84,
        bowlingType: 'Left Arm Fast',
      ),
      SquadPlayer(
        name: 'S. Samson',
        role: 'Wicket Keeper',
        batting: 86,
        bowling: 15,
        fielding: 90,
        bowlingType: 'None',
      ),
      SquadPlayer(
        name: 'I. Kishan',
        role: 'Wicket Keeper',
        batting: 83,
        bowling: 12,
        fielding: 87,
        bowlingType: 'None',
      ),
      SquadPlayer(
        name: 'R. Gaikwad',
        role: 'Batter',
        batting: 84,
        bowling: 18,
        fielding: 85,
        bowlingType: 'None',
      ),
      SquadPlayer(
        name: 'S. Dube',
        role: 'All Rounder',
        batting: 82,
        bowling: 65,
        fielding: 78,
        bowlingType: 'Medium',
      ),
      SquadPlayer(
        name: 'K. Rahul',
        role: 'Wicket Keeper',
        batting: 87,
        bowling: 10,
        fielding: 86,
        bowlingType: 'None',
      ),
    ];

    // For now the complete expandable squad structure is shared
    // across the screen. Team-specific catalogs will be connected
    // in the next data layer.
    return List<SquadPlayer>.from(commonInternational);
  }

  void _togglePlayer(SquadPlayer player) {
    setState(() {
      if (selectedPlayers.contains(player)) {
        selectedPlayers.remove(player);
      } else if (selectedPlayers.length < 11) {
        selectedPlayers.add(player);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF07111F),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: _buildPlayerList(),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3,
                    child: _buildFinalXI(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 72,
      margin: const EdgeInsets.fromLTRB(16, 10, 16, 12),
      padding: const EdgeInsets.symmetric(horizontal: 22),
      decoration: BoxDecoration(
        color: const Color(0xFF172B3D),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF314B60),
        ),
      ),
      child: Row(
        children: [
          const Text(
            'SQUAD SELECTION',
            style: TextStyle(
              color: Color(0xFF00E5D4),
              fontSize: 25,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.4,
            ),
          ),
          const Spacer(),
          Text(
            widget.teamName.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 25),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFFF6B00),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              '${selectedPlayers.length}/11 SELECTED',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerList() {
    return Container(
      margin: const EdgeInsets.only(left: 16, bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF101F30),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF294258),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            color: const Color(0xFF0D4B68),
            child: const Row(
              children: [
                SizedBox(
                  width: 220,
                  child: Text(
                    'NAME',
                    style: _headerStyle,
                  ),
                ),
                Expanded(
                  child: Text(
                    'ROLE',
                    style: _headerStyle,
                  ),
                ),
                SizedBox(
                  width: 65,
                  child: Text(
                    'BAT',
                    style: _headerStyle,
                  ),
                ),
                SizedBox(
                  width: 65,
                  child: Text(
                    'BOWL',
                    style: _headerStyle,
                  ),
                ),
                SizedBox(
                  width: 65,
                  child: Text(
                    'FIELD',
                    style: _headerStyle,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: players.length,
              itemBuilder: (context, index) {
                final player = players[index];
                final selected =
                selectedPlayers.contains(player);

                return InkWell(
                  onTap: () => _togglePlayer(player),
                  child: Container(
                    height: 52,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: selected
                          ? const Color(0xFFFF6B00)
                          : const Color(0xFF182A3B),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 210,
                          child: Row(
                            children: [
                              Icon(
                                selected
                                    ? Icons.check_circle
                                    : Icons.radio_button_unchecked,
                                color: selected
                                    ? Colors.white
                                    : const Color(0xFF71879A),
                                size: 19,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  player.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Text(
                            player.role,
                            style: TextStyle(
                              color: selected
                                  ? Colors.white
                                  : const Color(0xFFB7C7D6),
                              fontSize: 13,
                            ),
                          ),
                        ),
                        _rating(player.batting, selected),
                        _rating(player.bowling, selected),
                        _rating(player.fielding, selected),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _rating(int value, bool selected) {
    return SizedBox(
      width: 65,
      child: Text(
        '$value',
        style: TextStyle(
          color: selected
              ? Colors.white
              : const Color(0xFF00E5D4),
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildFinalXI() {
    return Container(
      margin: const EdgeInsets.only(right: 16, bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF101F30),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF294258),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 48,
            width: double.infinity,
            alignment: Alignment.center,
            color: const Color(0xFF0D4B68),
            child: const Text(
              'FINAL 11',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: selectedPlayers.length,
              itemBuilder: (context, index) {
                final player = selectedPlayers[index];

                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF182A3B),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Color(0xFFFF6B00),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          player.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => _togglePlayer(player),
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          color: Colors.white70,
                          size: 19,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: selectedPlayers.length == 11
                    ? () {}
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6B00),
                  disabledBackgroundColor:
                  const Color(0xFF263849),
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'CONFIRM SQUAD',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const TextStyle _headerStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w900,
  fontSize: 12,
);