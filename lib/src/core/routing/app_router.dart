import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:workout_tracker/src/features/workout/presentation/screens/exercise_list_screen.dart';

// Import your screens
import '../../features/home/presentation/screens/main_screen.dart';
import '../../features/workout/presentation/screens/add_exercise_screen.dart';
import '../../features/workout/presentation/screens/exercise_category_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      // The Main Tab Wrapper (Home, Calendar, etc.)
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const MainScreen(),
      ),
      
      // The Add Exercise Screen (Full screen, no nav bar)
      GoRoute(
        path: '/add-exercise/:categoryUuid/:exerciseUuid',
        name: 'add-exercise',
        builder: (context, state) {
          final categoryUuid = state.pathParameters['categoryUuid']!;
          final exerciseUuid = state.pathParameters['exerciseUuid']!;

          // We can pass the exercise name or the whole object via 'extra'
          // Let's assume you're passing a Map or a specific object
          final extraData = state.extra as Map<String, dynamic>;
          final exerciseName = extraData['exerciseName'] as String;
          final categoryName = extraData['categoryName'] as String;

          return AddExerciseScreen(
            categoryUuid: categoryUuid,
            exerciseUuid: exerciseUuid,
            exerciseName: exerciseName,
            categoryName: categoryName,
          );
        },
      ),
      GoRoute(
        path: '/exercise-category',
        name: 'exercise-category',
        builder: (context, state) => const ExerciseCategoryScreen(),
      ),
      GoRoute(
        path: '/exercises/:categoryUuid',
        name: 'exercises',
        builder: (context, state) {
          final categoryUuid = state.pathParameters['categoryUuid']!;
          final categoryName = state.extra as String? ?? 'Exercises';
          return ExerciseListScreen(
            categoryUuid: categoryUuid, 
            categoryName: categoryName,
          );
        },
      ),
    ],
  );
}