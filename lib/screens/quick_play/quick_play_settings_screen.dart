import 'package:flutter/material.dart';

class QuickPlaySettingsScreen extends StatefulWidget {
  final String homeTeam;
  final String awayTeam;

  const QuickPlaySettingsScreen({
    super.key,
    required this.homeTeam,
    required this.awayTeam,
  });

  @override
  State<QuickPlaySettingsScreen> createState() =>
      _QuickPlaySettingsScreenState();
}

class _QuickPlaySettingsScreenState
    extends State<QuickPlaySettingsScreen> {
  int selectedOvers = 5;

  String difficulty = 'Medium';
  String weather = 'Clear';
  String rain = 'Off';
  String ground = 'OG Cricket Stadium';

  final List<int> overs = [2, 5, 10, 20, 50];

  final List<String> difficulties = [
    'Easy',
    'Medium',
    'Hard',
    'Legend',
  ];

  final List<String> weathers = [
    'Clear',
    'Sunny',
    'Cloudy',
    'Overcast',
    'Night',
  ];

  final List<String> rainOptions = [
    'Off',
    'Low',
    'Medium',
    'High',
  ];

  final List<String> grounds = [
    'OG Cricket Stadium',
    'Mumbai Arena',
    'Bengaluru Cricket Park',
    'Chennai Fortress',
    'Kolkata Night Ground',
    'Hyderabad Cricket Arena',
    'Delhi Capital Ground',
    'Rajasthan Desert Stadium',
  ];

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
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      _matchPreview(),
                      const SizedBox(height: 20),
                      _oversSection(),
                      const SizedBox(height: 18),
                      _settingsGrid(),
                      const SizedBox(height: 24),
                      _startMatchButton(),
                    ],
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
            'QUICK PLAY',
            style: TextStyle(
              color: Color(0xFF00E5D4),
              fontSize: 24,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.4,
            ),
          ),
          const Spacer(),
          const Text(
            'MATCH SETTINGS',
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

  Widget _matchPreview() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF10283A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF2B5068),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _teamPreview(
              widget.homeTeam,
              'HOME',
            ),
          ),
          Container(
            width: 58,
            height: 58,
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
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Expanded(
            child: _teamPreview(
              widget.awayTeam,
              'AWAY',
            ),
          ),
        ],
      ),
    );
  }

  Widget _teamPreview(
      String name,
      String label,
      ) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white38,
            fontSize: 9,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }

  Widget _oversSection() {
    return _section(
      title: 'MATCH FORMAT',
      icon: Icons.timer_outlined,
      child: Row(
        children: overs.map((value) {
          final selected = selectedOvers == value;

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOvers = value;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 160,
                  ),
                  height: 70,
                  decoration: BoxDecoration(
                    color: selected
                        ? const Color(0xFFFF6B00)
                        : const Color(0xFF172A3B),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: selected
                          ? const Color(0xFFFF963D)
                          : const Color(0xFF2B465A),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      Text(
                        '$value',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const Text(
                        'OVERS',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _settingsGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _dropdownCard(
                title: 'DIFFICULTY',
                icon: Icons.sports_esports_outlined,
                value: difficulty,
                values: difficulties,
                onChanged: (value) {
                  setState(() {
                    difficulty = value!;
                  });
                },
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: _dropdownCard(
                title: 'WEATHER',
                icon: Icons.wb_sunny_outlined,
                value: weather,
                values: weathers,
                onChanged: (value) {
                  setState(() {
                    weather = value!;
                  });
                },
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: _dropdownCard(
                title: 'RAIN',
                icon: Icons.water_drop_outlined,
                value: rain,
                values: rainOptions,
                onChanged: (value) {
                  setState(() {
                    rain = value!;
                  });
                },
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: _dropdownCard(
                title: 'GROUND',
                icon: Icons.stadium_outlined,
                value: ground,
                values: grounds,
                onChanged: (value) {
                  setState(() {
                    ground = value!;
                  });
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _dropdownCard({
    required String title,
    required IconData icon,
    required String value,
    required List<String> values,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF10283A),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: const Color(0xFF29475D),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 17,
                color: const Color(0xFF00E5D4),
              ),
              const SizedBox(width: 7),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(
            value: value,
            isExpanded: true,
            dropdownColor: const Color(0xFF172D3F),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFF172A3B),
              contentPadding:
              const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 2,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide.none,
              ),
            ),
            items: values.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _section({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF10283A),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFF29475D),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: const Color(0xFF00E5D4),
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _startMatchButton() {
    return SizedBox(
      width: 360,
      height: 55,
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '$selectedOvers-over match configured',
              ),
              backgroundColor: const Color(0xFF087F73),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF6B00),
          foregroundColor: Colors.white,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        child: const Text(
          'START MATCH',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.3,
          ),
        ),
      ),
    );
  }
}