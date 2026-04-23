import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/quote_card.dart';
import '../widgets/exercise_list_item.dart';

class TodayWorkoutScreen extends ConsumerWidget {
  const TodayWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // In a real app, you would watch a provider here:
    // final workout = ref.watch(workoutControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Date and Header
              Text(
                "Monday, October 26",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white60,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Today’s Workout",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              
              const SizedBox(height: 30),
              const QuoteCard(),
              
              const SizedBox(height: 40),
              Text(
                "Exercises",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              
              // List of Exercises
              const ExerciseListItem(
                name: "Bench Press",
                subtitle: "3 sets · 10 reps · 135 lbs",
                isCompleted: true,
              ),
              const ExerciseListItem(
                name: "Squats",
                subtitle: "3 sets · 8 reps · 185 lbs",
                isCompleted: true,
              ),
              const ExerciseListItem(
                name: "Dumbbell Rows",
                subtitle: "3 sets · 12 reps · 50 lbs",
                isCompleted: true,
              ),
              const ExerciseListItem(
                name: "Push-ups",
                subtitle: "3 sets · 15 reps · Bodyweight",
                isCompleted: true,
              ),
              const SizedBox(height: 100), // Space for FAB
            ],
          ),
        ),
      ),
    );
  }
}