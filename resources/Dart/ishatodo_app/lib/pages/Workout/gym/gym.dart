import 'package:flutter/material.dart';
import 'package:ishatodo_app/pages/Workout/gym/excercise.dart';
import 'package:ishatodo_app/pages/Workout/gym/gym_data.dart';
import 'package:ishatodo_app/pages/Workout/gym/gympage.dart';
import 'package:ishatodo_app/pages/shopping-list/utilities/button.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class GymWorkout extends StatefulWidget {
  final String workoutName;
  List<Excercise> excercise = [];

  GymWorkout({super.key, required this.workoutName, required this.excercise});

  @override
  // ignore: library_private_types_in_public_api
  _GymWorkoutState createState() => _GymWorkoutState();
}

class _GymWorkoutState extends State<GymWorkout> {
  final _gymWorkoutController = TextEditingController();
  // final _mybox = Hive.box('choreBox');

  @override
  void initState() {
    super.initState();
    Provider.of<GymData>(context, listen: false).initializeWorkoutList();
  }

  void _createWorkOut() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create New Gym Workout'),
        content: TextField(
          controller: _gymWorkoutController,
        ),
        actions: [
          MyButton(
            text: 'add',
            onPressed: save,
          ),
          MyButton(
            text: 'cancel',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void save() {
    Provider.of<GymData>(context, listen: false)
        .addWorkout(_gymWorkoutController.text);
    _gymWorkoutController.clear();
    Navigator.pop(context);
  }

  void newGymWorkoutPage(String workoutName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GymPage(workoutName: workoutName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GymData>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: FloatingActionButton(
            onPressed: () => _createWorkOut(),
            child: const Icon(Icons.add),
          ),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                expandedHeight: 160,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('Your Gym Workouts',
                      style: TextStyle(
                          backgroundColor: Colors.white38,
                          color: Colors.purple[700])),
                  background: Image.asset('lib/pages/images/workout2.png'),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        color: Colors.deepPurple[200],
                        child: value.getGymWorkoutList().isEmpty
                            ? _buildEmptyListWidget()
                            : ListTile(
                                title: Text(value
                                    .getGymWorkoutList()[index]
                                    .workoutName),
                                trailing: IconButton(
                                  icon: const Icon(Icons.arrow_forward),
                                  onPressed: () => newGymWorkoutPage(value
                                      .getGymWorkoutList()[index]
                                      .workoutName),
                                ),
                              ),
                      );
                    },
                    childCount: value.getGymWorkoutList().length,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyListWidget() {
    return const Center(
      child: Text(
        'Your list is empty. Add a workout!',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
