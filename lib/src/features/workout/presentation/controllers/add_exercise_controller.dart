import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import '../../domain/workout_set.dart'; // Using the model we created earlier

part 'add_exercise_controller.g.dart';

@riverpod
class AddExerciseController extends _$AddExerciseController {
  @override
  List<WorkoutSet> build() => [
    WorkoutSet(uuid: const Uuid().v4()), // Start with 1 empty set
  ];

  void addSet() {
    state = [...state, WorkoutSet(uuid: const Uuid().v4())];
  }

  void removeSet(String uuid) {
    if (state.length > 1) {
      state = state.where((s) => s.uuid != uuid).toList();
    }
  }

  void updateSet(String uuid, {int? reps, double? weight}) {
    state = [
      for (final s in state)
        if (s.uuid == uuid) s.copyWith(reps: reps ?? s.reps, weight: weight ?? s.weight)
        else s,
    ];
  }
}