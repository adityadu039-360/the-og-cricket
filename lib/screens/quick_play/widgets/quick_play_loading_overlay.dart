import 'package:flutter/material.dart';

class QuickPlayLoadingOverlay extends StatelessWidget {
  final String message;

  const QuickPlayLoadingOverlay({
    super.key,
    this.message = 'PREPARING MATCH...',
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Material(
        color: const Color(0xE6050D19),
        child: Center(
          child: Container(
            width: 300,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 28,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF10283A),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFF294B61),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 42,
                  height: 42,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFF00E5D4),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 7),
                const Text(
                  'PLEASE WAIT',
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}