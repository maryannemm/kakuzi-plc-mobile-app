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
      child: HeatMap(
        datasets: dataSet,
        startDate: createDateTimeObject(startDateYYYYMMDD),
        endDate: DateTime.now().add(Duration(days: 0)),
        showText: true,
        colorMode: ColorMode.color,
        scrollable: true,
        colorsets: const {
          7: Colors.pink,
          9: Colors.blue,
          11: Colors.indigo,
          13: Colors.deepPurple,
        },
      ),
    );
  }
}
