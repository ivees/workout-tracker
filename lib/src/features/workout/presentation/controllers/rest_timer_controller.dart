import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_timer_controller.freezed.dart';
part 'rest_timer_controller.g.dart';

@freezed
class RestTimerState with _$RestTimerState {
  const factory RestTimerState({
    @Default(0) int seconds,
    @Default(false) bool isRunning,
  }) = _RestTimerState;
}

@riverpod
class RestTimer extends _$RestTimer {
  Timer? _timer;

  @override
  RestTimerState build() {
    // Ensure timer is cancelled if the provider is disposed
    ref.onDispose(() => _timer?.cancel());
    return const RestTimerState();
  }

  void toggleTimer() {
    if (state.isRunning) {
      stopTimer();
    } else {
      state = state.copyWith(isRunning: true);
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        // Removed the "if > 0" check. 
        // Now it just increments every second regardless of current value.
        state = state.copyWith(seconds: state.seconds + 1);
      });
    }
  }

  void stopTimer() {
    _timer?.cancel();
    state = state.copyWith(isRunning: false);
  }

  void resetTimer() {
    _timer?.cancel();
    state = const RestTimerState();
  }

  Map<String, String> get formattedTime {
    int s = state.seconds;
    return {
      'hours': (s ~/ 3600).toString().padLeft(2, '0'),
      'minutes': ((s % 3600) ~/ 60).toString().padLeft(2, '0'),
      'seconds': (s % 60).toString().padLeft(2, '0'),
    };
  }
}