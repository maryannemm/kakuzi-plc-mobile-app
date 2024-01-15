// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:ishatodo_app/pages/data/cycledatabase.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({super.key});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                const Padding(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 20),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child:
                        Text('Cycle length', textDirection: TextDirection.ltr),
                  ),
                ),
                CycleDropdownWidget(dropdownCycle: storage.getFirstCycleLen()),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 20),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child:
                        Text('Period length', textDirection: TextDirection.ltr),
                  ),
                ),
                PeriodDropdownWidget(
                    dropdownPeriod: storage.getFirstPeriodLen()),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 0.0, left: 20.0, right: 20.0),
                  child:
                      DateTimeWidget(selectedDate: storage.getFirstDateStart()),
                ))
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 0, left: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (storage.isInit()) {
                        storage.getLenArr();
                        storage.outputCycles();
                        Navigator.popAndPushNamed(context, '/');
                      }
                    },
                    child: const Text('Confirm'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CycleDropdownWidget extends StatefulWidget {
  int dropdownCycle = storage.listCycle[0];

  CycleDropdownWidget({super.key, required this.dropdownCycle});

  @override
  State<CycleDropdownWidget> createState() =>
      // ignore: no_logic_in_create_state
      _CycleDropdownWidgetState(dropdownCycle);
}

class _CycleDropdownWidgetState extends State<CycleDropdownWidget> {
  int dropdownCycle = storage.listCycle[0];

  _CycleDropdownWidgetState(this.dropdownCycle);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: dropdownCycle,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (int? newValue) {
        setState(() {
          dropdownCycle = newValue!;
          storage.setStartCycleLen(dropdownCycle);
        });
      },
      items: storage.listCycle.map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text('$value'),
        );
      }).toList(),
    );
  }
}

class PeriodDropdownWidget extends StatefulWidget {
  int dropdownPeriod = storage.listPeriod[0];

  PeriodDropdownWidget({super.key, required this.dropdownPeriod});

  @override
  State<PeriodDropdownWidget> createState() =>
      // ignore: no_logic_in_create_state
      _PeriodDropdownWidgetState(dropdownPeriod);
}

class _PeriodDropdownWidgetState extends State<PeriodDropdownWidget> {
  int dropdownPeriod = storage.listPeriod[0];

  _PeriodDropdownWidgetState(this.dropdownPeriod);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: dropdownPeriod,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (int? newValue) {
        setState(() {
          dropdownPeriod = newValue!;
          storage.setStartPeriodLen(dropdownPeriod);
        });
      },
      items: storage.listPeriod.map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text('$value'),
        );
      }).toList(),
    );
  }
}

class DateTimeWidget extends StatefulWidget {
  DateTime selectedDate = DateTime(2020, 3, 8);

  DateTimeWidget({super.key, required this.selectedDate});

  @override
  State<DateTimeWidget> createState() =>
      // ignore: no_logic_in_create_state
      _DateTimeWidgetState(selectedDate);
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
  DateTime selectedDate = DateTime(2020, 3, 8);

  _DateTimeWidgetState(this.selectedDate);

  @override
  Widget build(BuildContext context) {
    return DateTimeFormField(
      initialValue: selectedDate,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.event_note),
        labelText: 'Start of last period',
      ),
      mode: DateTimeFieldPickerMode.date,
      autovalidateMode: AutovalidateMode.always,
      onDateSelected: (DateTime newDate) {
        setState(() {
          selectedDate = newDate;
          storage.setStartDateLastStart(selectedDate);
        });
      },
    );
  }
}
