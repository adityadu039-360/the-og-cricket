import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../tournament/tournament_selection_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedMenu = 0;

  final List<_HomeMenuItem> _menuItems = const [
    _HomeMenuItem(
      title: 'QUICK MATCH',
      subtitle: 'Jump straight into the action',
      icon: Icons.flash_on_rounded,
    ),
    _HomeMenuItem(
      title: 'CAREER',
      subtitle: 'Build your cricket legacy',
      icon: Icons.emoji_events_rounded,
    ),
    _HomeMenuItem(
      title: 'TOURNAMENT',
      subtitle: 'Compete for the ultimate trophy',
      icon: Icons.workspace_premium_rounded,
    ),
    _HomeMenuItem(
      title: 'PRACTICE',
      subtitle: 'Master your shots and skills',
      icon: Icons.sports_cricket_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            _buildSideNavigation(),
            Expanded(
              child: _buildMainContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSideNavigation() {
    return Container(
      width: 105,
      decoration: BoxDecoration(
        color: AppTheme.surfaceBlack,
        border: Border(
          right: BorderSide(
            color: Colors.white.withOpacity(0.06),
          ),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 22),

          Container(
            width: 58,
            height: 58,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.primaryGold,
            ),
            child: const Icon(
              Icons.sports_cricket_rounded,
              color: Colors.black,
              size: 32,
            ),
          ),

          const SizedBox(height: 35),

          _buildNavigationItem(
            icon: Icons.home_rounded,
            label: 'HOME',
            index: 0,
          ),

          _buildNavigationItem(
            icon: Icons.person_rounded,
            label: 'PROFILE',
            index: 1,
          ),

          _buildNavigationItem(
            icon: Icons.settings_rounded,
            label: 'SETTINGS',
            index: 2,
          ),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              'v1.0.0',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white.withOpacity(0.3),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool selected = _selectedMenu == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMenu = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected
              ? AppTheme.primaryGold.withOpacity(0.12)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 24,
              color: selected
                  ? AppTheme.primaryGold
                  : Colors.white.withOpacity(0.45),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w700,
                color: selected
                    ? AppTheme.primaryGold
                    : Colors.white.withOpacity(0.45),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 35,
            vertical: 25,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight - 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTopBar(),
                const SizedBox(height: 25),
                _buildWelcomeSection(),
                const SizedBox(height: 25),
                _buildMenuGrid(),
                const SizedBox(height: 25),
                _buildBottomBanner(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTopBar() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'THE OG CRICKET',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 9,
          ),
          decoration: BoxDecoration(
            color: AppTheme.surfaceBlack,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.monetization_on_rounded,
                color: AppTheme.primaryGold,
                size: 20,
              ),
              SizedBox(width: 7),
              Text(
                '0',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: AppTheme.surfaceBlack,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.notifications_none_rounded,
            size: 22,
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          colors: [
            AppTheme.primaryGold.withOpacity(0.18),
            AppTheme.surfaceBlack,
          ],
        ),
      ),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: AppTheme.primaryGold,
            child: Icon(
              Icons.person_rounded,
              color: Colors.black,
              size: 40,
            ),
          ),
          SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'WELCOME, CRICKETER',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Your cricket journey starts here.',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _menuItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 3.2,
      ),
      itemBuilder: (context, index) {
        final item = _menuItems[index];

        return _buildGameCard(
          item: item,
          onTap: () => _handleMenuTap(index, item.title),
        );
      },
    );
  }

  Widget _buildGameCard({
    required _HomeMenuItem item,
    required VoidCallback onTap,
  }) {
    return Material(
      color: AppTheme.surfaceBlack,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: Colors.white.withOpacity(0.06),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: AppTheme.primaryGold.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  item.icon,
                  color: AppTheme.primaryGold,
                  size: 27,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white.withOpacity(0.45),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: Colors.white30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleMenuTap(int index, String title) {
    if (index == 2) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const TournamentSelectionScreen(),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title is coming soon!'),
        backgroundColor: AppTheme.surfaceBlack,
      ),
    );
  }

  Widget _buildBottomBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: AppTheme.surfaceBlack,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.auto_awesome_rounded,
            color: AppTheme.primaryGold,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'MORE FEATURES COMING SOON',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ),
          const Icon(
            Icons.arrow_forward_rounded,
            color: AppTheme.primaryGold,
            size: 18,
          ),
        ],
      ),
    );
  }
}

class _HomeMenuItem {
  final String title;
  final String subtitle;
  final IconData icon;

  const _HomeMenuItem({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}