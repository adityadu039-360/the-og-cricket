import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // The OG Cricket always opens in landscape mode.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  // Full-screen gaming experience.
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );

  runApp(const TheOGCricketApp());
}

class TheOGCricketApp extends StatelessWidget {
  const TheOGCricketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The OG Cricket',
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1100,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 24,
                ),
                child: Row(
                  children: [
                    // LEFT SIDE — BRAND
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.sports_cricket,
                            size: 90,
                            color: AppTheme.primaryGold,
                          ),

                          const SizedBox(height: 20),

                          Text(
                            'THE OG CRICKET',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                              fontSize: 38,
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            'PLAY. COMPETE. BECOME THE OG.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                              letterSpacing: 2,
                              color: Colors.white60,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 50),

                    // RIGHT SIDE — MENU
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _GameButton(
                            title: 'QUICK MATCH',
                            icon: Icons.flash_on_rounded,
                            onPressed: () {},
                          ),

                          const SizedBox(height: 14),

                          _GameButton(
                            title: 'CAREER MODE',
                            icon: Icons.emoji_events_rounded,
                            onPressed: () {},
                          ),

                          const SizedBox(height: 14),

                          _GameButton(
                            title: 'TOURNAMENT',
                            icon: Icons.workspace_premium_rounded,
                            onPressed: () {},
                          ),

                          const SizedBox(height: 14),

                          Row(
                            children: [
                              Expanded(
                                child: _SmallGameButton(
                                  title: 'PROFILE',
                                  icon: Icons.person_outline_rounded,
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _SmallGameButton(
                                  title: 'SETTINGS',
                                  icon: Icons.settings_outlined,
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GameButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const _GameButton({
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 62,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 25,
        ),
        label: Text(title),
      ),
    );
  }
}

class _SmallGameButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const _SmallGameButton({
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 21,
        ),
        label: Text(title),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppTheme.primaryGold,
          side: const BorderSide(
            color: AppTheme.primaryGold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}