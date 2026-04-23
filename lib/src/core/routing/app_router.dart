import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Import your screens
import '../../features/home/presentation/screens/main_screen.dart';
import '../../features/workout/presentation/screens/add_exercise_screen.dart';

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
        path: '/add-exercise',
        name: 'add-exercise',
        // Use a material page for standard transitions
        builder: (context, state) => const AddExerciseScreen(),
      ),
    ],
  );
}