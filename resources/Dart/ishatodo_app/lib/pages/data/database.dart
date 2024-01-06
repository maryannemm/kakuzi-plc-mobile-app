import 'package:hive_flutter/adapters.dart';
import 'package:ishatodo_app/pages/Workout/gym/excercise.dart';
import 'package:ishatodo_app/pages/Workout/gym/gym.dart';
import 'package:ishatodo_app/pages/datetime/date_time.dart';

class ToDoDatabase {
  final _mybox = Hive.box('newBox');
  List thingsToDo = [];
  double total = 0;

  //run function when first running this app
  void createIntialData() {}
  //load data from database
  void loadData() {
    thingsToDo = _mybox.get('TODOLIST') ?? [];
    total = (_mybox.get('TOTAL') ?? 0.0);
  }

  //function to update data from db
  void updateData() {
    _mybox.put('TODOLIST', thingsToDo);
    _mybox.put('TOTAL', total);
  }
}

class ChoreDatabase {
  final _mybox = Hive.box('choreBox');
  List myChoreList = []; // Initialize as an empty list

  void loadChore() {
    myChoreList =
        _mybox.get('choreList') ?? []; // Use null-aware operator to handle null
  }

  void updateChore() {
    _mybox.put('choreList', myChoreList);
  }
}

class GymDatabase {
  //reference hive box
  final _gymBox = Hive.box('gymHive');

  //check if previous data exists
  bool previousDataExists() {
    if (_gymBox.isEmpty) {
      _gymBox.put('START_DATE', todaysDateyyyymmdd());
      return false;
    } else {
      // ignore: avoid_print
      print('previous data exists');
      return true;
    }
  }

  //check if data is stored if not record start date
  String getStartDate() {
    return _gymBox.get('START_DATE');
  }

  //write data
  void saveToDatabase(List<GymWorkout> workouts) {
    final workoutList = convertObjectWorkoutlist(workouts);
    final excerciseList = convertObjectToExcerciseList(workouts);
    bool excerciseCompleted(List<GymWorkout> workouts) {
      for (var workout in workouts) {
        for (var excercise in workout.excercise) {
          if (excercise.isCompleted) {
            return true;
          }
        }
      }
      return false;
    }

    if (excerciseCompleted(workouts)) {
      _gymBox.put('COMPLETION_STATUS_${todaysDateyyyymmdd()}', 1);
    } else {
      _gymBox.put('COMPLETION_STATUS_${todaysDateyyyymmdd()}', 0);
    }
// Save to Hive
    _gymBox.put('GYM_WORKOUTS', workoutList);
    _gymBox.put('EXCERCISE', excerciseList);
  }

  //read data from databse
  List<GymWorkout> readFromDB() {
    List<GymWorkout> mySavedgymWOrkouts = [];
    List<String>? workoutNames = _gymBox.get('GYM_WORKOUTS');
    final exerciseDetails = _gymBox.get('EXCERCISE') ?? [];

    if (workoutNames != null) {
      for (int i = 0; i < workoutNames.length; i++) {
        List<Excercise> excercisesInEachWOrkout = [];
        List<dynamic>? currentWorkout = exerciseDetails[i] as List<dynamic>?;

        if (currentWorkout != null) {
          for (int j = 0; j < currentWorkout.length; j++) {
            List<dynamic> exerciseDetail = currentWorkout[j] as List<dynamic>;

            excercisesInEachWOrkout.add(Excercise(
              name: exerciseDetail[0],
              reps: exerciseDetail[1],
              weight: exerciseDetail[2],
              sets: exerciseDetail[3],
              duration: exerciseDetail[4],
              isCompleted: exerciseDetail[5] == 'true' ? true : false,
            ));
          }

          // Create individual workout
          GymWorkout workout = GymWorkout(
            workoutName: workoutNames[i],
            excercise: excercisesInEachWOrkout,
          );

          mySavedgymWOrkouts.add(workout);
        }
      }
    }

    return mySavedgymWOrkouts;
  }

  //return the start date as yyyymmdd

  //check if excercises have been done

  //get completion status for heatmap
  int getCompletionStatus(String yyyymmdd) {
    // Use ?? 0 to provide a default value if the key is not present in the Hive box
    return _gymBox.get('COMPLETION_STATUS_$yyyymmdd') as int? ?? 0;
  }
}

//convert workout objects ino a list
List<String> convertObjectWorkoutlist(List<GymWorkout> workouts) {
  List<String> gymWorkoutList = [];
  for (int i = 0; i < workouts.length; i++) {
    gymWorkoutList.add(workouts[i].workoutName);
  }
  return gymWorkoutList;
}

//converts excercises in a workout to a list of strings
List<List<List<String>>> convertObjectToExcerciseList(
    List<GymWorkout> workouts) {
  List<List<List<String>>> excerciseList = [];
  for (int i = 0; i < workouts.length; i++) {
    List<Excercise> excerciseInAWorkout = workouts[i].excercise;
    List<List<String>> individualWorkout = [];

    for (int a = 0; a < excerciseInAWorkout.length; a++) {
      List<String> individualExcercise = [];
      individualExcercise.addAll([
        excerciseInAWorkout[a].name,
        excerciseInAWorkout[a].reps,
        excerciseInAWorkout[a].sets,
        excerciseInAWorkout[a].weight,
        excerciseInAWorkout[a].duration.toString(),
        excerciseInAWorkout[a].isCompleted.toString(),
      ]);
      individualWorkout.add(individualExcercise);
    }
    excerciseList.add(individualWorkout);
  }
  return excerciseList;
}
