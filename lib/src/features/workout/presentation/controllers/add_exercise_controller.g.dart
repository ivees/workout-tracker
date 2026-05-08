// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_exercise_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupedPerformanceHash() =>
    r'6a76fa598f320062589a7422675ec7051c6d036a';

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

/// Updated Grouped Performance to use exerciseUuid
///
/// Copied from [groupedPerformance].
@ProviderFor(groupedPerformance)
const groupedPerformanceProvider = GroupedPerformanceFamily();

/// Updated Grouped Performance to use exerciseUuid
///
/// Copied from [groupedPerformance].
class GroupedPerformanceFamily
    extends Family<AsyncValue<List<MapEntry<DateTime, List<WorkoutSet>>>>> {
  /// Updated Grouped Performance to use exerciseUuid
  ///
  /// Copied from [groupedPerformance].
  const GroupedPerformanceFamily();

  /// Updated Grouped Performance to use exerciseUuid
  ///
  /// Copied from [groupedPerformance].
  GroupedPerformanceProvider call(
    String exerciseId,
  ) {
    return GroupedPerformanceProvider(
      exerciseId,
    );
  }

  @override
  GroupedPerformanceProvider getProviderOverride(
    covariant GroupedPerformanceProvider provider,
  ) {
    return call(
      provider.exerciseId,
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
  String? get name => r'groupedPerformanceProvider';
}

/// Updated Grouped Performance to use exerciseUuid
///
/// Copied from [groupedPerformance].
class GroupedPerformanceProvider extends AutoDisposeStreamProvider<
    List<MapEntry<DateTime, List<WorkoutSet>>>> {
  /// Updated Grouped Performance to use exerciseUuid
  ///
  /// Copied from [groupedPerformance].
  GroupedPerformanceProvider(
    String exerciseId,
  ) : this._internal(
          (ref) => groupedPerformance(
            ref as GroupedPerformanceRef,
            exerciseId,
          ),
          from: groupedPerformanceProvider,
          name: r'groupedPerformanceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupedPerformanceHash,
          dependencies: GroupedPerformanceFamily._dependencies,
          allTransitiveDependencies:
              GroupedPerformanceFamily._allTransitiveDependencies,
          exerciseId: exerciseId,
        );

  GroupedPerformanceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.exerciseId,
  }) : super.internal();

  final String exerciseId;

  @override
  Override overrideWith(
    Stream<List<MapEntry<DateTime, List<WorkoutSet>>>> Function(
            GroupedPerformanceRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupedPerformanceProvider._internal(
        (ref) => create(ref as GroupedPerformanceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        exerciseId: exerciseId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<MapEntry<DateTime, List<WorkoutSet>>>>
      createElement() {
    return _GroupedPerformanceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupedPerformanceProvider &&
        other.exerciseId == exerciseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, exerciseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GroupedPerformanceRef on AutoDisposeStreamProviderRef<
    List<MapEntry<DateTime, List<WorkoutSet>>>> {
  /// The parameter `exerciseId` of this provider.
  String get exerciseId;
}

class _GroupedPerformanceProviderElement
    extends AutoDisposeStreamProviderElement<
        List<MapEntry<DateTime, List<WorkoutSet>>>> with GroupedPerformanceRef {
  _GroupedPerformanceProviderElement(super.provider);

  @override
  String get exerciseId => (origin as GroupedPerformanceProvider).exerciseId;
}

String _$addExerciseControllerHash() =>
    r'961733903858b9e094dc01a799599a84f04c759f';

/// See also [AddExerciseController].
@ProviderFor(AddExerciseController)
final addExerciseControllerProvider = AutoDisposeNotifierProvider<
    AddExerciseController, List<WorkoutSet>>.internal(
  AddExerciseController.new,
  name: r'addExerciseControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addExerciseControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddExerciseController = AutoDisposeNotifier<List<WorkoutSet>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
