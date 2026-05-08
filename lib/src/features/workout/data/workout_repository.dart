import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/database/isar_provider.dart';
import '../domain/workout_set.dart';

part 'workout_repository.g.dart';

class WorkoutRepository {
  final Isar isar;
  WorkoutRepository(this.isar);

  /// Saves a list of workout sets to the database
  Future<void> saveWorkoutSets(List<WorkoutSet> sets) async {
    await isar.writeTxn(() => isar.workoutSets.putAll(sets));
  }

  /// Get performance history for a specific exercise using its unique ID
  /// Changed exerciseName to exerciseId to match the updated WorkoutSet model
  Stream<List<WorkoutSet>> watchPerformance(String exerciseId) {
    return isar.workoutSets
        .filter()
        .exerciseIdEqualTo(exerciseId) // Querying by the UUID string
        .sortByDateDesc()
        .watch(fireImmediately: true);
  }

  Stream<List<WorkoutSet>> watchWorkoutsByDate(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return isar.workoutSets
        .filter()
        .dateGreaterThan(startOfDay.subtract(const Duration(milliseconds: 1)))
        .and()
        .dateLessThan(endOfDay)
        .watch(fireImmediately: true);
  }
}

@riverpod
WorkoutRepository workoutRepository(Ref ref) {
  // Using .requireValue is slightly safer than .value! if you are sure 
  // the provider has finished initializing.
  final isar = ref.watch(isarProvider).requireValue; 
  return WorkoutRepository(isar);
}