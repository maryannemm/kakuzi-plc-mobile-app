import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:ishatodo_app/pages/datetime/date_time.dart';
//import 'package:flutter_map_heatmap/flutter_map_heatmap.dart';

class MyHeatMap extends StatelessWidget {
  final Map<DateTime, int>? dataSet;
  final String startDateYYYYMMDD;
  const MyHeatMap(
      {super.key, required this.dataSet, required this.startDateYYYYMMDD});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: HeatMap(
        colorsets: const {
          1: Colors.deepPurple,
          2: Colors.deepPurpleAccent,
          3: Colors.purple,
        },
        datasets: dataSet,
        startDate: createDateTimeObject(startDateYYYYMMDD),
        endDate: DateTime.now().add(const Duration(days: 0)),
        colorMode: ColorMode.color,
        defaultColor: Colors.grey[100],
        textColor: Colors.black,
        showColorTip: false,
        scrollable: true,
        showText: true,
        size: 35,
      ),
    );
  }
}
