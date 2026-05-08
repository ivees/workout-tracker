import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../core/constants/app_colors.dart';
import '../controllers/exercise_controller.dart';
import '../../domain/exercise.dart';

class ExerciseListTile extends ConsumerWidget {
  const ExerciseListTile({
    super.key,
    required this.exercise,
    required this.onTap,
  });

  final Exercise exercise;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Slidable(
        key: ValueKey(exercise.isarId),
        // Swipe from right to left to show actions
        endActionPane: ActionPane(
          extentRatio: 0.4,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                // TODO: Implement Edit Exercise (e.g., rename)
              },
              backgroundColor: AppColors.surface,
              foregroundColor: AppColors.primary,
              icon: Icons.edit,
              padding: const EdgeInsets.all(0),
            ),
            SlidableAction(
              onPressed: (context) => _confirmDelete(context, ref),
              backgroundColor: AppColors.danger,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              padding: const EdgeInsets.all(0),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            width: double.infinity,
            child: Text(
              exercise.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text("Delete Exercise", style: TextStyle(color: Colors.white)),
        content: Text("Are you sure you want to delete ${exercise.name}?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: Colors.white38)),
          ),
          TextButton(
            onPressed: () {
              // Using the controller with the specific category ID 
              // to handle the deletion from the correct stream
              ref.read(exerciseControllerProvider(exercise.categoryId).notifier)
                 .deleteExercise(exercise.isarId);
              Navigator.pop(context);
            },
            child: const Text("Delete", style: TextStyle(color: AppColors.danger)),
          ),
        ],
      ),
    );
  }
}