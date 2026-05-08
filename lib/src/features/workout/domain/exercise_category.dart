import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'exercise_category.freezed.dart';
part 'exercise_category.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class ExerciseCategory with _$ExerciseCategory {
  const ExerciseCategory._();

  const factory ExerciseCategory({
    // Isar automatically handles 'Id id' as the primary key
    @Default(Isar.autoIncrement) Id isarId,
    required String uuid,
    required String name,
    @Default('') String imagePath, // Ensure imagePath has a default or is required
    @Default(false) bool isCustom,
  }) = _ExerciseCategory;

  @override
  Id get id => isarId;

  factory ExerciseCategory.fromJson(Map<String, dynamic> json) => 
      _$ExerciseCategoryFromJson(json);
}