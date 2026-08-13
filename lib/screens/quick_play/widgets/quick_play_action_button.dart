import 'package:flutter/material.dart';

class QuickPlayActionButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool primary;

  const QuickPlayActionButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.primary = true,
  });

  @override
  Widget build(BuildContext context) {
    final bool enabled = onPressed != null;

    final Color backgroundColor = primary
        ? const Color(0xFFFF6B00)
        : const Color(0xFF12283A);

    final Color foregroundColor =
    enabled ? Colors.white : Colors.white38;

    final BorderSide border = primary
        ? BorderSide.none
        : const BorderSide(
      color: Color(0xFF294B61),
    );

    return SizedBox(
      height: 46,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
          enabled ? backgroundColor : const Color(0xFF263746),
          foregroundColor: foregroundColor,
          elevation: 0,
          side: border,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 18,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}