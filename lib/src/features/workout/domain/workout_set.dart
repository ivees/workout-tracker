import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'workout_set.freezed.dart';
part 'workout_set.g.dart';

@freezed
@Collection(ignore: {'copyWith'}) // Isar 3 doesn't use (ignore: [])
class WorkoutSet with _$WorkoutSet {
  const WorkoutSet._();

  const factory WorkoutSet({
    // Isar 3 uses 'Id' type for the primary key
    @Default(Isar.autoIncrement) Id isarId,
    required String uuid,
    required String exerciseId,
    @Default(0) int reps,
    @Default(0) double weight,
    required DateTime date,
  }) = _WorkoutSet;

  // 2. Add this getter so Isar can see the id property on the class level
  @override
  Id get id => isarId;

  factory WorkoutSet.fromJson(Map<String, dynamic> json) => 
      _$WorkoutSetFromJson(json);
}