import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ChoreTile extends StatefulWidget {
  final String? choreName;
  final bool? isComplete;
  final DateTime? choreTime; // Change the type to TimeOfDay
  final Function(bool?)? onChanged;
  final Function(bool?)? onDelete;

  const ChoreTile({
    super.key,
    required this.choreName,
    required this.isComplete,
    required this.onChanged,
    required this.choreTime,
    required this.onDelete,
  });

  @override
  State<ChoreTile> createState() => _ChoreTileState();
}

class _ChoreTileState extends State<ChoreTile> {
  bool? _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isComplete;
  }

  @override
  Widget build(BuildContext context) {
    // Check if choreTime is not null before formatting
    String formattedTime = widget.choreTime != null
        ? '${widget.choreTime!.hour}:${widget.choreTime!.minute}'
        : 'No time specified';

    // Define a TextStyle for the chore name
    TextStyle choreNameStyle = TextStyle(
      fontSize: 15,
      decoration: _isChecked != null && _isChecked!
          ? TextDecoration.lineThrough
          : TextDecoration.none,
    );

    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Colors.deepPurple,
            onPressed: (BuildContext context) => widget.onDelete?.call(true),
            icon: Icons.delete_forever,
          ),
        ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepPurple[100],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: _isChecked ?? false,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value;
                        });
                        widget.onChanged?.call(value);
                      },
                    ),
                    Text(
                      '${widget.choreName}',
                      style: choreNameStyle,
                    ),
                    Text(formattedTime),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
