import 'package:flutter/material.dart';
import 'package:ishatodo_app/pages/cycle-tracker/widgets/infovulating.dart';

class ButtonOvulationWidget extends StatefulWidget {
  const ButtonOvulationWidget({super.key});

  @override
  State<ButtonOvulationWidget> createState() => _ButtonOvulationWidgetState();
}

class _ButtonOvulationWidgetState extends State<ButtonOvulationWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: AnimatedContainer(
          decoration: BoxDecoration(
            color: selected ? Colors.deepPurple : Colors.deepPurple.shade400,
            border: Border.all(
                width: selected ? 0 : 10, color: Colors.deepPurple.shade100),
            borderRadius: BorderRadius.circular(120),
          ),
          width: 220.0,
          height: 220.0,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutBack,
          child: const InfOvulationWidget(),
        ),
      ),
    );
  }
}
