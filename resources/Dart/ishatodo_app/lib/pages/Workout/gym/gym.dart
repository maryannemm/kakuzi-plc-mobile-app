import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishatodo_app/pages/Workout/gym/excercise.dart';
import 'package:ishatodo_app/pages/Workout/gym/gym_data.dart';
import 'package:ishatodo_app/pages/Workout/gym/gympage.dart';
import 'package:ishatodo_app/pages/shopping-list/utilities/button.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class GymWorkout extends StatefulWidget {
  final String workoutName;
  final void Function(BuildContext)? deleteWorkout;
  List<Excercise> excercise = [];

  GymWorkout({
    super.key,
    required this.workoutName,
    required this.excercise,
    this.deleteWorkout,
  });

  @override
  _GymWorkoutState createState() => _GymWorkoutState();
}

class _GymWorkoutState extends State<GymWorkout> {
  final _gymWorkoutController = TextEditingController();

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
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(
            onPressed: () => _createWorkOut(),
            child: const Icon(Icons.add),
          ),
          body: Stack(
            children: [
              Positioned.fill(
                bottom: 0,
                child: SvgPicture.asset(
                  'lib/pages/images/gym1.svg',
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * .65,
                  width: MediaQuery.of(context).size.width * .65,
                ),
              ),
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: true,
                    pinned: true,
                    floating: true,
                    expandedHeight: 160,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white54,
                          ),
                          child: Center(
                            child: Text(
                              'Your Gym Workouts',
                              style: TextStyle(color: Colors.purple[700]),
                            ),
                          ),
                        ),
                      ),
                      background: Image.asset('lib/pages/images/workout2.png'),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(8.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Container(
                            color: Colors.white24,
                            child: value.getGymWorkoutList().isEmpty
                                ? _buildEmptyListWidget()
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: value.getGymWorkoutList().length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          top: 8.0,
                                          right: 20.0,
                                          left: 8.0,
                                          bottom: 8.0,
                                        ),
                                        child: Slidable(
                                          endActionPane: ActionPane(
                                            motion: const StretchMotion(),
                                            children: [
                                              SlidableAction(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                backgroundColor: Colors.purple,
                                                onPressed: (val) {
                                                  value.deleteWorkout(index);
                                                },
                                                icon: Icons.delete_forever,
                                              ),
                                            ],
                                          ),
                                          child: Container(
                                            padding: const EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                              color: Colors.deepPurple[200],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: ListTile(
                                              leading: SvgPicture.asset(
                                                'lib/pages/images/dumbel.svg',
                                                width: 24,
                                                height: 24,
                                              ),
                                              title: Text(
                                                value
                                                    .getGymWorkoutList()[index]
                                                    .workoutName,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              trailing: IconButton(
                                                icon: const Icon(
                                                    Icons.arrow_forward),
                                                onPressed: () =>
                                                    newGymWorkoutPage(
                                                  value
                                                      .getGymWorkoutList()[
                                                          index]
                                                      .workoutName,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          );
                        },
                        childCount: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyListWidget() {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.width * .55,
        width: MediaQuery.of(context).size.width * .75,
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            'Your Gym List is Empty.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
