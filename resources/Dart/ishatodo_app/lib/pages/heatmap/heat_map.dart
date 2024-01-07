import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:ishatodo_app/pages/datetime/date_time.dart';

class MyHeatMap extends StatelessWidget {
  final Map<DateTime, int>? dataSet;
  final String startDateYYYYMMDD;

  const MyHeatMap({
    super.key,
    required this.dataSet,
    required this.startDateYYYYMMDD,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Colors.deepPurple[300],
          borderRadius: BorderRadius.circular(20)),
      child: HeatMap(
        datasets: dataSet,
        // ... other entries ...

        //datasets: dataSet,
        startDate: createDateTimeObject(startDateYYYYMMDD),
        endDate: DateTime.now().add(const Duration(days: 60)),
        showText: true,
        colorMode: ColorMode.color,
        textColor: Colors.black,
        scrollable: true,
        colorsets: const {
          1: Color.fromARGB(255, 193, 93, 210),
          2: Colors.purple,
        },
      ),
    );
  }
}
