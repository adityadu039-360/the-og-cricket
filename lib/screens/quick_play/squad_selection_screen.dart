import 'package:flutter/material.dart';
import '../../data/team_squad_catalog.dart';

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
  late List<CricketPlayer> players;
  final List<CricketPlayer> selectedPlayers = [];

  @override
  void initState() {
    super.initState();
    _loadSquad(widget.teamName);
  }

  void _loadSquad(String teamName) {
    players = TeamSquadCatalog.getSquad(teamName);

    selectedPlayers.clear();

    if (players.length >= 11) {
      selectedPlayers.addAll(players.take(11));
    } else {
      selectedPlayers.addAll(players);
    }
  }

  void _togglePlayer(CricketPlayer player) {
    setState(() {
      if (selectedPlayers.contains(player)) {
        selectedPlayers.remove(player);
      } else {
        if (selectedPlayers.length < 11) {
          selectedPlayers.add(player);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF06101D),
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: _playerList(),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3,
                    child: _finalXI(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      height: 70,
      margin: const EdgeInsets.fromLTRB(14, 10, 14, 12),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF12283A),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF2C4B62),
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
            'SQUAD',
            style: TextStyle(
              color: Color(0xFF00E5D4),
              fontSize: 24,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(width: 20),
          Container(
            height: 28,
            width: 2,
            color: const Color(0xFFFF6B00),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Text(
              widget.teamName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          _counter(),
        ],
      ),
    );
  }

  Widget _counter() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: selectedPlayers.length == 11
            ? const Color(0xFF087F73)
            : const Color(0xFF24394B),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        '${selectedPlayers.length} / 11',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Widget _playerList() {
    return Container(
      margin: const EdgeInsets.only(
        left: 14,
        bottom: 14,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF0E1D2C),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF294359),
        ),
      ),
      child: Column(
        children: [
          _tableHeader(),
          Expanded(
            child: players.isEmpty
                ? _emptySquad()
                : ListView.builder(
              padding: const EdgeInsets.symmetric(
                vertical: 6,
              ),
              itemCount: players.length,
              itemBuilder: (context, index) {
                return _playerTile(
                  players[index],
                  index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _tableHeader() {
    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF0B4A66),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: const Row(
        children: [
          SizedBox(width: 35),
          Expanded(
            flex: 4,
            child: Text(
              'PLAYER',
              style: _headerText,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'ROLE',
              style: _headerText,
            ),
          ),
          SizedBox(
            width: 65,
            child: Text(
              'STATUS',
              style: _headerText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _playerTile(
      CricketPlayer player,
      int index,
      ) {
    final bool selected =
    selectedPlayers.contains(player);

    return GestureDetector(
      onTap: () => _togglePlayer(player),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: 58,
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
              : const Color(0xFF16293A),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: selected
                ? const Color(0xFFFF8A32)
                : Colors.transparent,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 35,
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  color: selected
                      ? Colors.white
                      : const Color(0xFF6F8497),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Icon(
                    selected
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    size: 20,
                    color: selected
                        ? Colors.white
                        : const Color(0xFF60788B),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      player.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                player.role,
                style: TextStyle(
                  color: selected
                      ? Colors.white
                      : const Color(0xFFAAB9C6),
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(
              width: 65,
              child: Text(
                selected ? 'XI' : 'BENCH',
                style: TextStyle(
                  color: selected
                      ? Colors.white
                      : const Color(0xFF71879A),
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _finalXI() {
    return Container(
      margin: const EdgeInsets.only(
        right: 14,
        bottom: 14,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF0E1D2C),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF294359),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 46,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0xFF0B4A66),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: const Text(
              'PLAYING XI',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
          ),
          Expanded(
            child: selectedPlayers.isEmpty
                ? const Center(
              child: Text(
                'Select players',
                style: TextStyle(
                  color: Colors.white38,
                ),
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.all(7),
              itemCount: selectedPlayers.length,
              itemBuilder: (context, index) {
                final player =
                selectedPlayers[index];

                return _selectedPlayer(
                  player,
                  index,
                );
              },
            ),
          ),
          _confirmButton(),
        ],
      ),
    );
  }

  Widget _selectedPlayer(
      CricketPlayer player,
      int index,
      ) {
    return Container(
      height: 42,
      margin: const EdgeInsets.only(
        bottom: 4,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF172A3B),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 25,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                color: Color(0xFFFF6B00),
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Expanded(
            child: Text(
              player.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          InkWell(
            onTap: () => _togglePlayer(player),
            child: const Icon(
              Icons.close,
              color: Colors.white54,
              size: 17,
            ),
          ),
        ],
      ),
    );
  }

  Widget _confirmButton() {
    final bool ready = selectedPlayers.length == 11;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 44,
        child: ElevatedButton(
          onPressed: ready
              ? () {
            Navigator.pop(
              context,
              selectedPlayers,
            );
          }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF6B00),
            disabledBackgroundColor:
            const Color(0xFF263746),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Text(
            ready
                ? 'CONFIRM PLAYING XI'
                : 'SELECT ${11 - selectedPlayers.length} MORE',
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }

  Widget _emptySquad() {
    return const Center(
      child: Text(
        'NO SQUAD DATA',
        style: TextStyle(
          color: Colors.white38,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

const TextStyle _headerText = TextStyle(
  color: Colors.white,
  fontSize: 11,
  fontWeight: FontWeight.w900,
  letterSpacing: 0.7,
);