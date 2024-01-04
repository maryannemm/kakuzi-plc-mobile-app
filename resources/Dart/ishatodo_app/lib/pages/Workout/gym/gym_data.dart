import 'package:flutter/material.dart';
import 'package:ishatodo_app/pages/Workout/gym/excercise.dart';
import 'package:ishatodo_app/pages/data/database.dart';

import '../gym/gym.dart';

class GymData extends ChangeNotifier {
  final gdb = GymDatabase();
  List<GymWorkout> workoutList = [
    GymWorkout(
      workoutName: 'treadmill',
      excercise: [
        Excercise(
          name: 'treadmill',
          reps: '10',
          weight: '10',
          sets: '3',
          duration: '25',
        )
      ],
    )
  ];
  // checkIfItsthefirstTimeUsingApp
  void initializeWorkoutList() {
    if (gdb.previousDataExists()) {
      workoutList = gdb.readFromDB();
    } else {
      gdb.saveToDatabase(workoutList);
    }
  }

//get list of workouts
  List<GymWorkout> getGymWorkoutList() {
    return workoutList;
  }

//add or create a gym workout
  void addWorkout(String name) {
    workoutList.add(
      GymWorkout(workoutName: name, excercise: const []),
    );
    notifyListeners();
    gdb.saveToDatabase(workoutList);
  }

  //void add an excersise to gym workout
  void addExercise(String workoutName, String reps, String exerciseName,
      String sets, int duration, String weight) {
    GymWorkout relevantWorkout = getRelevantWorkout(workoutName);
    relevantWorkout.excercise.add(
      Excercise(
        name: exerciseName,
        reps: reps,
        weight: weight,
        sets: sets,
        duration: duration.toString(), // Make sure duration is passed as an int
      ),
    );
    notifyListeners();
    gdb.saveToDatabase(workoutList);
  }

  //get the number of excercises in a workout
  int numberOfExcercisesInAWOrkout(String workoutName) {
    GymWorkout getnumbers = getRelevantWorkout(workoutName);
    return getnumbers.excercise.length;
  }

  //check off an excercise
  void excerciseIsChecked(String workoutName, String excerciseName) {
    Excercise relevantExcercise =
        getRelevantExcercise(workoutName, excerciseName);
    relevantExcercise.isCompleted = !relevantExcercise.isCompleted;
    notifyListeners();
    gdb.saveToDatabase(workoutList);
  }

  //code to get the relevant workout throught its name
  GymWorkout getRelevantWorkout(String workoutName) {
    GymWorkout relevantWorkout =
        workoutList.firstWhere((element) => element.workoutName == workoutName);
    return relevantWorkout;
  }

  //code to find the relevant excercise
  Excercise getRelevantExcercise(String workoutName, String excerciseName) {
    GymWorkout relevantWorkout = getRelevantWorkout(workoutName);
    Excercise relevantExcercise = relevantWorkout.excercise
        .firstWhere((element) => element.name == excerciseName);
    return relevantExcercise;
  }
}
