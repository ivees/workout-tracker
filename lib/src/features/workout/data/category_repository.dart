import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import '../../../core/database/isar_provider.dart';
import '../domain/exercise_category.dart';

part 'category_repository.g.dart';

class CategoryRepository {
  final Isar isar;
  CategoryRepository(this.isar);

  /// Seeds initial categories if the database is empty
  Future<void> seedInitialCategories() async {
    final count = await isar.exerciseCategorys.count();
    
    if (count == 0) {
      final initialCategories = [
        const ExerciseCategory(uuid: '1', name: 'CHEST', imagePath: 'assets/images/chest.jpg'),
        const ExerciseCategory(uuid: '2', name: 'BACK', imagePath: 'assets/images/back.jpg'),
        const ExerciseCategory(uuid: '3', name: 'LEGS', imagePath: 'assets/images/legs.jpg'),
        const ExerciseCategory(uuid: '4', name: 'SHOULDERS', imagePath: 'assets/images/shoulders.jpg'),
        const ExerciseCategory(uuid: '5', name: 'BICEPS', imagePath: 'assets/images/biceps.jpg'),
        const ExerciseCategory(uuid: '6', name: 'ABS', imagePath: 'assets/images/abs.jpg'),
      ];

      await isar.writeTxn(() async {
        await isar.exerciseCategorys.putAll(initialCategories);
      });
    }
  }

  /// Watch all categories (updates UI automatically)
  Stream<List<ExerciseCategory>> watchCategories() {
    return isar.exerciseCategorys.where().watch(fireImmediately: true);
  }

  /// Adds a new user-defined category to the database
  Future<void> addCustomCategory({
    required String name,
    String imagePath = 'assets/images/custom_placeholder.jpg',
  }) async {
    // 1. Create the new category instance
    final newCategory = ExerciseCategory(
      uuid: const Uuid().v4(), // Generates a unique string ID for cross-referencing
      name: name.toUpperCase(),
      imagePath: imagePath,
      isCustom: true,
    );

    // 2. Perform the write transaction
    await isar.writeTxn(() async {
      await isar.exerciseCategorys.put(newCategory);
    });
  }

  Future<void> deleteCategory(Id id) async {
    await isar.writeTxn(() async {
      await isar.exerciseCategorys.delete(id);
    });
  }
}

@riverpod
CategoryRepository categoryRepository(Ref ref) {
  final isar = ref.watch(isarProvider).requireValue;
  return CategoryRepository(isar);
}