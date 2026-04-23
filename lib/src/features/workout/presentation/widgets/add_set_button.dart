import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workout_tracker/src/features/workout/presentation/controllers/add_exercise_controller.dart';
import 'package:workout_tracker/src/core/constants/app_colors.dart';

class AddSetButton extends ConsumerWidget {
  const AddSetButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: TextButton.icon(
        onPressed: () => ref.read(addExerciseControllerProvider.notifier).addSet(),
        icon: const Icon(Icons.add, color: AppColors.primary, size: 20),
        label: const Text("Add Set", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primary.withValues(alpha: 0.1),
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}