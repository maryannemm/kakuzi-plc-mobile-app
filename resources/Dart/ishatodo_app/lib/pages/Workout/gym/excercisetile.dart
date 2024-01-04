import 'package:flutter/material.dart';

class ExcerciseTile extends StatelessWidget {
  final String name;
  final String weight;
  final String reps;
  final String sets;
  final int duration;
  final bool isCompleted;
  final ValueChanged<bool?>? onCheckboxChanged;

  const ExcerciseTile({
    super.key,
    required this.name,
    required this.reps,
    required this.weight,
    required this.sets,
    required this.duration,
    required this.isCompleted,
    required this.onCheckboxChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        color: Colors.deepPurple[200],
        child: ListTile(
          title: Text(name),
          subtitle: Wrap(
            children: [
              Chip(
                label: Text('$weight weight'),
              ),
              Chip(
                label: Text('$sets sets'),
              ),
              Chip(
                label: Text('$reps reps'),
              ),
              Chip(label: Text("$duration minutes")),
            ],
          ),
          trailing: Checkbox(
            value: isCompleted,
            onChanged: onCheckboxChanged,
          ),
        ),
      ),
    );
  }
}
