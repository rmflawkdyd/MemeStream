import 'package:flutter/material.dart';

class SourceBadge extends StatelessWidget {
  final String source;

  const SourceBadge({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    final color = source == 'YouTube' ? Colors.red : Colors.teal;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: color.withValues(alpha: 0.4), // 선명한 테두리색
          width: 2,
        ),
      ),
      child: Text(
        source,
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
