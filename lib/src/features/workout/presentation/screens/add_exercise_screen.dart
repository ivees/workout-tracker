import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workout_tracker/src/features/workout/presentation/controllers/add_exercise_controller.dart';
import 'package:workout_tracker/src/features/workout/presentation/widgets/add_set_button.dart';
import 'package:workout_tracker/src/features/workout/presentation/widgets/set_input_row.dart';
import '../widgets/exercise_dropdown.dart';

class AddExerciseScreen extends StatelessWidget {
  const AddExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Add New Exercise", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. The Dropdown
            ExerciseDropdown(
              onChanged: (val) {
                print("Selected: $val");
              },
            ),
            
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
          ],
        ),
      ),
    );
  }
}