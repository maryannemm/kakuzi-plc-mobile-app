// totaltile.dart
import 'package:flutter/material.dart';

class Totalcost extends StatefulWidget {
  final double total; // Change the type to dynamic

  const Totalcost({super.key, required this.total});

  @override
  State<Totalcost> createState() => _TotalcostState();
}

class _TotalcostState extends State<Totalcost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.deepPurple[100],
      ),
      height: 100,
      width: 200,
      child: Center(
        child: Text(
          'Total cost is: ${widget.total}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }
}
