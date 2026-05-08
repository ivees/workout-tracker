import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../core/constants/app_colors.dart';
import '../controllers/category_controller.dart';
import '../../domain/exercise_category.dart';

class CategoryListTile extends ConsumerWidget {
  const CategoryListTile({
    super.key,
    required this.category,
    required this.onTap,
  });

  final ExerciseCategory category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Slidable(
        key: ValueKey(category.id),
        // Swipe from right to left to show actions
        endActionPane: ActionPane(
          extentRatio: 0.4,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                // TODO: Implement Edit
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
            // Matching your exact padding and decoration
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            // Ensure the container fills the width so the swipe area is consistent
            width: double.infinity, 
            child: Text(
              category.name,
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
        title: const Text("Delete Category", style: TextStyle(color: Colors.white)),
        content: Text("Are you sure you want to delete ${category.name}?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: Colors.white38)),
          ),
          TextButton(
            onPressed: () {
              ref.read(categoryControllerProvider.notifier).deleteCategory(category.id);
              Navigator.pop(context);
            },
            child: const Text("Delete", style: TextStyle(color: AppColors.danger)),
          ),
        ],
      ),
    );
  }
}