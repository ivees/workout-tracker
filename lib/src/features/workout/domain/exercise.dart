import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'exercise.freezed.dart';
part 'exercise.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Exercise with _$Exercise {
  const Exercise._();

  const factory Exercise({
    @Default(Isar.autoIncrement) Id isarId,
    required String uuid, 
    required String name,
    required String categoryId, // This will match the 'uuid' of the category
    @Default('') String description,
  }) = _Exercise;

  @override
  Id get id => isarId;
}