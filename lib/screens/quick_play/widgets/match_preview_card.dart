import 'package:flutter/material.dart';

class MatchPreviewCard extends StatelessWidget {
  final String homeTeam;
  final String awayTeam;
  final String homeShortName;
  final String awayShortName;
  final String format;
  final String overs;

  const MatchPreviewCard({
    super.key,
    required this.homeTeam,
    required this.awayTeam,
    required this.homeShortName,
    required this.awayShortName,
    required this.format,
    required this.overs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF10283A),
            Color(0xFF0B1C2B),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF294B61),
        ),
      ),
      child: Column(
        children: [
          const Text(
            'MATCH PREVIEW',
            style: TextStyle(
              color: Color(0xFF00E5D4),
              fontSize: 11,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _team(
                  name: homeTeam,
                  shortName: homeShortName,
                  alignment: CrossAxisAlignment.end,
                ),
              ),
              const SizedBox(width: 20),
              _vsBadge(),
              const SizedBox(width: 20),
              Expanded(
                child: _team(
                  name: awayTeam,
                  shortName: awayShortName,
                  alignment: CrossAxisAlignment.start,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 9,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF091827),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              '$format  •  $overs OVERS',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _team({
    required String name,
    required String shortName,
    required CrossAxisAlignment alignment,
  }) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          shortName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          name,
          textAlign: alignment == CrossAxisAlignment.end
              ? TextAlign.right
              : TextAlign.left,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _vsBadge() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFFF6B00),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF6B00).withValues(alpha: 0.25),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      child: const Center(
        child: Text(
          'VS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}