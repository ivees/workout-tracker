# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Install dependencies
flutter pub get

# Run the app
flutter run

# Regenerate code after modifying annotated models/providers
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode for continuous code generation during development
flutter pub run build_runner watch --delete-conflicting-outputs

# Lint
flutter analyze

# Run tests
flutter test

# Run a single test file
flutter test test/path/to/test_file.dart
```

## Architecture

Feature-driven Clean Architecture under `lib/src/`:

```
core/
  constants/    # AppColors
  database/     # Isar initialization (isar_provider.dart)
  routing/      # GoRouter (app_router.dart)
  theme/        # AppTheme
features/
  home/presentation/screens/   # MainScreen — tab navigation with PageView
  workout/
    domain/       # WorkoutSet model (Freezed + Isar collection)
    data/         # WorkoutRepository
    presentation/
      controllers/  # Riverpod notifiers
      screens/      # Full-screen UI
      widgets/      # Reusable widgets (e.g. RestTimerWidget)
common_widgets/     # Shared UI (CustomNavigationBar)
```

## State Management

**Riverpod** with code generation (`@riverpod` annotation). Controllers are `AsyncNotifier` or `Notifier` subclasses. State objects use **Freezed** for immutability.

Pattern: annotate with `@riverpod`, run `build_runner`, import the generated `.g.dart` file. Access state via `ref.watch(someProvider)` and mutations via `ref.read(someProvider.notifier).method()`.

## Database

**Isar** (embedded NoSQL). Initialized before `runApp()` in `main.dart` and exposed as a `keepAlive: true` provider via `isarProvider`. The repository layer (`WorkoutRepository`) wraps all Isar queries and is the only code that should interact with the database directly.

## Code Generation

Three generators run together via `build_runner`:

| Annotation | Generator | Output |
|---|---|---|
| `@freezed` | `freezed` | `*.freezed.dart` |
| `@riverpod` | `riverpod_generator` | `*.g.dart` |
| `@collection` | `isar_generator` | `*.g.dart` |
| `@JsonSerializable` | `json_serializable` | `*.g.dart` |

Generated files are **committed** to the repo. Always run `build_runner build` after changing any annotated class or provider signature.

## Routing

GoRouter, configured in `lib/src/core/routing/app_router.dart` as a Riverpod provider. Named routes:
- `home` → `/` — `MainScreen`
- `add-exercise` → `/add-exercise` — `AddExerciseScreen`

Navigate with `context.pushNamed('route-name')`.

## Theme

Dark fitness theme (`AppTheme.darkWorkoutTheme`). Primary accent is neon green (`#1ED700`). Background is dark green-black (`#0A1208`). All color constants are in `lib/src/core/constants/app_colors.dart`.
