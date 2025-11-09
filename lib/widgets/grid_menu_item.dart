import 'package:flutter/material.dart';

class GridMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final double progress; // 0.0 - 1.0

  const GridMenuItem({
    super.key,
    required this.icon,
    required this.label,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: const EdgeInsets.all(12),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 8,
              backgroundColor: Colors.purple.shade100,
              color: Colors.deepPurple,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: Colors.deepPurple),
              const SizedBox(height: 6),
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${(progress * 100).toStringAsFixed(0)}%',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
