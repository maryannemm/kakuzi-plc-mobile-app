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
  final _gymBox = Hive.box('gymHive');

  bool previousDataExists() {
    if (_gymBox.isEmpty) {
      _gymBox.put('START_DATE', todaysDateyyyymmdd());
      return false;
    } else {
      return true;
    }
  }

  String getStartDate() {
    return _gymBox.get('START_DATE');
  }

  void saveToDatabase(List<GymWorkout> workouts) {
    final workoutList = convertObjectWorkoutlist(workouts);
    final exerciseList = convertObjectToExcerciseList(workouts);

    String workoutDate = todaysDateyyyymmdd();

    if (exerciseCompleted(workouts)) {
      _gymBox.put('COMPLETION_STATUS_$workoutDate', 1);
    } else {
      _gymBox.put('COMPLETION_STATUS_$workoutDate', 0);
    }

    _gymBox.put('GYM_WORKOUTS', workoutList);
    _gymBox.put('EXERCISE', exerciseList);
  }

  bool exerciseCompleted(List<GymWorkout> workouts) {
    for (var workout in workouts) {
      for (var exercise in workout.excercise) {
        if (exercise.isCompleted) {
          return true;
        }
      }
    }
    return false;
  }

  void saveToDatabaseCompletionStatus(String yyyymmdd, int completionStatus) {
    _gymBox.put('COMPLETION_STATUS_$yyyymmdd', completionStatus);
  }

  List<GymWorkout> readFromDB() {
    List<GymWorkout> mySavedGymWorkouts = [];
    List<String>? workoutNames = _gymBox.get('GYM_WORKOUTS');
    final exerciseDetails = _gymBox.get('EXERCISE') ?? [];

    if (workoutNames != null) {
      for (int i = 0; i < workoutNames.length; i++) {
        if (i < exerciseDetails.length) {
          // Check if index is within bounds
          List<Excercise> exercisesInEachWorkout = [];
          List<dynamic>? currentWorkout = exerciseDetails[i] as List<dynamic>?;

          if (currentWorkout != null) {
            for (int j = 0; j < currentWorkout.length; j++) {
              List<dynamic> exerciseDetail = currentWorkout[j] as List<dynamic>;

              exercisesInEachWorkout.add(Excercise(
                name: exerciseDetail[0],
                reps: exerciseDetail[1],
                weight: exerciseDetail[2],
                sets: exerciseDetail[3],
                duration: exerciseDetail[4],
                isCompleted: exerciseDetail[5] == 'true' ? true : false,
              ));
            }

            GymWorkout workout = GymWorkout(
              workoutName: workoutNames[i],
              excercise: exercisesInEachWorkout,
            );

            mySavedGymWorkouts.add(workout);
          }
        }
      }
    }

    return mySavedGymWorkouts;
  }

  int getCompletionStatus(String yyyymmdd) {
    var completionStatus = _gymBox.get('COMPLETION_STATUS_$yyyymmdd');

    // Check if completionStatus is not null before returning
    return completionStatus ?? 0;
  }
}

List<String> convertObjectWorkoutlist(List<GymWorkout> workouts) {
  return workouts.map((workout) => workout.workoutName).toList();
}

List<List<List<String>>> convertObjectToExcerciseList(
    List<GymWorkout> workouts) {
  return workouts.map((workout) {
    return workout.excercise.map((exercise) {
      return [
        exercise.name,
        exercise.reps,
        exercise.weight,
        exercise.sets,
        exercise.duration,
        exercise.isCompleted.toString(),
      ];
    }).toList();
  }).toList();
}
