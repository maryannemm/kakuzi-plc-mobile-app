import 'package:flutter/material.dart';
import 'package:ishatodo_app/pages/Workout/gym/excercisetile.dart';
import 'package:ishatodo_app/pages/Workout/gym/gym_data.dart';
import 'package:ishatodo_app/pages/shopping-list/utilities/button.dart';
import 'package:provider/provider.dart';

class GymPage extends StatefulWidget {
  final String workoutName;

  const GymPage({super.key, required this.workoutName});

  @override
  // ignore: library_private_types_in_public_api
  _GymPageState createState() => _GymPageState();
}

class _GymPageState extends State<GymPage> {
  Map<String, bool> completedExcercises = {};
  //text controllers
  final _setController = TextEditingController();
  final _repController = TextEditingController();
  final _nameController = TextEditingController();
  final _durationController = TextEditingController();
  final _weightController = TextEditingController();

  void save() {
    // Add exercise to workout
    String exerciseName = _nameController.text;
    String reps = _repController.text;
    String sets = _setController.text;
    int duration = int.parse(_durationController.text);
    String weight = _weightController.text;

    // Add the exercise to the GymData provider
    Provider.of<GymData>(context, listen: false).addExercise(
      widget.workoutName,
      reps,
      exerciseName,
      sets,
      duration,
      weight,
    );

    // Clear controllers
    _durationController.clear();
    _nameController.clear();
    _repController.clear();
    _setController.clear();
    _weightController.clear();

    // Close the dialog
    Navigator.pop(context);
  }

  void newExcercise() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Excercise'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration:
                    const InputDecoration(hintText: 'Name of Excercise'),
                controller: _nameController,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'reps'),
                controller: _repController,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'sets'),
                controller: _setController,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'weight'),
                controller: _weightController,
              ),
              TextField(
                decoration:
                    const InputDecoration(hintText: 'duration in minutes'),
                controller: _durationController,
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        actions: [
          MyButton(text: 'Add', onPressed: save),
          const Padding(padding: EdgeInsets.only(right: 70)),
          MyButton(text: 'Cancel', onPressed: () => Navigator.pop(context))
        ],
      ),
    );
  }

  void _checkboxChanged(String excerciseName, bool? value, String workoutName) {
    setState(() {
      completedExcercises[excerciseName] = value ?? false;
    });
    Provider.of<GymData>(context, listen: false)
        .excerciseIsChecked(workoutName, excerciseName);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GymData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(widget.workoutName),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => newExcercise(),
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: value.numberOfExcercisesInAWOrkout(widget.workoutName),
          itemBuilder: (context, index) => ExcerciseTile(
            name: value
                .getRelevantWorkout(widget.workoutName)
                .excercise[index]
                .name,
            reps: value
                .getRelevantWorkout(widget.workoutName)
                .excercise[index]
                .reps,
            weight: value
                .getRelevantWorkout(widget.workoutName)
                .excercise[index]
                .weight,
            sets: value
                .getRelevantWorkout(widget.workoutName)
                .excercise[index]
                .sets,
            duration: int.parse(value
                .getRelevantWorkout(widget.workoutName)
                .excercise[index]
                .duration),
            isCompleted: completedExcercises.containsKey(value
                    .getRelevantWorkout(widget.workoutName)
                    .excercise[index]
                    .name)
                ? completedExcercises[value
                    .getRelevantWorkout(widget.workoutName)
                    .excercise[index]
                    .name]!
                : false,
            onCheckboxChanged: (val) => _checkboxChanged(
                value
                    .getRelevantWorkout(widget.workoutName)
                    .excercise[index]
                    .name,
                val,
                widget.workoutName // Pass the bool value directly
                ),
          ),
        ),
      ),
    );
  }
}
