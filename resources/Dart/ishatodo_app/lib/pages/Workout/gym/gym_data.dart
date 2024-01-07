import 'package:flutter/material.dart';
import 'package:ishatodo_app/pages/Workout/gym/excercise.dart';
import 'package:ishatodo_app/pages/data/database.dart';
import 'package:ishatodo_app/pages/datetime/date_time.dart';

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
    //load heatmap
    loadHeatMap();
  }

  //get list of workouts
  List<GymWorkout> getGymWorkoutList() {
    return workoutList;
  }

  //add or create a gym workout
  void addWorkout(String name) {
    workoutList.add(
      // ignore: prefer_const_literals_to_create_immutables
      GymWorkout(workoutName: name, excercise: []),
    );
    notifyListeners();
    gdb.saveToDatabase(workoutList);
  }

// delete workout
  void deleteWorkout(int index) {
    workoutList.removeAt(index);
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
  // check off an exercise
  void excerciseIsChecked(String workoutName, String excerciseName) {
    Excercise relevantExcercise =
        getRelevantExcercise(workoutName, excerciseName);
    relevantExcercise.isCompleted = !relevantExcercise.isCompleted;

    // Save to the database
    gdb.saveToDatabase(workoutList);

    // Load heatmap
    loadHeatMap();

    // Notify listeners
    notifyListeners();
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
  //get the startdate for heatmap

  String getStartDate() {
    return gdb.getStartDate();
  }

  Map<DateTime, int> heatmapDataset = {};

  //load heatmap
  void loadHeatMap() {
    DateTime startDate = createDateTimeObject(getStartDate());
    int daysInBetween = DateTime.now().difference(startDate).inDays;

    for (int i = 0; i < daysInBetween + 1; i++) {
      String yyyymmdd =
          convertDateTimeToYYYYMMDD(startDate.add(Duration(days: i)));
      int completionStatus = gdb.getCompletionStatus(yyyymmdd);

      int year = startDate.add(Duration(days: i)).year;
      int month = startDate.add(Duration(days: i)).month;
      int day = startDate.add(Duration(days: i)).day;
      gdb.saveToDatabaseCompletionStatus(yyyymmdd, completionStatus);
      print('completion: $completionStatus');

      heatmapDataset[DateTime(year, month, day)] = completionStatus;
    }
    print('Updated Heatmap Dataset: $heatmapDataset');
  }
}
