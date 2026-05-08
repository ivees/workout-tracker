import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/category_repository.dart';
import '../../domain/exercise_category.dart';

part 'category_controller.g.dart';

@riverpod
class CategoryController extends _$CategoryController {
  @override
  Stream<List<ExerciseCategory>> build() {
    // 1. Get the repository
    final repository = ref.watch(categoryRepositoryProvider);
    
    // 2. Return the stream that watches Isar
    // This makes the controller automatically reactive
    return repository.watchCategories();
  }

  /// Add a new category via the repository
  Future<void> addCategory(String name) async {
    final repository = ref.read(categoryRepositoryProvider);
    
    // You could add a loading state logic here if needed
    await repository.addCustomCategory(name: name);
  }

  /// Delete a category (logic for your trash icon/swipe)
  Future<void> deleteCategory(Id id) async {
    final repository = ref.read(categoryRepositoryProvider);
    
    // In a real app, you might want to check if exercises exist 
    // in this category before deleting.
    await repository.deleteCategory(id); 
  }
}