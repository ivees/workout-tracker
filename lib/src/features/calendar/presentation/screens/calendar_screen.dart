import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
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

          Expanded(
            child: workoutsAsync.when(
              data: (sets) => sets.isEmpty 
                ? const Center(child: Text("No workouts tracked", style: TextStyle(color: Colors.white38)))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: sets.length, // You might want to group these by exercise!
                    itemBuilder: (context, index) => _WorkoutSummaryCard(workoutSet: sets[index]),
                  ),
              loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
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

class _WorkoutSummaryCard extends StatelessWidget {
  final dynamic workoutSet; // Should be your WorkoutSet or a GroupedWorkout model
  const _WorkoutSummaryCard({required this.workoutSet});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.fitness_center, color: AppColors.primary),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Full Body Workout", // Placeholder
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 4),
              Text("10:00 AM - 11:00 AM", // Placeholder
                style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 13)),
            ],
          )
        ],
      ),
    );
  }
}