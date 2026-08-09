import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../../data/tournament_catalog.dart';
import '../../models/tournament.dart';

class TournamentSelectionScreen extends StatelessWidget {
  const TournamentSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tournaments = TournamentCatalog.all;

    return Scaffold(
      backgroundColor: AppTheme.backgroundBlack,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 35,
            vertical: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'TOURNAMENTS',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Padding(
                padding: const EdgeInsets.only(left: 55),
                child: Text(
                  'Choose your competition',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 13,
                  ),
                ),
              ),

              const SizedBox(height: 28),

              Expanded(
                child: GridView.builder(
                  itemCount: tournaments.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 2.4,
                  ),
                  itemBuilder: (context, index) {
                    final tournament = tournaments[index];

                    return _TournamentCard(
                      tournament: tournament,
                      onTap: () {
                        _openTournament(context, tournament);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openTournament(
      BuildContext context,
      Tournament tournament,
      ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${tournament.name} ${tournament.season} selected',
        ),
        backgroundColor: AppTheme.surfaceBlack,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

class _TournamentCard extends StatelessWidget {
  final Tournament tournament;
  final VoidCallback onTap;

  const _TournamentCard({
    required this.tournament,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLeague =
        tournament.type == TournamentType.league;

    return Material(
      color: AppTheme.surfaceBlack,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppTheme.primaryGold.withOpacity(0.10),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.primaryGold.withOpacity(0.12),
                ),
                child: Icon(
                  isLeague
                      ? Icons.emoji_events_rounded
                      : Icons.public_rounded,
                  color: AppTheme.primaryGold,
                  size: 32,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tournament.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      '${tournament.season} • '
                          '${tournament.teamCount} Teams',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.45),
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      '${tournament.oversPerMatch} Overs',
                      style: const TextStyle(
                        color: AppTheme.primaryGold,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),

              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
                color: AppTheme.primaryGold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}