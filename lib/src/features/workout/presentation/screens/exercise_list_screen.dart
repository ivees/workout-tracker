import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../controllers/exercise_list_controller.dart';
import '../widgets/exercise_list_tile.dart'; // We'll create this next

class ExerciseListScreen extends ConsumerWidget {
  final String categoryUuid;
  final String categoryName;

  const ExerciseListScreen({
    super.key,
    required this.categoryUuid,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Uses the parameterized controller we built earlier
    final exercisesAsync = ref.watch(exerciseControllerProvider(categoryUuid));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: const BackButton(color: AppColors.textPrimary),
        title: Text(
          '${categoryName.toUpperCase()} EXERCISES',
          style: const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'SELECT EXERCISE',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 48,
                height: 3,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: exercisesAsync.when(
                  loading: () => const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                  error: (e, _) => Center(
                    child: Text(
                      'Error: $e',
                      style: const TextStyle(color: Colors.white60),
                    ),
                  ),
                  data: (exercises) => ListView.separated(
                    itemCount: exercises.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final exercise = exercises[index];
                      return ExerciseListTile(
                        exercise: exercise,
                        onTap: () {
                          context.pushNamed(
                            'add-exercise',
                            pathParameters: {
                              'categoryUuid':
                                  categoryUuid, // From the screen property
                              'exerciseUuid': exercise
                                  .uuid, // From the current exercise item
                            },
                            extra: {
                              'exerciseName': exercise.name,
                              'categoryName': categoryName,
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.black,
        onPressed: () {
          // TODO: Logic to add a custom exercise to this specific category
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}