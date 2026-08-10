import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuickPlayScreen extends StatefulWidget {
  const QuickPlayScreen({super.key});

  @override
  State<QuickPlayScreen> createState() => _QuickPlayScreenState();
}

class _QuickPlayScreenState extends State<QuickPlayScreen> {
  int selectedOvers = 10;
  String selectedDifficulty = 'Medium';
  String selectedPitch = 'Hard';
  String selectedWeather = 'Clear';
  String selectedTime = 'Evening';
  bool manualCatching = true;
  bool manualFielding = true;

  final List<int> oversOptions = [2, 5, 10, 20, 50];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF07111F),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF07111F),
                Color(0xFF102B42),
                Color(0xFF06101D),
              ],
            ),
          ),
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      _buildSectionTitle(
                        'MATCH FORMAT',
                        Icons.sports_cricket,
                      ),
                      const SizedBox(height: 12),
                      _buildOversSelector(),
                      const SizedBox(height: 24),
                      _buildSectionTitle(
                        'MATCH SETTINGS',
                        Icons.tune,
                      ),
                      const SizedBox(height: 12),
                      _buildSettingsGrid(),
                      const SizedBox(height: 24),
                      _buildSectionTitle(
                        'GAME CONTROL',
                        Icons.gamepad_outlined,
                      ),
                      const SizedBox(height: 12),
                      _buildControlSettings(),
                      const SizedBox(height: 28),
                      _buildContinueButton(),
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

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF162C3D),
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
              fontSize: 26,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
            ),
          ),
          const Spacer(),
          _sponsorPlaceholder(),
        ],
      ),
    );
  }

  Widget _sponsorPlaceholder() {
    return Container(
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
        'SPONSOR SLOT',
        style: TextStyle(
          color: Colors.white38,
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xFF00E5D4),
          size: 22,
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w800,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0xFFFF6B00).withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildOversSelector() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: _panelDecoration(),
      child: Row(
        children: oversOptions.map((overs) {
          final bool selected = selectedOvers == overs;

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOvers = overs;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  height: 62,
                  decoration: BoxDecoration(
                    color: selected
                        ? const Color(0xFFFF6B00)
                        : const Color(0xFF1B3041),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: selected
                          ? const Color(0xFFFF8A32)
                          : Colors.white12,
                    ),
                    boxShadow: selected
                        ? [
                      BoxShadow(
                        color: const Color(0xFFFF6B00)
                            .withOpacity(0.25),
                        blurRadius: 12,
                      ),
                    ]
                        : [],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$overs',
                        style: TextStyle(
                          color: selected
                              ? Colors.white
                              : Colors.white70,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'OVERS',
                        style: TextStyle(
                          color: selected
                              ? Colors.white
                              : Colors.white54,
                          fontSize: 9,
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

  Widget _buildSettingsGrid() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              _buildDropdownSetting(
                title: 'DIFFICULTY',
                value: selectedDifficulty,
                icon: Icons.speed,
                options: const [
                  'Easy',
                  'Medium',
                  'Hard',
                  'Legend',
                ],
                onChanged: (value) {
                  setState(() {
                    selectedDifficulty = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              _buildDropdownSetting(
                title: 'PITCH',
                value: selectedPitch,
                icon: Icons.grass,
                options: const [
                  'Soft',
                  'Normal',
                  'Hard',
                  'Green',
                ],
                onChanged: (value) {
                  setState(() {
                    selectedPitch = value;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            children: [
              _buildDropdownSetting(
                title: 'WEATHER',
                value: selectedWeather,
                icon: Icons.wb_sunny_outlined,
                options: const [
                  'Clear',
                  'Cloudy',
                  'Overcast',
                  'Rainy',
                ],
                onChanged: (value) {
                  setState(() {
                    selectedWeather = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              _buildDropdownSetting(
                title: 'TIME OF DAY',
                value: selectedTime,
                icon: Icons.access_time,
                options: const [
                  'Morning',
                  'Afternoon',
                  'Evening',
                  'Night',
                ],
                onChanged: (value) {
                  setState(() {
                    selectedTime = value;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownSetting({
    required String title,
    required String value,
    required IconData icon,
    required List<String> options,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: _panelDecoration(),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF00E5D4),
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 4),
                DropdownButton<String>(
                  value: value,
                  isExpanded: true,
                  underline: const SizedBox(),
                  dropdownColor: const Color(0xFF172C3D),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white70,
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  items: options.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    if (newValue != null) {
                      onChanged(newValue);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlSettings() {
    return Row(
      children: [
        Expanded(
          child: _buildToggleCard(
            title: 'CATCHING',
            value: manualCatching,
            onChanged: (value) {
              setState(() {
                manualCatching = value;
              });
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildToggleCard(
            title: 'FIELDING',
            value: manualFielding,
            onChanged: (value) {
              setState(() {
                manualFielding = value;
              });
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildInfoCard(
            icon: Icons.record_voice_over,
            title: 'COMMENTATOR',
            value: 'ON',
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildInfoCard(
            icon: Icons.backpack_outlined,
            title: 'KIT BAG',
            value: 'AVAILABLE',
          ),
        ),
      ],
    );
  }

  Widget _buildToggleCard({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: _panelDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _modeButton(
                  label: 'MANUAL',
                  selected: value,
                  onTap: () => onChanged(true),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: _modeButton(
                  label: 'AUTO',
                  selected: !value,
                  onTap: () => onChanged(false),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _modeButton({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(vertical: 9),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFFF6B00)
              : const Color(0xFF1B3041),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selected
                  ? Colors.white
                  : Colors.white54,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: _panelDecoration(),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF00E5D4),
            size: 28,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: 300,
      height: 54,
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: const Color(0xFF162C3D),
              content: Text(
                '$selectedOvers-over Quick Play selected',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF6B00),
          foregroundColor: Colors.white,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SELECT TEAMS',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
            SizedBox(width: 12),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }

  BoxDecoration _panelDecoration() {
    return BoxDecoration(
      color: const Color(0xFF13283A).withOpacity(0.95),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: Colors.white.withOpacity(0.08),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.18),
          blurRadius: 12,
          offset: const Offset(0, 5),
        ),
      ],
    );
  }
}