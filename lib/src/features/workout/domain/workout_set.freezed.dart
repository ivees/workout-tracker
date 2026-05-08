// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutSet _$WorkoutSetFromJson(Map<String, dynamic> json) {
  return _WorkoutSet.fromJson(json);
}

/// @nodoc
mixin _$WorkoutSet {
// Isar 3 uses 'Id' type for the primary key
  int get isarId => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  String get exerciseId => throw _privateConstructorUsedError;
  int get reps => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutSetCopyWith<WorkoutSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSetCopyWith<$Res> {
  factory $WorkoutSetCopyWith(
          WorkoutSet value, $Res Function(WorkoutSet) then) =
      _$WorkoutSetCopyWithImpl<$Res, WorkoutSet>;
  @useResult
  $Res call(
      {int isarId,
      String uuid,
      String exerciseId,
      int reps,
      double weight,
      DateTime date});
}

/// @nodoc
class _$WorkoutSetCopyWithImpl<$Res, $Val extends WorkoutSet>
    implements $WorkoutSetCopyWith<$Res> {
  _$WorkoutSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isarId = null,
    Object? uuid = null,
    Object? exerciseId = null,
    Object? reps = null,
    Object? weight = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      isarId: null == isarId
          ? _value.isarId
          : isarId // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      reps: null == reps
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutSetImplCopyWith<$Res>
    implements $WorkoutSetCopyWith<$Res> {
  factory _$$WorkoutSetImplCopyWith(
          _$WorkoutSetImpl value, $Res Function(_$WorkoutSetImpl) then) =
      __$$WorkoutSetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int isarId,
      String uuid,
      String exerciseId,
      int reps,
      double weight,
      DateTime date});
}

/// @nodoc
class __$$WorkoutSetImplCopyWithImpl<$Res>
    extends _$WorkoutSetCopyWithImpl<$Res, _$WorkoutSetImpl>
    implements _$$WorkoutSetImplCopyWith<$Res> {
  __$$WorkoutSetImplCopyWithImpl(
      _$WorkoutSetImpl _value, $Res Function(_$WorkoutSetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isarId = null,
    Object? uuid = null,
    Object? exerciseId = null,
    Object? reps = null,
    Object? weight = null,
    Object? date = null,
  }) {
    return _then(_$WorkoutSetImpl(
      isarId: null == isarId
          ? _value.isarId
          : isarId // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      reps: null == reps
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutSetImpl extends _WorkoutSet {
  const _$WorkoutSetImpl(
      {this.isarId = Isar.autoIncrement,
      required this.uuid,
      required this.exerciseId,
      this.reps = 0,
      this.weight = 0,
      required this.date})
      : super._();

  factory _$WorkoutSetImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutSetImplFromJson(json);

// Isar 3 uses 'Id' type for the primary key
  @override
  @JsonKey()
  final int isarId;
  @override
  final String uuid;
  @override
  final String exerciseId;
  @override
  @JsonKey()
  final int reps;
  @override
  @JsonKey()
  final double weight;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'WorkoutSet(isarId: $isarId, uuid: $uuid, exerciseId: $exerciseId, reps: $reps, weight: $weight, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSetImpl &&
            (identical(other.isarId, isarId) || other.isarId == isarId) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isarId, uuid, exerciseId, reps, weight, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSetImplCopyWith<_$WorkoutSetImpl> get copyWith =>
      __$$WorkoutSetImplCopyWithImpl<_$WorkoutSetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutSetImplToJson(
      this,
    );
  }
}

abstract class _WorkoutSet extends WorkoutSet {
  const factory _WorkoutSet(
      {final int isarId,
      required final String uuid,
      required final String exerciseId,
      final int reps,
      final double weight,
      required final DateTime date}) = _$WorkoutSetImpl;
  const _WorkoutSet._() : super._();

  factory _WorkoutSet.fromJson(Map<String, dynamic> json) =
      _$WorkoutSetImpl.fromJson;

  @override // Isar 3 uses 'Id' type for the primary key
  int get isarId;
  @override
  String get uuid;
  @override
  String get exerciseId;
  @override
  int get reps;
  @override
  double get weight;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutSetImplCopyWith<_$WorkoutSetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
