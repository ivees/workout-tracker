import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/src/common_widgets/custom_navigation_bar.dart';
import 'package:workout_tracker/src/features/calendar/presentation/screens/calendar_screen.dart';
import 'package:workout_tracker/src/features/workout/presentation/screens/today_workout_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  // 1. Add a PageController
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose(); // Always dispose controllers to prevent memory leaks
    super.dispose();
  }

  final List<Widget> _screens = [
    const TodayWorkoutScreen(),
    const CalendarScreen(),
    const Center(child: Text("Progress")),
    const Center(child: Text("Settings")),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    // 2. Animate to the page when a nav item is clicked
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 3. Use PageView instead of IndexedStack
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics:
            const NeverScrollableScrollPhysics(), // Disables swiping to change tabs
        children: _screens,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {context.pushNamed('exercise-category');},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
      ),
    );
  }
}