import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ishatodo_app/pages/Notification/notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class StudyTile extends StatefulWidget {
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
  State<StudyTile> createState() => _StudyTileState();
}

class _StudyTileState extends State<StudyTile> {
  bool isNotificationActive = false;

  @override
  void initState() {
    super.initState();
    listenToNotifications();
  }

  // listen to notifications clicked
  listenToNotifications() {
    LocalNotifications.onClickedNotification.stream.listen((event) {
      Navigator.pushNamed(context, '/study');
    });
  }

  void toggleNotification() {
    setState(() {
      isNotificationActive = !isNotificationActive;
    });

    if (isNotificationActive) {
      // Activate the notification
      LocalNotifications.init(); // Ensure initialization
      LocalNotifications.showScheduleNotification(
        title: widget.title,
        body: widget.notes,
        payload: widget.studyTime.toIso8601String(),
        studyTime: tz.TZDateTime.from(widget.studyTime, tz.local),
      );
    } else {
      // Deactivate the notification
      LocalNotifications.cancel(id: 2); // Assuming id is 2, adjust as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Colors.deepPurple,
            onPressed: (BuildContext context) =>
                widget.deleteItem?.call(context),
            icon: Icons.delete_forever,
          ),
        ]),
        child: Card(
          color: Colors.deepPurple[100],
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            title: Center(
              child: Text(
                'Title: ${widget.title}',
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
                    'Summary: ${widget.notes}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  ElevatedButton.icon(
                    onPressed: toggleNotification,
                    label: Text(
                      isNotificationActive
                          ? 'Deactivate Notification'
                          : 'Activate Notification',
                    ),
                    icon: Icon(
                      isNotificationActive
                          ? Icons.notifications_active
                          : Icons.notifications_none,
                    ),
                  ),
                ],
              ),
            ),
            trailing: Checkbox(
              value: widget.isCompleted,
              onChanged: widget.onChanged != null
                  ? (value) => widget.onChanged!(value)
                  : null,
            ),
          ),
        ),
      ),
    );
  }

  String _formatStudyTime() {
    return '${widget.studyTime.hour}:${widget.studyTime.minute} - ${widget.studyTime.day}/${widget.studyTime.month}/${widget.studyTime.year}';
  }
}
