import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/workout/domain/exercise.dart';
import '../../features/workout/domain/exercise_category.dart';
import '../../features/workout/domain/workout_set.dart';

part 'isar_provider.g.dart';

@Riverpod(keepAlive: true) // keepAlive ensures the DB doesn't close randomly
Future<Isar> isar(Ref ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open(
    [WorkoutSetSchema, ExerciseCategorySchema, ExerciseSchema],
    directory: dir.path,
  );
}