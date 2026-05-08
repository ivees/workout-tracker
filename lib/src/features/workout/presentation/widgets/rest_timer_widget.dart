import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/rest_timer_controller.dart';
import '../../../../core/constants/app_colors.dart';

class RestTimerWidget extends ConsumerWidget {
  const RestTimerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(restTimerProvider);
    final notifier = ref.read(restTimerProvider.notifier);
    final timeData = notifier.formattedTime;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Rest Timer",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 16),
        
        // Time Display Boxes
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTimeBox(timeData['hours']!, "Hours"),
            _buildTimeBox(timeData['minutes']!, "Minutes"),
            _buildTimeBox(timeData['seconds']!, "Seconds"),
          ],
        ),
        
        const SizedBox(height: 20),
        
        // Action Buttons
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => notifier.toggleTimer(),
                // Toggle Icon and Label based on state
                icon: Icon(timerState.isRunning ? Icons.stop : Icons.play_arrow),
                label: Text(timerState.isRunning ? "Stop" : "Start"),
                style: ElevatedButton.styleFrom(
                  // Toggle Color: Red/Orange for Stop, Neon Green for Start
                  backgroundColor: timerState.isRunning ? Colors.orangeAccent : AppColors.primary,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => notifier.resetTimer(),
                icon: const Icon(Icons.refresh),
                label: const Text("Reset"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.1),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeBox(String value, String label) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.white38)),
        ],
      ),
    );
  }
}