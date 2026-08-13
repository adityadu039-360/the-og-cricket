import 'package:flutter/material.dart';

class QuickPlayInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const QuickPlayInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF12283A),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: const Color(0xFF294359),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF00E5D4),
            size: 19,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}