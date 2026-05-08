// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExerciseCategory _$ExerciseCategoryFromJson(Map<String, dynamic> json) {
  return _ExerciseCategory.fromJson(json);
}

/// @nodoc
mixin _$ExerciseCategory {
// Isar automatically handles 'Id id' as the primary key
  int get isarId => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imagePath =>
      throw _privateConstructorUsedError; // Ensure imagePath has a default or is required
  bool get isCustom => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseCategoryCopyWith<ExerciseCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseCategoryCopyWith<$Res> {
  factory $ExerciseCategoryCopyWith(
          ExerciseCategory value, $Res Function(ExerciseCategory) then) =
      _$ExerciseCategoryCopyWithImpl<$Res, ExerciseCategory>;
  @useResult
  $Res call(
      {int isarId, String uuid, String name, String imagePath, bool isCustom});
}

/// @nodoc
class _$ExerciseCategoryCopyWithImpl<$Res, $Val extends ExerciseCategory>
    implements $ExerciseCategoryCopyWith<$Res> {
  _$ExerciseCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isarId = null,
    Object? uuid = null,
    Object? name = null,
    Object? imagePath = null,
    Object? isCustom = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      isCustom: null == isCustom
          ? _value.isCustom
          : isCustom // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseCategoryImplCopyWith<$Res>
    implements $ExerciseCategoryCopyWith<$Res> {
  factory _$$ExerciseCategoryImplCopyWith(_$ExerciseCategoryImpl value,
          $Res Function(_$ExerciseCategoryImpl) then) =
      __$$ExerciseCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int isarId, String uuid, String name, String imagePath, bool isCustom});
}

/// @nodoc
class __$$ExerciseCategoryImplCopyWithImpl<$Res>
    extends _$ExerciseCategoryCopyWithImpl<$Res, _$ExerciseCategoryImpl>
    implements _$$ExerciseCategoryImplCopyWith<$Res> {
  __$$ExerciseCategoryImplCopyWithImpl(_$ExerciseCategoryImpl _value,
      $Res Function(_$ExerciseCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isarId = null,
    Object? uuid = null,
    Object? name = null,
    Object? imagePath = null,
    Object? isCustom = null,
  }) {
    return _then(_$ExerciseCategoryImpl(
      isarId: null == isarId
          ? _value.isarId
          : isarId // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      isCustom: null == isCustom
          ? _value.isCustom
          : isCustom // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseCategoryImpl extends _ExerciseCategory {
  const _$ExerciseCategoryImpl(
      {this.isarId = Isar.autoIncrement,
      required this.uuid,
      required this.name,
      this.imagePath = '',
      this.isCustom = false})
      : super._();

  factory _$ExerciseCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseCategoryImplFromJson(json);

// Isar automatically handles 'Id id' as the primary key
  @override
  @JsonKey()
  final int isarId;
  @override
  final String uuid;
  @override
  final String name;
  @override
  @JsonKey()
  final String imagePath;
// Ensure imagePath has a default or is required
  @override
  @JsonKey()
  final bool isCustom;

  @override
  String toString() {
    return 'ExerciseCategory(isarId: $isarId, uuid: $uuid, name: $name, imagePath: $imagePath, isCustom: $isCustom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseCategoryImpl &&
            (identical(other.isarId, isarId) || other.isarId == isarId) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.isCustom, isCustom) ||
                other.isCustom == isCustom));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isarId, uuid, name, imagePath, isCustom);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseCategoryImplCopyWith<_$ExerciseCategoryImpl> get copyWith =>
      __$$ExerciseCategoryImplCopyWithImpl<_$ExerciseCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseCategoryImplToJson(
      this,
    );
  }
}

abstract class _ExerciseCategory extends ExerciseCategory {
  const factory _ExerciseCategory(
      {final int isarId,
      required final String uuid,
      required final String name,
      final String imagePath,
      final bool isCustom}) = _$ExerciseCategoryImpl;
  const _ExerciseCategory._() : super._();

  factory _ExerciseCategory.fromJson(Map<String, dynamic> json) =
      _$ExerciseCategoryImpl.fromJson;

  @override // Isar automatically handles 'Id id' as the primary key
  int get isarId;
  @override
  String get uuid;
  @override
  String get name;
  @override
  String get imagePath;
  @override // Ensure imagePath has a default or is required
  bool get isCustom;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseCategoryImplCopyWith<_$ExerciseCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
