import 'package:flutter/material.dart';

class ExerciseListItem extends StatelessWidget {
  final String name;
  final String subtitle;
  final bool isCompleted;

  const ExerciseListItem({
    super.key,
    required this.name,
    required this.subtitle,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white60),
                ),
              ],
            ),
          ),
          // Custom Circular Checkbox
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isCompleted 
                  ? Colors.green.withOpacity(0.1) 
                  : Colors.white10,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check,
              color: isCompleted ? const Color(0xFF1ED700) : Colors.white24,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}