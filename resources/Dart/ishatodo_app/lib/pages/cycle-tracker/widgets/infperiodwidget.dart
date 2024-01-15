import 'package:flutter/material.dart';
import 'package:ishatodo_app/pages/data/cycledatabase.dart';
import 'package:tuple/tuple.dart';

class InfPeriodWidget extends StatefulWidget {
  const InfPeriodWidget({super.key});

  @override
  State<InfPeriodWidget> createState() => _InfPeriodWidgetState();
}

class _InfPeriodWidgetState extends State<InfPeriodWidget> {
  Tuple2<bool, int> infPeriod = storage.getMenstruation();
  @override
  Widget build(BuildContext context) {
    if (!infPeriod.item1) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 60.0),
        child: const Text(
          'Enter settings',
          style: TextStyle(
            fontSize: 30,
            color: Color.fromRGBO(237, 231, 246, 1),
          ),
        ),
      );
    }
    if (infPeriod.item2 < 0) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            const Text(
              'Period is',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(237, 231, 246, 1),
              ),
            ),
            Text(
              infPeriod.item2.abs().toString(),
              style: const TextStyle(
                fontSize: 40,
                color: Color.fromRGBO(160, 196, 196, 1),
              ),
            ),
            const Text(
              'days late',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(237, 231, 246, 1),
              ),
            )
          ],
        ),
      );
    }
    if (infPeriod.item2 > 0) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 55.0),
        child: Column(
          children: [
            const Text(
              'Period in',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(237, 231, 246, 1),
              ),
            ),
            Text(
              '${infPeriod.item2.toString()} Days',
              style: const TextStyle(
                fontSize: 40,
                color: Colors.deepOrange,
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      alignment: Alignment.center,
      child: const Text(
        'Period today',
        style: TextStyle(
          fontSize: 30,
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}
