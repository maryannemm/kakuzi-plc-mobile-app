import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishatodo_app/pages/Workout/gym/gym_data.dart';
import 'package:ishatodo_app/pages/heatmap/heat_map.dart';
import 'package:provider/provider.dart';

class HomeWorkout extends StatelessWidget {
  const HomeWorkout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<GymData>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        'lib/pages/images/roof.svg',
                        width: MediaQuery.of(context).size.width * .85,
                        height: MediaQuery.of(context).size.height * .2,
                      ),
                    ),
                    SvgPicture.asset(
                      'lib/pages/images/bottom_left_decoration.svg',
                      width: MediaQuery.of(context).size.width * .85,
                      height: MediaQuery.of(context).size.height * .2,
                    ),
                    SvgPicture.asset(
                      'lib/pages/images/decoration.svg',
                      width: MediaQuery.of(context).size.width * .85,
                      height: MediaQuery.of(context).size.height * .2,
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: SvgPicture.asset(
                        alignment: Alignment.bottomRight,
                        'lib/pages/images/bottom_right.svg',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .25,
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white54,
                      ),
                      child: const Center(
                        child: Text(
                          'Your Gym Workouts',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[200],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyHeatMap(
                          dataSet: value.heatmapDataset,
                          startDateYYYYMMDD: value.getStartDate(),
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Track your progress and stay motivated!',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/workout-home/gym');
                          },
                          child: const Text('Start a New Workout'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
