// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$exerciseControllerHash() =>
    r'3e1a1fd4c2716e91ac0f64d61fabce4d26a80704';

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

abstract class _$ExerciseController
    extends BuildlessAutoDisposeStreamNotifier<List<Exercise>> {
  late final String categoryUuid;

  Stream<List<Exercise>> build(
    String categoryUuid,
  );
}

/// See also [ExerciseController].
@ProviderFor(ExerciseController)
const exerciseControllerProvider = ExerciseControllerFamily();

/// See also [ExerciseController].
class ExerciseControllerFamily extends Family<AsyncValue<List<Exercise>>> {
  /// See also [ExerciseController].
  const ExerciseControllerFamily();

  /// See also [ExerciseController].
  ExerciseControllerProvider call(
    String categoryUuid,
  ) {
    return ExerciseControllerProvider(
      categoryUuid,
    );
  }

  @override
  ExerciseControllerProvider getProviderOverride(
    covariant ExerciseControllerProvider provider,
  ) {
    return call(
      provider.categoryUuid,
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
  String? get name => r'exerciseControllerProvider';
}

/// See also [ExerciseController].
class ExerciseControllerProvider extends AutoDisposeStreamNotifierProviderImpl<
    ExerciseController, List<Exercise>> {
  /// See also [ExerciseController].
  ExerciseControllerProvider(
    String categoryUuid,
  ) : this._internal(
          () => ExerciseController()..categoryUuid = categoryUuid,
          from: exerciseControllerProvider,
          name: r'exerciseControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exerciseControllerHash,
          dependencies: ExerciseControllerFamily._dependencies,
          allTransitiveDependencies:
              ExerciseControllerFamily._allTransitiveDependencies,
          categoryUuid: categoryUuid,
        );

  ExerciseControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryUuid,
  }) : super.internal();

  final String categoryUuid;

  @override
  Stream<List<Exercise>> runNotifierBuild(
    covariant ExerciseController notifier,
  ) {
    return notifier.build(
      categoryUuid,
    );
  }

  @override
  Override overrideWith(ExerciseController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ExerciseControllerProvider._internal(
        () => create()..categoryUuid = categoryUuid,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryUuid: categoryUuid,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<ExerciseController, List<Exercise>>
      createElement() {
    return _ExerciseControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExerciseControllerProvider &&
        other.categoryUuid == categoryUuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryUuid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ExerciseControllerRef
    on AutoDisposeStreamNotifierProviderRef<List<Exercise>> {
  /// The parameter `categoryUuid` of this provider.
  String get categoryUuid;
}

class _ExerciseControllerProviderElement
    extends AutoDisposeStreamNotifierProviderElement<ExerciseController,
        List<Exercise>> with ExerciseControllerRef {
  _ExerciseControllerProviderElement(super.provider);

  @override
  String get categoryUuid =>
      (origin as ExerciseControllerProvider).categoryUuid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
