import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../workout/domain/workout_set.dart';
import '../../../workout/data/workout_repository.dart';

part '../../../workout/presentation/controllers/calendar_controller.g.dart';

@riverpod
class CalendarController extends _$CalendarController {
  @override
  DateTime build() => DateTime.now();

  void onDaySelected(DateTime selectedDay) {
    state = selectedDay;
  }
}

@riverpod
Stream<List<WorkoutSet>> workoutsForDay(Ref ref, DateTime date) {
  final repository = ref.watch(workoutRepositoryProvider);
  // We'll need to implement this specific filter in the repository
  return repository.watchWorkoutsByDate(date);
}