// ignore_for_file: prefer_const_constructors

import 'package:ishatodo_app/home.dart';
import 'package:ishatodo_app/pages/Workout/gym/gym.dart';
import 'package:flutter/material.dart';
import 'package:ishatodo_app/pages/Workout/gym/gympage.dart';
import 'package:ishatodo_app/pages/Workout/home/workout_home.dart';
import 'package:ishatodo_app/pages/chores-list/chores_list.dart';
import 'package:ishatodo_app/pages/cycle-tracker/cycle_home.dart';
import 'package:ishatodo_app/pages/cycle-tracker/mainscreen.dart';
import 'package:ishatodo_app/pages/study/study.dart';

import 'pages/shopping-list/shopping_list.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/home': (context) => Home(),
  '/shopping-list': (context) => MyShoppingList(),
  '/Chores-list': (context) => ChoreList(),
  '/workout-home': (context) => WorkoutHome(),
  '/workout-home/gym': (context) =>
      GymWorkout(workoutName: '', excercise: const []),
  '/gym-page': (context) => GymPage(
        workoutName: '',
      ),
  '/study': (context) => StudyHome(),
  '/cycle_home': (context) => TabHomeWidget(),
  '/cycle_main': (context) => MainScreen(),
  '/settings': (BuildContext context) => const SettingsScreen()
};
