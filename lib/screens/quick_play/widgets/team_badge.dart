import 'package:flutter/material.dart';

class TeamBadge extends StatelessWidget {
  final String shortName;
  final String teamName;
  final bool highlighted;

  const TeamBadge({
    super.key,
    required this.shortName,
    required this.teamName,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color borderColor = highlighted
        ? const Color(0xFFFF6B00)
        : const Color(0xFF294B61);

    final Color badgeColor = highlighted
        ? const Color(0xFF17374A)
        : const Color(0xFF12283A);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor,
          width: highlighted ? 2 : 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 52,
            height: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF091827),
              border: Border.all(
                color: highlighted
                    ? const Color(0xFF00E5D4)
                    : const Color(0xFF294B61),
              ),
            ),
            child: Text(
              shortName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(height: 9),
          Text(
            teamName,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}