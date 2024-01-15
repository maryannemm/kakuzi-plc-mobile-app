import 'package:flutter/material.dart';
import 'package:ishatodo_app/pages/cycle-tracker/widgets/infperiodwidget.dart';
import 'package:ishatodo_app/pages/cycle-tracker/widgets/select_date.dart';
import 'package:ishatodo_app/pages/data/cycledatabase.dart';

class ButtonPeriodWidget extends StatefulWidget {
  const ButtonPeriodWidget({super.key});

  @override
  _ButtonPeriodWidgetState createState() => _ButtonPeriodWidgetState();
}

class _ButtonPeriodWidgetState extends State<ButtonPeriodWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animationSize;
  late Animation animationColor;
  late Animation animationBorderColor;
  late CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.ease);
    animationSize = Tween(begin: 220.0, end: 230.0).animate(curvedAnimation);
    animationColor =
        ColorTween(begin: Colors.deepPurple.shade400, end: Colors.deepPurple)
            .animate(curvedAnimation);
    animationBorderColor =
        ColorTween(begin: Colors.deepPurple.shade100, end: Colors.deepPurple)
            .animate(curvedAnimation);
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  void _playAnimation() async {
    await animationController.forward().orCancel;
    await animationController.reverse().orCancel;
  }

  void _addNewCycle(int lenPeriod) {
    if (storage.isInit()) {
      Cycle newCycle =
          Cycle.withParams(1, lenPeriod, SelectDate.of(context).selectDate);
      storage.addNewCycle(newCycle);
    }
  }

  Widget _output() {
    if (!storage.getMenstruation().item1) {
      return const Column(
        children: [
          InfPeriodWidget(),
        ],
      );
    }
    return const InfPeriodWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Container(
              width: animationSize.value,
              height: animationSize.value,
              decoration: BoxDecoration(
                  color: animationColor.value,
                  borderRadius: BorderRadius.circular(120),
                  border: Border.all(
                    width: 10,
                    color: animationBorderColor.value,
                  )),
              child: Center(
                child: _output(),
              ),
            );
          }),
      Positioned(
        bottom: 0,
        right: 0,
        child: ElevatedButton(
            style: ButtonStyle(
              side: MaterialStateProperty.all(
                const BorderSide(
                  color: Color.fromRGBO(209, 196, 233, 1),
                  width: 7,
                ),
              ),
              shape: MaterialStateProperty.all(const CircleBorder()),
              padding: MaterialStateProperty.all(const EdgeInsets.all(30)),
              backgroundColor:
                  MaterialStateProperty.all(Colors.deepPurple.shade400),
              overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.deepPurple;
                }
                return null;
              }),
            ),
            child: Column(children: [
              Icon(Icons.domain_verification, color: Colors.deepPurple.shade50),
              const Text(
                "Mark",
                style: TextStyle(
                    fontSize: 10, color: Color.fromRGBO(237, 231, 246, 1)),
              ),
            ]),
            onPressed: () {
              _playAnimation();
              if (storage.isInit()) {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext contextDialog) => SimpleDialog(
                    title: const Text('Select the length of your period'),
                    children: <Widget>[
                      SimpleDialogOption(
                        onPressed: () {
                          _addNewCycle(storage.listPeriod[0]);
                          Navigator.pop(contextDialog);
                        },
                        child: const Text('1 Days'),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          _addNewCycle(storage.listPeriod[1]);
                          Navigator.pop(contextDialog);
                        },
                        child: const Text('2 Days'),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          _addNewCycle(storage.listPeriod[2]);
                          Navigator.pop(contextDialog);
                        },
                        child: const Text('3 Days'),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          _addNewCycle(storage.listPeriod[3]);
                          Navigator.pop(contextDialog);
                        },
                        child: const Text('4 Days'),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          _addNewCycle(storage.listPeriod[4]);
                          Navigator.pop(contextDialog);
                        },
                        child: const Text('5 Days'),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          _addNewCycle(storage.listPeriod[5]);
                          Navigator.pop(contextDialog);
                        },
                        child: const Text('6 Days'),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          _addNewCycle(storage.listPeriod[6]);
                          Navigator.pop(contextDialog);
                        },
                        child: const Text('7 Days'),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          _addNewCycle(storage.listPeriod[7]);
                          Navigator.pop(contextDialog);
                        },
                        child: const Text('8 Days'),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          _addNewCycle(storage.listPeriod[8]);
                          Navigator.pop(contextDialog);
                        },
                        child: const Text('9 Days'),
                      ),
                    ],
                  ),
                );
              }
            }),
      ),
    ]);
  }
}
