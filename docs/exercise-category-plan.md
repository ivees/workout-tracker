# Plan: Exercise Category Screen

## Context
The home screen's FAB currently pushes `'add-exercise'` directly. Instead, it should push a new **Exercise Category** screen where the user picks a muscle group before adding an exercise. The mockup shows a dark-themed list of category tiles (CHEST, BACK, LEGS, SHOULDERS, BICEPS, ABS) with a green section header underline and a FAB for adding custom categories.

All data infrastructure already exists: `CategoryStore` seeds and serves `List<ExerciseCategory>` from Isar, exposed as `categoryStoreProvider` (`AutoDisposeAsyncNotifierProvider`).

---

## Files to Change

| File | Action |
|---|---|
| `lib/src/features/workout/presentation/widgets/category_list_tile.dart` | **Create** |
| `lib/src/features/workout/presentation/screens/exercise_category_screen.dart` | **Create** |
| `lib/src/core/routing/app_router.dart` | **Modify** — add route |
| `lib/src/features/home/presentation/screens/main_screen.dart` | **Modify** — update FAB target |

---

## Step 1 — Create `category_list_tile.dart`

**Path:** `lib/src/features/workout/presentation/widgets/category_list_tile.dart`

A `StatelessWidget`. Pattern mirrors `exercise_list_item.dart`: a `Container` with `BoxDecoration`.

```dart
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/exercise_category.dart';

class CategoryListTile extends StatelessWidget {
  const CategoryListTile({
    super.key,
    required this.category,
    required this.onTap,
  });

  final ExerciseCategory category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.surface,           // Color(0xFF131D12)
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          category.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
```

**Why separate widget:** keeps the screen's `itemBuilder` clean and makes the tile reusable for future screens (e.g. an exercise list screen).

---

## Step 2 — Create `exercise_category_screen.dart`

**Path:** `lib/src/features/workout/presentation/screens/exercise_category_screen.dart`

A `ConsumerWidget` watching `categoryStoreProvider`. Uses `.when()` to handle the async state (loading spinner, error text, data list). Pattern matches `add_exercise_screen.dart`.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../controllers/category_controller.dart';
import '../widgets/category_list_tile.dart';

class ExerciseCategoryScreen extends ConsumerWidget {
  const ExerciseCategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoryStoreProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: BackButton(color: AppColors.textPrimary),
        title: const Text(
          'EXERCISE CATEGORY',
          style: TextStyle(
            color: AppColors.primary,          // neon green #1ED700
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section label
              const Text(
                'SELECT CATEGORY',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              // Green underline accent (matches mockup)
              Container(
                width: 48,
                height: 3,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              // Category list — fills remaining space
              Expanded(
                child: categoriesAsync.when(
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (e, _) => Center(
                    child: Text('Error: $e', style: const TextStyle(color: Colors.white60)),
                  ),
                  data: (categories) => ListView.separated(
                    itemCount: categories.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) => CategoryListTile(
                      category: categories[index],
                      onTap: () {
                        // TODO: navigate to exercise list for this category
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: show dialog / bottom sheet to add custom category
          // Calls: ref.read(categoryStoreProvider.notifier).addCustomCategory(...)
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

**Key decisions:**
- `Expanded` + `ListView.separated` so the list fills the screen and scrolls as categories grow.
- FAB wired to `addCustomCategory` path but dialog left as TODO — not in scope for this task.
- `BackButton` uses `AppColors.textPrimary` (white) for contrast against the dark AppBar.

---

## Step 3 — Update `app_router.dart`

**Path:** `lib/src/core/routing/app_router.dart`

Add one import and one `GoRoute`. The `.g.dart` file is fully regenerated by `build_runner` — do not edit it manually.

```dart
// Add import at top
import '../../features/workout/presentation/screens/exercise_category_screen.dart';

// Add inside the routes list
GoRoute(
  path: '/exercise-category',
  name: 'exercise-category',
  builder: (context, state) => const ExerciseCategoryScreen(),
),
```

After editing, run:
```
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## Step 4 — Update FAB in `main_screen.dart`

**Path:** `lib/src/features/home/presentation/screens/main_screen.dart`  
**Line 65** (current): `onPressed: () {context.pushNamed('add-exercise');}`

Change to:
```dart
onPressed: () { context.pushNamed('exercise-category'); }
```

The `'add-exercise'` route stays in the router — it will be used later when the user selects a category and proceeds to the exercise entry screen.

---

## Verification

1. Run `flutter pub run build_runner build --delete-conflicting-outputs` — completes with no errors.
2. Run `flutter analyze` — no new lint issues.
3. Launch app (`flutter run`), tap the FAB on the home screen → **Exercise Category** screen opens.
4. Confirm: dark AppBar with green "EXERCISE CATEGORY" title, back arrow, "SELECT CATEGORY" label with green underline, 6 category tiles (CHEST → ABS), neon FAB in bottom-right.
5. Press back → returns to home screen cleanly.
6. Tap any category tile → no crash (onTap is a no-op for now).
7. Press the screen's FAB → no crash (onPressed is a no-op for now).
