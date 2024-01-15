import 'package:flutter/material.dart';
import 'package:ishatodo_app/pages/cycle-tracker/widgets/button_ovulation.dart';
import 'package:ishatodo_app/pages/cycle-tracker/widgets/buttonovulation.dart';
import 'package:ishatodo_app/pages/cycle-tracker/widgets/datepickerwidget.dart';
import 'package:ishatodo_app/pages/cycle-tracker/widgets/select_date.dart';
import 'package:ishatodo_app/pages/cycle-tracker/widgets/waveclipper.dart';

class TabHomeWidget extends StatefulWidget {
  const TabHomeWidget({super.key});

  @override
  State<TabHomeWidget> createState() => _TabHomeWidgetState();
}

class _TabHomeWidgetState extends State<TabHomeWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SelectDate(
          selectDate: DateTime.now(),
          child: Builder(builder: (BuildContext innerContext) {
            return Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 140,
                        color: Colors.deepPurple.shade50,
                      ),
                      Opacity(
                          opacity: 0.5,
                          child: ClipPath(
                              clipper: WaveClipperTop(),
                              child: Container(
                                color: Colors.deepPurple.shade200,
                                width: MediaQuery.of(context).size.width,
                                height: 160,
                              ))),
                      ClipPath(
                          clipper: WaveClipperTop(),
                          child: Container(
                            color: Colors.deepPurple.shade300,
                            width: MediaQuery.of(context).size.width,
                            height: 140,
                            alignment: Alignment.center,
                          )),
                      const Positioned(
                        bottom: 290,
                        right: 20,
                        child: ButtonPeriodWidget(),
                      ),
                      const Positioned(
                        bottom: 100,
                        right: 120,
                        child: ButtonOvulationWidget(),
                      ),
                      ClipPath(
                          clipper: WaveClipperBottom(),
                          child: Container(
                            color: Colors.deepPurple.shade100,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height - 160,
                          )),
                      ClipPath(
                          clipper: WaveClipperBottom(),
                          child: Container(
                            color: Colors.deepPurple.shade300,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height - 140,
                          )),
                      const DatePickerWidget(),
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
