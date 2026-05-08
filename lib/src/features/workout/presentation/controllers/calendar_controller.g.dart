// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../calendar/presentation/controllers/calendar_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workoutsForDayHash() => r'42a7554e0b9bda72f66294a8af256d57c19a71b8';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [workoutsForDay].
@ProviderFor(workoutsForDay)
const workoutsForDayProvider = WorkoutsForDayFamily();

/// See also [workoutsForDay].
class WorkoutsForDayFamily extends Family<AsyncValue<List<WorkoutSet>>> {
  /// See also [workoutsForDay].
  const WorkoutsForDayFamily();

  /// See also [workoutsForDay].
  WorkoutsForDayProvider call(
    DateTime date,
  ) {
    return WorkoutsForDayProvider(
      date,
    );
  }

  @override
  WorkoutsForDayProvider getProviderOverride(
    covariant WorkoutsForDayProvider provider,
  ) {
    return call(
      provider.date,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'workoutsForDayProvider';
}

/// See also [workoutsForDay].
class WorkoutsForDayProvider
    extends AutoDisposeStreamProvider<List<WorkoutSet>> {
  /// See also [workoutsForDay].
  WorkoutsForDayProvider(
    DateTime date,
  ) : this._internal(
          (ref) => workoutsForDay(
            ref as WorkoutsForDayRef,
            date,
          ),
          from: workoutsForDayProvider,
          name: r'workoutsForDayProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$workoutsForDayHash,
          dependencies: WorkoutsForDayFamily._dependencies,
          allTransitiveDependencies:
              WorkoutsForDayFamily._allTransitiveDependencies,
          date: date,
        );

  WorkoutsForDayProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.date,
  }) : super.internal();

  final DateTime date;

  @override
  Override overrideWith(
    Stream<List<WorkoutSet>> Function(WorkoutsForDayRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WorkoutsForDayProvider._internal(
        (ref) => create(ref as WorkoutsForDayRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<WorkoutSet>> createElement() {
    return _WorkoutsForDayProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkoutsForDayProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WorkoutsForDayRef on AutoDisposeStreamProviderRef<List<WorkoutSet>> {
  /// The parameter `date` of this provider.
  DateTime get date;
}

class _WorkoutsForDayProviderElement
    extends AutoDisposeStreamProviderElement<List<WorkoutSet>>
    with WorkoutsForDayRef {
  _WorkoutsForDayProviderElement(super.provider);

  @override
  DateTime get date => (origin as WorkoutsForDayProvider).date;
}

String _$calendarControllerHash() =>
    r'cb81f0a650b0a9e154d5851ad8678ec957b2ac5a';

/// See also [CalendarController].
@ProviderFor(CalendarController)
final calendarControllerProvider =
    AutoDisposeNotifierProvider<CalendarController, DateTime>.internal(
  CalendarController.new,
  name: r'calendarControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$calendarControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CalendarController = AutoDisposeNotifier<DateTime>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
