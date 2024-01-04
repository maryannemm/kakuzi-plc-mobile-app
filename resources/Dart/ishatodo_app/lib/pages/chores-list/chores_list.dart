import 'package:flutter/material.dart';
import 'package:ishatodo_app/pages/chores-list/utilities/choretile.dart';
import 'package:ishatodo_app/pages/data/database.dart';
import 'package:ishatodo_app/pages/chores-list/utilities/createchoredialogue.dart';

class ChoreList extends StatefulWidget {
  const ChoreList({super.key});

  @override
  State<ChoreList> createState() => _ChoreListState();
}

class _ChoreListState extends State<ChoreList> {
  ChoreDatabase cdb = ChoreDatabase();
  final TextEditingController _chorecontroller = TextEditingController();
  DateTime? selectedDateTime; // Change the variable type

  @override
  void initState() {
    // load data
    cdb.loadChore();
    cdb.updateChore();
    super.initState();
  }

  // add chore list
  void saveChore() {
    final Map<String, dynamic> choreData = {
      'choreName': _chorecontroller.text,
      'choreTime': selectedDateTime, // Use DateTime instead of TimeOfDay
      'isComplete': false,
    };

    setState(() {
      cdb.myChoreList.add(choreData);
      _chorecontroller.clear();
      Navigator.of(context).pop();
    });

    cdb.updateChore();
  }

  //delete chore
  deleteTask(int index) {
    setState(() {
      cdb.myChoreList.removeAt(index);
    });
    cdb.updateChore();
  }

  // checkbox
  checkboxClicked(int index, bool? value) {
    setState(() {
      cdb.myChoreList[index]['isComplete'] = false;
    });
    cdb.updateChore();
  }

  // main function
  checkIfToDoListIsEmpty() {
    if (cdb.myChoreList.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(30),
        child: Text(
          'Your Chore List is Empty.',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: cdb.myChoreList.length,
        itemBuilder: (BuildContext context, int index) {
          return ChoreTile(
            choreName: cdb.myChoreList[index]['choreName'],
            isComplete: cdb.myChoreList[index]['isComplete'],
            onChanged: (value) => checkboxClicked(index, value),
            choreTime: cdb.myChoreList[index]['choreTime'],
            onDelete: (p0) => deleteTask(index),
          );
        },
      );
    }
  }

  void handleDateTimeSelected(DateTime time) {
    setState(() {
      selectedDateTime = time;
    });
  }

  // Pass the selected time to ChoreDialogue
  void createItem() {
    showDialog(
      context: context,
      builder: (context) => ChoreDialogue(
        choreController: _chorecontroller,
        onDateTimeSelected: handleDateTimeSelected, // Pass the callback
        onCancel: () => Navigator.of(context).pop(),
        onSave: saveChore,
      ),
    );
    cdb.updateChore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chores List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createItem,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: checkIfToDoListIsEmpty(),
          ),
        ],
      ),
    );
  }
}
