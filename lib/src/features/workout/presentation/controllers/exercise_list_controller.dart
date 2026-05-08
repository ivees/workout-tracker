import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/exercise_repository.dart';
import '../../domain/exercise.dart';

part 'exercise_controller.g.dart';

@riverpod
class ExerciseController extends _$ExerciseController {
  @override
  Stream<List<Exercise>> build(String categoryUuid) {
    final repository = ref.watch(exerciseRepositoryProvider);
    return repository.watchExercisesByCategory(categoryUuid);
  }

  // Future logic for adding custom exercises
  Future<void> addCustomExercise(String name, String categoryUuid) async {
    // Implementation for custom adding...
  }

  /// Delete a category (logic for your trash icon/swipe)
  Future<void> deleteExercise(Id id) async {
    final repository = ref.read(exerciseRepositoryProvider);
    
    // In a real app, you might want to check if exercises exist 
    // in this category before deleting.
    await repository.deleteExercise(id); 
  }
}