import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:workout_tracker/src/features/workout/domain/workout_set.dart';
import 'package:workout_tracker/src/features/workout/presentation/controllers/exercise_controller.dart';
import '../../../../core/constants/app_colors.dart';
import '../controllers/calendar_controller.dart';

class CalendarScreen extends ConsumerWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(calendarControllerProvider);
    final workoutsAsync = ref.watch(workoutsForDayProvider(selectedDay));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        centerTitle: true,
        title: const Text("Calendar", 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTableCalendar(ref, selectedDay),
          
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              DateFormat('MMMM d, yyyy').format(selectedDay),
              style: const TextStyle(
                color: Colors.white, 
                fontSize: 22, 
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          // Inside CalendarScreen build method, replace the Expanded child:
          Expanded(
            child: workoutsAsync.when(
              data: (sets) {
                if (sets.isEmpty) {
                  return const Center(
                    child: Text("No workouts tracked",
                        style: TextStyle(color: Colors.white38)),
                  );
                }

                // Group sets by exerciseId or exercise name
                final groupedWorkouts = <String, List<WorkoutSet>>{};
                for (var set in sets) {
                  // You can use set.exerciseId, but since we need the display name,
                  // we'll assume your UI logic or repository provides it.
                  // For now, we'll group by the exerciseId/Name.
                  groupedWorkouts
                      .putIfAbsent(set.exerciseId, () => [])
                      .add(set);
                }

                final entries = groupedWorkouts.entries.toList();

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: entries.length,
                  itemBuilder: (context, index) {
                    return _WorkoutSummaryCard(
                      exerciseId: entries[index].key,
                      sets: entries[index].value,
                    );
                  },
                );
              },
              loading: () => const Center(
                  child: CircularProgressIndicator(color: AppColors.primary)),
              error: (e, _) => Text('Error: $e'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableCalendar(WidgetRef ref, DateTime selectedDay) {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: selectedDay,
      selectedDayPredicate: (day) => isSameDay(selectedDay, day),
      onDaySelected: (selected, focused) {
        ref.read(calendarControllerProvider.notifier).onDaySelected(selected);
      },
      // Styling to match calendar_screen.png
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
        rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
      ),
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekdayStyle: TextStyle(color: Colors.white38, fontWeight: FontWeight.bold),
        weekendStyle: TextStyle(color: Colors.white38, fontWeight: FontWeight.bold),
      ),
      calendarStyle: const CalendarStyle(
        defaultTextStyle: TextStyle(color: Colors.white),
        weekendTextStyle: TextStyle(color: Colors.white),
        outsideDaysVisible: false,
        // The Neon Green Circle
        selectedDecoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        selectedTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        todayDecoration: BoxDecoration(
          color: Colors.white10,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _WorkoutSummaryCard extends ConsumerWidget { // Changed to ConsumerWidget
  final String exerciseId;
  final List<WorkoutSet> sets;

  const _WorkoutSummaryCard({
    super.key,
    required this.exerciseId,
    required this.sets,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the name map
    final nameMapAsync = ref.watch(exerciseNameMapProvider);

    // Resolve the name (fallback to 'Loading...' or 'Unknown')
    final exerciseName = nameMapAsync.maybeWhen(
      data: (map) => map[exerciseId] ?? "Unknown Exercise",
      orElse: () => "...",
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Dynamic Exercise Name
          Text(
            exerciseName.toUpperCase(), // Now dynamic!
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 15,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.0,
            ),
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
                child: Text(
                  "Set ${index + 1}  •  ${set.weight.toStringAsFixed(0)} kg  x  ${set.reps} reps",
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}