import 'package:hive/hive.dart';

class StudyDatabase {
  final _mybox = Hive.box('studyHive');
  List studyList = []; // Initialize as an empty list

  void loadStudy() {
    studyList =
        _mybox.get('STUDYLIST') ?? []; // Use null-aware operator to handle null
  }

  void updateStudy() {
    _mybox.put('STUDYLIST', studyList);
  }
}
