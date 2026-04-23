import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/add_exercise_controller.dart';
import '../../../../core/constants/app_colors.dart';

class SetInputRow extends ConsumerWidget {
  final int index;
  final String setId;

  const SetInputRow({super.key, required this.index, required this.setId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(addExerciseControllerProvider.notifier);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Text('$index', style: const TextStyle(color: Colors.white60, fontWeight: FontWeight.bold)),
          const SizedBox(width: 16),
          Expanded(child: _buildField("Reps", (val) => notifier.updateSet(setId, reps: int.tryParse(val)))),
          const SizedBox(width: 12),
          Expanded(child: _buildField("Weight (kg)", (val) => notifier.updateSet(setId, weight: double.tryParse(val)))),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.white38),
            onPressed: () => notifier.removeSet(setId),
          ),
        ],
      ),
    );
  }

  Widget _buildField(String hint, Function(String) onChanged) {
    return TextField(
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white24, fontSize: 14),
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
      ),
    );
  }
}