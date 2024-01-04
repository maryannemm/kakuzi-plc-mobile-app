// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //backgroundColor: Colors.purple[100],
      child: Column(
        children: [
          DrawerHeader(child: Text("Pages")),
          //homepage widget
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text('Home Page'),
            ),
          ),
          //shopping list widget
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/shopping-list');
            },
            child: ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Shopping List'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/Chores-list');
            },
            child: ListTile(
              leading: Icon(Icons.cleaning_services),
              title: Text('Chores List'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/workout-home');
            },
            child: ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text('Work Out'),
            ),
          ),
        ],
      ),
    );
  }
}
