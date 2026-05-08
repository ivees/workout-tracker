import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/database/isar_provider.dart';
import '../domain/exercise.dart';

part 'exercise_repository.g.dart';

class ExerciseRepository {
  final Isar isar;
  ExerciseRepository(this.isar);

  /// Seeds exercises if the database is empty
  Future<void> seedInitialExercises() async {
    final count = await isar.exercises.count();
    
    if (count == 0) {
      final initialExercises = [
        // CHEST
        const Exercise(uuid: '1', name: 'Bench Press', categoryId: '1'),
        const Exercise(uuid: '2', name: 'Incline Dumbbell Press', categoryId: '1'),
        const Exercise(uuid: '3', name: 'Chest Fly', categoryId: '1'),
        
        // BACK
        const Exercise(uuid: '4', name: 'Lat Pulldown', categoryId: '2'),
        const Exercise(uuid: '5', name: 'Bent Over Row', categoryId: '2'),
        
        // LEGS
        const Exercise(uuid: '6', name: 'Squat', categoryId: '3'),
        const Exercise(uuid: '7', name: 'Leg Extension', categoryId: '3'),
      ];

      await isar.writeTxn(() async {
        await isar.exercises.putAll(initialExercises);
      });
    }
  }

  /// Watch exercises filtered by a specific category UUID
  Stream<List<Exercise>> watchExercisesByCategory(String categoryUuid) {
    return isar.exercises
        .filter()
        .categoryIdEqualTo(categoryUuid)
        .watch(fireImmediately: true);
  }

  Future<void> deleteExercise(Id id) async {
    await isar.writeTxn(() async {
      await isar.exercises.delete(id);
    });
  }

  Stream<List<Exercise>> watchAllExercises() {
    return isar.exercises.where().watch(fireImmediately: true);
  }
}

@riverpod
ExerciseRepository exerciseRepository(Ref ref) {
  final isar = ref.watch(isarProvider).requireValue;
  return ExerciseRepository(isar);
}