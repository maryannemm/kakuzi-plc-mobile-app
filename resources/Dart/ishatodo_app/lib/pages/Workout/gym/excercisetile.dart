import 'package:flutter/material.dart';

class ExcerciseTile extends StatefulWidget {
  final String name;
  final String weight;
  final String reps;
  final String sets;
  final int duration;
  final bool isCompleted;
  final ValueChanged<bool?>? onCheckboxChanged;

  const ExcerciseTile({
    Key? key,
    required this.name,
    required this.reps,
    required this.weight,
    required this.sets,
    required this.duration,
    required this.isCompleted,
    required this.onCheckboxChanged,
  }) : super(key: key);

  @override
  _ExcerciseTileState createState() => _ExcerciseTileState();
}

class _ExcerciseTileState extends State<ExcerciseTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.deepPurple[200],
        ),
        child: ListTile(
          title: Text(widget.name),
          subtitle: Wrap(
            children: [
              Chip(
                label: Text('${widget.weight} weight'),
              ),
              Text('${widget.isCompleted}'),
              Chip(
                label: Text('${widget.sets} sets'),
              ),
              Chip(
                label: Text('${widget.reps} reps'),
              ),
              Chip(label: Text("${widget.duration} minutes")),
            ],
          ),
          trailing: Checkbox(
            value: widget.isCompleted,
            onChanged: widget.onCheckboxChanged,
          ),
        ),
      ),
    );
  }
}
