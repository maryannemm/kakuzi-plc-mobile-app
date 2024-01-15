import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:ishatodo_app/pages/cycle-tracker/widgets/select_date.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({super.key});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        DatePicker(
          DateTime.now().subtract(const Duration(days: 4)),
          initialSelectedDate: DateTime.now(),
          daysCount: 7,
          inactiveDates: [
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 1)),
          ],
          monthTextStyle: const TextStyle(
            fontFamily: 'Montserrat',
            color: Color.fromRGBO(209, 196, 233, 1),
            fontSize: 10,
          ),
          dateTextStyle: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(209, 196, 233, 1),
            fontSize: 15,
          ),
          dayTextStyle: const TextStyle(
            fontFamily: 'Montserrat',
            color: Color.fromRGBO(209, 196, 233, 1),
            fontSize: 10,
          ),
          selectionColor: Colors.deepPurple.shade100,
          selectedTextColor: Colors.deepPurple,
          deactivatedColor: Colors.deepPurple.shade200,
          height: MediaQuery.of(context).size.height * .15,
          width: 50,
          onDateChange: (date) {
            setState(() {
              selectedDate = date;
              // Assuming SelectDate is a StatefulWidget with a static method setSelectDate
              SelectDate.of(context).setSelectDate(date);
            });
          },
        ),
      ]),
    );
  }
}
