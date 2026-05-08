import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/src/features/workout/domain/workout_set.dart';
import 'package:workout_tracker/src/features/workout/presentation/controllers/add_exercise_controller.dart';
import 'package:workout_tracker/src/features/workout/presentation/widgets/add_set_button.dart';
import 'package:workout_tracker/src/features/workout/presentation/widgets/rest_timer_widget.dart';
import 'package:workout_tracker/src/features/workout/presentation/widgets/set_input_row.dart';
import 'package:workout_tracker/src/core/constants/app_colors.dart';
import 'package:intl/intl.dart';

class AddExerciseScreen extends ConsumerStatefulWidget {
  final String categoryUuid;
  final String exerciseUuid;
  final String exerciseName;
  final String categoryName;

  const AddExerciseScreen({
    super.key,
    required this.categoryUuid,
    required this.exerciseUuid,
    required this.exerciseName,
    required this.categoryName,
  });

  @override
  ConsumerState<AddExerciseScreen> createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends ConsumerState<AddExerciseScreen> {

  @override
  Widget build(BuildContext context) {
    final sets = ref.watch(addExerciseControllerProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
        title: Text(
          widget.exerciseName.toUpperCase(), // Transform text to ALL CAPS
          style: const TextStyle(
            color: AppColors.primary, // Use your #1ED700 Neon Green
            fontWeight: FontWeight.bold,
            fontSize: 18, // Standard header size
            letterSpacing: 1.5, // Adds that premium athletic look
          ),
        ),
      ),
      body: Column(
        children: [
          // 1. Scrollable Area
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),

                  // 2. The Sets Header
                  const Text("Sets",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(height: 16),

                  // Watch the sets from the controller
                  Consumer(
                    builder: (context, ref, child) {
                      final sets = ref.watch(addExerciseControllerProvider);
                      return Column(
                        children: [
                          for (int i = 0; i < sets.length; i++)
                            SetInputRow(index: i + 1, setId: sets[i].uuid),
                          const SizedBox(height: 8),
                          const AddSetButton(),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 32),
                  const RestTimerWidget(),

                  const SizedBox(height: 32),
                  // Placeholder for future Past Performance
                  const Text("Past Performance",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(height: 16),
                  _PastPerformanceList(
                    exerciseUuid: widget.exerciseUuid, // Pass UUID for query
                    exerciseName: widget.exerciseName, // Pass Name for display
                  ),
                  // Extra padding at the bottom of the scroll view
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // 2. Sticky "Add" Button
          Padding(
            padding: const EdgeInsets.fromLTRB(
                20, 10, 20, 30), // 30 bottom padding for safe area
            child: SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: sets.isEmpty
                    ? null
                    : () async {
                        await ref
                            .read(addExerciseControllerProvider.notifier)
                            .saveCurrentWorkout(widget.exerciseUuid);
                        if (context.mounted) context.pop();
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  disabledBackgroundColor: Colors.white10,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PastPerformanceList extends ConsumerWidget {
  final String exerciseUuid; // Changed from exerciseName to uuid
  final String exerciseName; // Keep the name for display

  const _PastPerformanceList({
    required this.exerciseUuid,
    required this.exerciseName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Now watching the GROUPED provider using the UUID
    final groupedAsync = ref.watch(groupedPerformanceProvider(exerciseUuid));

    return groupedAsync.when(
      data: (sessions) {
        if (sessions.isEmpty) {
          return const Text("No past data for this exercise.",
              style: TextStyle(color: Colors.white38));
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: sessions.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final session = sessions[index];
            return _PerformanceCard(
              session: session, 
              exerciseDisplayName: exerciseName, // Pass name here
            );
          },
        );
      },
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      ),
      error: (err, stack) => Text('Error: $err', 
          style: const TextStyle(color: Colors.red)),
    );
  }
}

class _PerformanceCard extends StatelessWidget {
  final MapEntry<DateTime, List<WorkoutSet>> session;
  final String exerciseDisplayName;

  const _PerformanceCard({
    required this.session,
    required this.exerciseDisplayName,
  });

  @override
  Widget build(BuildContext context) {
    final sets = session.value;
    final date = session.key;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header: Date and Exercise Name in one line
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('MMM dd, yyyy').format(date),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Flexible(
                child: Text(
                  exerciseDisplayName.toUpperCase(),
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // 2. Simplified Set List (The Gray Style)
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: sets.length,
            itemBuilder: (context, index) {
              final set = sets[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    // Gray style for the text
                    Text(
                      "Set ${index + 1}  •  ${set.weight.toStringAsFixed(0)} kg  x  ${set.reps} reps",
                      style: const TextStyle(
                        color: Colors.white60, // The gray style
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}