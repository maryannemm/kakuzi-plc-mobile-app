import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Excercise extends StatefulWidget {
  final String name;
  final String weight;
  final String reps;
  final String sets;
  final String duration;
  bool isCompleted;
  Excercise({
    super.key,
    required this.name,
    required this.reps,
    required this.weight,
    required this.sets,
    required this.duration,
    this.isCompleted = false,
  });

  @override
  State<Excercise> createState() => _ExcerciseState();
}

class _ExcerciseState extends State<Excercise> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
