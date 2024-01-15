import 'package:flutter/material.dart';
import 'package:ishatodo_app/pages/data/cycledatabase.dart';
import 'package:tuple/tuple.dart';

class InfOvulationWidget extends StatefulWidget {
  const InfOvulationWidget({super.key});

  @override
  State<InfOvulationWidget> createState() => _InfOvulationWidgetState();
}

class _InfOvulationWidgetState extends State<InfOvulationWidget> {
  Tuple2<bool, int> infOvulation = storage.getOvulation();
  @override
  Widget build(BuildContext context) {
    if (!infOvulation.item1) {
      return const Text(
        'Enter settings',
        style: TextStyle(
          fontSize: 30,
          color: Color.fromRGBO(237, 231, 246, 1),
        ),
      );
    }
    if (infOvulation.item2 > 0) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 55.0),
        child: Column(
          children: [
            const Text(
              'Ovulation in',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(237, 231, 246, 1),
              ),
            ),
            Text(
              '${infOvulation.item2.toString()} Days',
              style: const TextStyle(
                fontSize: 40,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      );
    }
    if (infOvulation.item2 == 0) {
      return const Text(
        'Ovulation today',
        style: TextStyle(
          fontSize: 28,
          color: Colors.cyanAccent,
        ),
      );
    }
    return const Text(
      'Temp written',
      style: TextStyle(
        fontSize: 30,
        color: Color.fromRGBO(237, 231, 246, 1),
      ),
    );
  }
}
