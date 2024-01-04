// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ishatodo_app/customdrawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Set the title and other properties if needed
        title: Text('Home'),
      ),
      drawer: CustomDrawer(),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GridTile(
                  child: Image.asset('lib/pages/images/girl-exercise.gif')),
              GridTile(
                  child: Image.asset('lib/pages/images/girl-shopping.gif')),
              GridTile(child: Image.asset('lib/pages/images/girl-study.gif')),
              Text('')
            ],
          );
        },
      ),
    );
  }
}
