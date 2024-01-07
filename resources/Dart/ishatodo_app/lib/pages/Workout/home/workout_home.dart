import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishatodo_app/customdrawer.dart';
import 'package:ishatodo_app/pages/Workout/gym/gym.dart';
import 'package:ishatodo_app/pages/Workout/home/gymheatmap.dart';

class WorkoutHome extends StatefulWidget {
  const WorkoutHome({super.key});

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
      drawer: const CustomDrawer(),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          const HomeWorkout(),
          GymWorkout(
            // ignore: prefer_const_literals_to_create_immutables
            excercise: [], // Add your exercise data here
            workoutName: "Gym Workout",
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavBarTap,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'lib/pages/images/activity.svg',
              width: 24,
              height: 24,
            ),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'lib/pages/images/gym.svg',
              width: 27,
              height: 27,
            ),
            label: 'Gym',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/home');
              },
              child: SvgPicture.asset(
                'lib/pages/images/homeicon.svg',
                width: 24,
                height: 24,
              ),
            ),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}
