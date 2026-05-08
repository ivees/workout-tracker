import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import '../../domain/workout_set.dart';
import '../../../workout/data/workout_repository.dart';

part 'add_exercise_controller.g.dart';

@riverpod
class AddExerciseController extends _$AddExerciseController {
  @override
  List<WorkoutSet> build() => [
        // Initialize with one empty set
        // Note: exerciseId is empty initially; we'll fill it on save
        WorkoutSet(
          uuid: const Uuid().v4(), 
          date: DateTime.now(), 
          exerciseId: '', 
        ),
      ];

  void addSet() {
    state = [
      ...state,
      WorkoutSet(
        uuid: const Uuid().v4(), 
        date: DateTime.now(), 
        exerciseId: '',
      )
    ];
  }

  void removeSet(String uuid) {
    if (state.length > 1) {
      state = state.where((s) => s.uuid != uuid).toList();
    }
  }

  void updateSet(String uuid, {int? reps, double? weight}) {
    state = [
      for (final s in state)
        if (s.uuid == uuid)
          s.copyWith(reps: reps ?? s.reps, weight: weight ?? s.weight)
        else
          s,
    ];
  }

  /// Final Save Method using the unique Exercise ID
  Future<void> saveCurrentWorkout(String exerciseId) async {
    if (exerciseId.isEmpty) return;

    // 1. Filter the state to include only sets with valid values
    // This prevents saving 0 reps or 0 kg sets to history
    final validSets = state.where((s) => s.reps > 0 && s.weight > 0).toList();

    // 2. If no valid sets exist, we don't save anything
    if (validSets.isEmpty) return;

    // 3. Map the valid sets to include the correct exerciseId
    final setsToSave = validSets.map((s) => s.copyWith(
      exerciseId: exerciseId,
    )).toList();

    // 4. Perform the database write
    await ref.read(workoutRepositoryProvider).saveWorkoutSets(setsToSave);

    // 5. Reset state to a single empty set for the next time the screen opens
    state = [
      WorkoutSet(
        uuid: const Uuid().v4(), 
        date: DateTime.now(), 
        exerciseId: '',
      )
    ];
  }
}

/// Updated Grouped Performance to use exerciseUuid
@riverpod
Stream<List<MapEntry<DateTime, List<WorkoutSet>>>> groupedPerformance(
    Ref ref, String exerciseId) {
  final repository = ref.watch(workoutRepositoryProvider);

  // Repository method should now take the UUID
  return repository.watchPerformance(exerciseId).map((sets) {
    final grouped = <DateTime, List<WorkoutSet>>{};

    for (var set in sets) {
      // Normalize date to YYYY-MM-DD
      final dateOnly = DateTime(set.date.year, set.date.month, set.date.day);
      grouped.putIfAbsent(dateOnly, () => []).add(set);
    }

    return grouped.entries.toList()
      ..sort((a, b) => b.key.compareTo(a.key));
  });
}