import 'package:flutter/material.dart';
import 'package:ishatodo_app/pages/data/database.dart';
import 'package:ishatodo_app/pages/shopping-list/utilities/dialoguebox.dart';
import 'package:ishatodo_app/pages/shopping-list/utilities/totaltile.dart';
import 'utilities/todotile.dart';
import 'package:google_fonts/google_fonts.dart';

class MyShoppingList extends StatefulWidget {
  const MyShoppingList({super.key});

  @override
  State<MyShoppingList> createState() => _MyShoppingListState();
}

class _MyShoppingListState extends State<MyShoppingList> {
  ToDoDatabase db = ToDoDatabase();
  final _mycontroller = TextEditingController();
  final price = TextEditingController();
  double total = 0;

  @override
  void initState() {
    //load data
    db.loadData();
    db.updateData();
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.thingsToDo[index]['isCompleted'] = value ?? false;
    });
    db.updateData();
  }

  void deleteTask(int index) {
    setState(() {
      double priceValue = double.tryParse(db.thingsToDo[index]['price']) ?? 0;
      total -= priceValue;
      db.total = total;
      db.thingsToDo.removeAt(index);
    });
    db.updateData();
  }

  void additem() {
    setState(() {
      db.thingsToDo.add({
        'taskName': _mycontroller.text,
        'isCompleted': false,
        'price': price.text,
      });
      db.total = _incrementtotal();
      _mycontroller.clear();
      price.clear();
      Navigator.of(context).pop();
    });
    db.updateData();
  }

  double _incrementtotal() {
    total = 0; // Reset total to calculate it again
    for (var element in db.thingsToDo) {
      double priceValue = double.tryParse(element['price']) ?? 0;
      total += priceValue;
    }
    return total;
  }

  checkIfTodoListIsEmpty() {
    if (db.thingsToDo.isEmpty) {
      return GridTile(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Your Shopping List is currently empty, add something',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      );
    } else {
      return Expanded(
        child: ListView.builder(
          itemCount: db.thingsToDo.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index < db.thingsToDo.length) {
              return TodoTile(
                taskName: db.thingsToDo[index]['taskName'],
                isCompleted: db.thingsToDo[index]['isCompleted'],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteItem: (something) => deleteTask(index),
                price: db.thingsToDo[index]['price'],
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(100),
                child: Totalcost(total: db.total),
              );
            }
          },
        ),
      );
    }
  }

  void createShoppingItem() {
    showDialog(
        context: context,
        builder: (context) => DialogueBox(
              mycontroller: _mycontroller,
              price: price,
              onsave: additem,
              oncancel: () => Navigator.of(context).pop(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Baggisha\'s Shopping List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createShoppingItem,
        child: const Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          checkIfTodoListIsEmpty(),
        ],
      ),
    );
  }
}
