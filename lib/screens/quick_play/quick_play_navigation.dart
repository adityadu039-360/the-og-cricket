import 'package:flutter/material.dart';

import 'quick_play_route_args.dart';
import 'quick_play_settings_screen.dart';

class QuickPlayNavigation {
  const QuickPlayNavigation._();

  static Future<void> openSettings(
      BuildContext context, {
        required String homeTeam,
        required String awayTeam,
      }) async {
    final args = QuickPlayRouteArgs(
      homeTeam: homeTeam,
      awayTeam: awayTeam,
    );

    if (!args.hasValidTeams) {
      return;
    }

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => QuickPlaySettingsScreen(
          homeTeam: args.homeTeam,
          awayTeam: args.awayTeam,
        ),
      ),
    );
  }
}