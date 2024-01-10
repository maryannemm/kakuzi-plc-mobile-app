import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class StudyTile extends StatelessWidget {
  final String title;
  final DateTime studyTime;
  final String notes;
  final bool isCompleted;
  final void Function(BuildContext)? deleteItem;
  final Function(bool?)? onChanged;

  const StudyTile({
    super.key,
    required this.title,
    required this.notes,
    required this.studyTime,
    required this.isCompleted,
    required this.onChanged,
    required this.deleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Colors.deepPurple,
            onPressed: (BuildContext context) => deleteItem?.call(context),
            icon: Icons.delete_forever,
          ),
        ]),
        child: Card(
          color: Colors.deepPurple[100],
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            title: Center(
              child: Text(
                'Title: $title',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            subtitle: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    'Reading Time: ${_formatStudyTime()}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Summary: $notes',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            trailing: Checkbox(
              value: isCompleted,
              onChanged:
                  onChanged != null ? (value) => onChanged!(value) : null,
            ),
          ),
        ),
      ),
    );
  }

  String _formatStudyTime() {
    return '${studyTime.hour}:${studyTime.minute} - ${studyTime.day}/${studyTime.month}/${studyTime.year}';
  }
}
