import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({Key? key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int current = 1;
  void _itemTapped(int index) {
    setState(() {
      current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/home'),
            child: const Icon(
              Icons.home,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/workout-home'),
            child: const Icon(
              Icons.fitness_center,
            ),
          ),
          label: 'Workout',
        ),
      ],
      currentIndex: current,
      onTap: _itemTapped,

      selectedItemColor: Colors.purple, // Set the color for the selected item
    );
  }
}
