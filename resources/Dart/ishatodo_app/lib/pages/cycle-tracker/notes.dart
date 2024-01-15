import 'package:flutter/material.dart';
import 'package:ishatodo_app/pages/Notification/notifications.dart';
import 'package:ishatodo_app/pages/data/cycledatabase.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:tuple/tuple.dart';

class TabNotesWidget extends StatefulWidget {
  const TabNotesWidget({super.key});

  @override
  State<TabNotesWidget> createState() => _TabNotesWidgetState();
}

class _TabNotesWidgetState extends State<TabNotesWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isNotificationActive = false;
  Tuple2<bool, int> infOvulation = storage.getOvulation();
  var infOv = storage.getOvulation().item2;

  @override
  Widget build(BuildContext context) {
    void toggleNotification() {
      setState(() {
        isNotificationActive = !isNotificationActive;
      });

      Tuple2<bool, int> ovulationInfo = storage.getOvulation();

      if (isNotificationActive &&
          ovulationInfo.item1 &&
          ovulationInfo.item2 <= 1) {
        // Activate the notification
        LocalNotifications.init(); // Ensure initialization
        LocalNotifications.showScheduleNotification(
          title: 'Cycle Notification',
          body: 'Note',
          payload: '',
          studyTime: tz.TZDateTime.from(DateTime.now(), tz.local),
        );
      } else {
        // Deactivate the notification
        LocalNotifications.cancel(id: 2); // Assuming id is 2, adjust as needed
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text('Notes')),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton.icon(
            onPressed: toggleNotification,
            label: Text(
              isNotificationActive ? 'Dont Notify me' : 'Notify Me',
            ),
            icon: Icon(
              isNotificationActive
                  ? Icons.notifications_active
                  : Icons.notifications_none,
            ),
          ),
        ],
      ),
    );
  }
}
