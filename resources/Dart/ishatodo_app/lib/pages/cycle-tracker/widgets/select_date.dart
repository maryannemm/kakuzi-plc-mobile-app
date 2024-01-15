import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectDate extends InheritedWidget {
  SelectDate({
    super.key,
    required this.selectDate,
    required super.child,
  });

  DateTime selectDate;

  void setSelectDate(DateTime newDate) {
    selectDate = newDate;
  }

  static SelectDate of(BuildContext context) {
    final SelectDate? result =
        context.dependOnInheritedWidgetOfExactType<SelectDate>();
    assert(result != null, 'No SelectDate found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(SelectDate oldWidget) =>
      selectDate != oldWidget.selectDate;
}
