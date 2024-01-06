import 'package:flutter/material.dart';
import 'package:ishatodo_app/customdrawer.dart';
import 'package:ishatodo_app/pages/Workout/gym/gym.dart';
import 'package:ishatodo_app/pages/Workout/home/home.dart';
import 'package:ishatodo_app/pages/Workout/out.dart';

class WorkoutHome extends StatefulWidget {
  const WorkoutHome({Key? key}) : super(key: key);

  @override
  _WorkoutHomeState createState() => _WorkoutHomeState();
}

class _WorkoutHomeState extends State<WorkoutHome> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onBottomNavBarTap(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome To your workout Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
      drawer: const CustomDrawer(),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          GymWorkout(
            excercise: [], // Add your exercise data here
            workoutName: "Gym Workout",
          ),
          HomeWorkout(),
          OutWorkout(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavBarTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Gym',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run),
            label: 'Out',
          ),
        ],
      ),
    );
  }
}
