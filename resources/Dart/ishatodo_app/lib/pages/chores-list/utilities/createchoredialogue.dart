import 'package:flutter/material.dart';
import 'package:ishatodo_app/pages/shopping-list/utilities/button.dart';
import 'package:intl/intl.dart';

class ChoreDialogue extends StatefulWidget {
  final TextEditingController choreController;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final void Function(DateTime)?
      onDateTimeSelected; // Change the type to DateTime

  const ChoreDialogue({
    super.key,
    required this.choreController,
    required this.onCancel,
    required this.onSave,
    required this.onDateTimeSelected, // Change the type to DateTime
  });

  @override
  State<ChoreDialogue> createState() => _ChoreDialogueState();
}

class _ChoreDialogueState extends State<ChoreDialogue> {
  DateTime selectedDateTime =
      DateTime.now(); // Use DateTime instead of TimeOfDay

  void _showTimePicker() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDateTime),
    );

    if (picked != null && picked != TimeOfDay.fromDateTime(selectedDateTime)) {
      setState(() {
        selectedDateTime = DateTime(
          selectedDateTime.year,
          selectedDateTime.month,
          selectedDateTime.day,
          picked.hour,
          picked.minute,
        );
      });
      // Pass the selected DateTime to the parent widget
      widget.onDateTimeSelected?.call(selectedDateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(20),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: widget.choreController,
            decoration: const InputDecoration(labelText: 'Chore Name'),
          ),
          ElevatedButton(
            onPressed: _showTimePicker,
            child: const Text('Pick Time'),
          ),
          Text(
            DateFormat('MMMM dd, yyyy - hh:mm a').format(selectedDateTime),
          ), // Display the selected DateTime
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyButton(text: 'Add', onPressed: widget.onSave),
              MyButton(text: 'Cancel', onPressed: widget.onCancel),
            ],
          ),
        ],
      ),
    );
  }
}
