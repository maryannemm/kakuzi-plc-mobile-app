import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishatodo_app/pages/Notification/notifications.dart';
import 'package:ishatodo_app/pages/data/cycledatabase.dart';
import 'package:timezone/data/latest.dart' as tzdata;
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
  void initState() {
    super.initState();
    _initializeTimezone();
  }

  Future<void> _initializeTimezone() async {
    tzdata.initializeTimeZones();
    tz.setLocalLocation(
        tz.getLocation('UTC')); // or use a valid timezone identifier
  }

  @override
  Widget build(BuildContext context) {
    // Call _initializeTimezone() here to ensure it is called before using getLocation
    _initializeTimezone();

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
          studyTime:
              tz.TZDateTime.now(tz.UTC), // Use UTC for the scheduled date
        );
      } else {
        // Deactivate the notification
        LocalNotifications.cancel(id: 2); // Assuming id is 2, adjust as needed
      }
    }

    return Form(
      key: _formKey,
      child: Stack(children: [
        SvgPicture.asset(
          'lib/pages/images/cyclebg.svg',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Column(
          children: <Widget>[
            const SizedBox(
              height: 150,
            ),
            Center(
              child: ElevatedButton.icon(
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
            ),
          ],
        ),
      ]),
    );
  }
}
