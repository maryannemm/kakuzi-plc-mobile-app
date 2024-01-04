// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ishatodo_app/customdrawer.dart';
import 'package:ishatodo_app/pages/Workout/gym/gym.dart';
import 'package:ishatodo_app/pages/Workout/home/home.dart';
import 'package:ishatodo_app/pages/Workout/out.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WorkoutHome extends StatefulWidget {
  const WorkoutHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WorkoutHomeState createState() => _WorkoutHomeState();
}

class _WorkoutHomeState extends State<WorkoutHome> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome To your workout Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.75,
              child: PageView(
                controller: _controller,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/workout-home/gym');
                    },
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      color: Colors.deepPurple[400],
                      child: GymWorkout(excercise: const [], workoutName: ""),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    color: Colors.green,
                    child: HomeWorkout(),
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    color: Colors.blue,
                    child: OutWorkout(),
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const JumpingDotEffect(
                dotColor: Color.fromARGB(255, 205, 184, 242),
                activeDotColor: Color.fromARGB(255, 116, 67, 214),
                spacing: 30,
                verticalOffset: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
