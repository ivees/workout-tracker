// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rest_timer_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RestTimerState {
  int get seconds => throw _privateConstructorUsedError;
  bool get isRunning => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RestTimerStateCopyWith<RestTimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestTimerStateCopyWith<$Res> {
  factory $RestTimerStateCopyWith(
          RestTimerState value, $Res Function(RestTimerState) then) =
      _$RestTimerStateCopyWithImpl<$Res, RestTimerState>;
  @useResult
  $Res call({int seconds, bool isRunning});
}

/// @nodoc
class _$RestTimerStateCopyWithImpl<$Res, $Val extends RestTimerState>
    implements $RestTimerStateCopyWith<$Res> {
  _$RestTimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seconds = null,
    Object? isRunning = null,
  }) {
    return _then(_value.copyWith(
      seconds: null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
      isRunning: null == isRunning
          ? _value.isRunning
          : isRunning // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestTimerStateImplCopyWith<$Res>
    implements $RestTimerStateCopyWith<$Res> {
  factory _$$RestTimerStateImplCopyWith(_$RestTimerStateImpl value,
          $Res Function(_$RestTimerStateImpl) then) =
      __$$RestTimerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int seconds, bool isRunning});
}

/// @nodoc
class __$$RestTimerStateImplCopyWithImpl<$Res>
    extends _$RestTimerStateCopyWithImpl<$Res, _$RestTimerStateImpl>
    implements _$$RestTimerStateImplCopyWith<$Res> {
  __$$RestTimerStateImplCopyWithImpl(
      _$RestTimerStateImpl _value, $Res Function(_$RestTimerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seconds = null,
    Object? isRunning = null,
  }) {
    return _then(_$RestTimerStateImpl(
      seconds: null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
      isRunning: null == isRunning
          ? _value.isRunning
          : isRunning // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RestTimerStateImpl implements _RestTimerState {
  const _$RestTimerStateImpl({this.seconds = 0, this.isRunning = false});

  @override
  @JsonKey()
  final int seconds;
  @override
  @JsonKey()
  final bool isRunning;

  @override
  String toString() {
    return 'RestTimerState(seconds: $seconds, isRunning: $isRunning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestTimerStateImpl &&
            (identical(other.seconds, seconds) || other.seconds == seconds) &&
            (identical(other.isRunning, isRunning) ||
                other.isRunning == isRunning));
  }

  @override
  int get hashCode => Object.hash(runtimeType, seconds, isRunning);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestTimerStateImplCopyWith<_$RestTimerStateImpl> get copyWith =>
      __$$RestTimerStateImplCopyWithImpl<_$RestTimerStateImpl>(
          this, _$identity);
}

abstract class _RestTimerState implements RestTimerState {
  const factory _RestTimerState({final int seconds, final bool isRunning}) =
      _$RestTimerStateImpl;

  @override
  int get seconds;
  @override
  bool get isRunning;
  @override
  @JsonKey(ignore: true)
  _$$RestTimerStateImplCopyWith<_$RestTimerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
