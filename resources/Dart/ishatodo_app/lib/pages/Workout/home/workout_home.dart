import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      drawer: const _CustomDrawer(), // Note the underscore here
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

// Rename `_CustomDrawer` to `_CustomDrawerState`
class _CustomDrawer extends StatelessWidget {
  const _CustomDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(child: Text("Pages")),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
            child: const ListTile(
              leading: Icon(Icons.home),
              title: Text('Home Page'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/shopping-list');
            },
            child: const ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Shopping List'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/Chores-list');
            },
            child: const ListTile(
              leading: Icon(Icons.cleaning_services),
              title: Text('Check List'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/workout-home');
            },
            child: const ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text('Work Out'),
            ),
          ),
        ],
      ),
    );
  }
}
