import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ishatodo_app/pages/data/cycledatabase.dart';

class TabHistoryWidget extends StatefulWidget {
  const TabHistoryWidget({super.key});

  @override
  State<TabHistoryWidget> createState() => _TabHistoryWidgetState();
}

class _TabHistoryWidgetState extends State<TabHistoryWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List listCycles = storage.getListCycles();
  int countCycles = storage.getNumberRecords();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 15),
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'AVERAGE',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      color: Color.fromRGBO(179, 157, 219, 1),
                    ),
                  ),
                ]),
            SizedBox(
              height: 120,
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade100,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(9),
                        topLeft: Radius.circular(9),
                      ),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const Expanded(
                          flex: 1,
                          child: Text(
                            'CYCLE LENGTH',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              color: Color.fromRGBO(149, 117, 205, 1),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '${storage.getMidCycleLen()} DAYS',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(103, 58, 183, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade100,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const Expanded(
                          flex: 1,
                          child: Text(
                            'PERIOD LENGTH ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(149, 117, 205, 1),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '${storage.getMidPeriodLen()} DAYS',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(103, 58, 183, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'HISTORY',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      color: Color.fromRGBO(179, 157, 219, 1),
                    ),
                  ),
                ]),
            SizedBox(
              height: 400,
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: countCycles,
                itemBuilder: (BuildContext context, int index) {
                  var record = listCycles[countCycles - 1 - index];
                  DateTime startDate = record['dateStart'];
                  DateTime endDate =
                      startDate.add(Duration(days: record['cycleLen']));

                  return Container(
                    height: 50,
                    color: Colors.deepPurple.shade100,
                    child: Center(
                        child: Text(
                            '${DateFormat.MMMd().format(startDate)} - ${DateFormat.MMMd().format(endDate)}')),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
