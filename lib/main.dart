import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workout_tracker/src/features/workout/data/category_repository.dart';
import 'package:workout_tracker/src/features/workout/data/exercise_repository.dart';
import 'src/app.dart';
import 'src/core/database/isar_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Create a ProviderContainer to access providers before runApp
  final container = ProviderContainer();

  // 1. Await the Isar initialization
  await container.read(isarProvider.future);

  // 2. Run the category seed logic
  await container.read(categoryRepositoryProvider).seedInitialCategories();

  // 3. Run the exercise seed logic
  await container.read(exerciseRepositoryProvider).seedInitialExercises();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}