import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishatodo_app/pages/data/studydatabase.dart';
import 'package:ishatodo_app/pages/study/studydialogue.dart';
import 'package:ishatodo_app/pages/study/studytile.dart';

class StudyHome extends StatefulWidget {
  StudyHome({
    super.key,
  });

  @override
  State<StudyHome> createState() => _StudyHomeState();
}

class _StudyHomeState extends State<StudyHome> {
  StudyDatabase sdb = StudyDatabase();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  DateTime? selectedDateTime;
  @override
  void initState() {
    sdb.loadStudy();
    sdb.updateStudy();
    super.initState();
  }

  //delete item
  void deleteItem(int index) {
    setState(() {
      sdb.studyList.removeAt(index);
    });
    sdb.updateStudy();
  }

  // checkbox
  void checkboxClicked(int index, bool? value) {
    setState(() {
      sdb.studyList[index]['iscomplete'] = value ?? false;
    });
    sdb.updateStudy();
  }

  // Save study
  void saveStudy() {
    final studyData = {
      'title': _titleController.text,
      'notes': _notesController.text,
      'time': selectedDateTime ?? DateTime.now(),
      'iscomplete': false,
    };
    setState(() {
      sdb.studyList.add(studyData);
      _notesController.clear();
      _titleController.clear();
      Navigator.pop(context);
    });
    sdb.updateStudy();
  }

  ///cancel
  void cancelStudy() {
    Navigator.pop(context);
  }

  void handleDateTimeSelected(DateTime time) {
    setState(() {
      selectedDateTime = time;
    });
  }

  Widget displayStudyDetails() {
    if (sdb.studyList.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(50),
        child: Container(
          padding: const EdgeInsets.all(8),
          height: MediaQuery.of(context).size.width * .25,
          width: MediaQuery.of(context).size.width * .75,
          decoration: BoxDecoration(
              color: Colors.white54, borderRadius: BorderRadius.circular(10)),
          child: const Center(
            child: Text(
              'Your Study List is Empty.',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
        ),
      );
    } else {
      return Positioned.fill(
        child: ListView.builder(
          itemCount: sdb.studyList.length,
          itemBuilder: (BuildContext context, int index) {
            return StudyTile(
              title: sdb.studyList[index]['title'],
              notes: sdb.studyList[index]['notes'],
              studyTime: sdb.studyList[index]['time'],
              deleteItem: (p0) => deleteItem(index),
              isCompleted: sdb.studyList[index]['iscomplete'] ?? false,
              onChanged: (value) => checkboxClicked(index, value),
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return StudyDialogue(
                notesController: _notesController,
                onCancel: cancelStudy,
                titleController: _titleController,
                onDateTimeSelected: handleDateTimeSelected,
                onSave: saveStudy,
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Stack(
        children: [
          SvgPicture.asset(
            'lib/pages/images/study.svg',
            width: MediaQuery.of(context).size.width * .75,
            height: MediaQuery.of(context).size.height * .75,
          ),
          displayStudyDetails(),
        ],
      ),
    );
  }
}
