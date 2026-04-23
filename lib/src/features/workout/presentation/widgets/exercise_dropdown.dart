import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class ExerciseDropdown extends StatelessWidget {
  final List<String> exercises = ["Bench Press", "Squats", "Deadlift", "Push-ups"];
  final Function(String?) onChanged;

  ExerciseDropdown({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.surface, // That slightly lighter dark green
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      hint: const Text("Select an exercise", style: TextStyle(color: Colors.white60)),
      dropdownColor: AppColors.surface,
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white60),
      items: exercises.map((String exercise) {
        return DropdownMenuItem<String>(
          value: exercise,
          child: Text(exercise, style: const TextStyle(color: Colors.white)),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}