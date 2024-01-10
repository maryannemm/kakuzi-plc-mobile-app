import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ishatodo_app/pages/shopping-list/utilities/button.dart';

class StudyDialogue extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController notesController;
  //final TextEditingController timeController;

  final VoidCallback onSave;
  final VoidCallback onCancel;
  final void Function(DateTime)? onDateTimeSelected;
  const StudyDialogue(
      {super.key,
      required this.titleController,
      required this.notesController,
      //required this.timeController,
      required this.onSave,
      required this.onCancel,
      required this.onDateTimeSelected});

  @override
  State<StudyDialogue> createState() => _StudyDialogueState();
}

class _StudyDialogueState extends State<StudyDialogue> {
  DateTime selectedDateTime =
      DateTime.now(); // Use DateTime instead of TimeOfDay

  void _showDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)), // One year from now
    );

    if (pickedDate != null && pickedDate != selectedDateTime) {
      // Show time picker after selecting the date
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDateTime),
      );

      if (pickedTime != null) {
        setState(() {
          selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
        // Pass the selected DateTime to the parent widget
        widget.onDateTimeSelected?.call(selectedDateTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: widget.titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: widget.notesController,
              decoration: const InputDecoration(labelText: 'Summary'),
              maxLength: 100,
            ),
            ElevatedButton(
              onPressed: _showDatePicker,
              child: const Text('Pick Time'),
            ),
            Text(
              DateFormat('MMMM dd, yyyy - hh:mm a').format(selectedDateTime),
            )
          ],
        ),
      ),
      actions: [
        MyButton(text: 'Add', onPressed: widget.onSave),
        MyButton(text: 'Cancel', onPressed: widget.onCancel)
      ],
    );
  }
}
