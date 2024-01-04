import 'package:flutter/material.dart';

class OutWorkout extends StatelessWidget {
  const OutWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: Colors.deepPurple[200],
          ),
        ),
      ),
    );
  }
}
