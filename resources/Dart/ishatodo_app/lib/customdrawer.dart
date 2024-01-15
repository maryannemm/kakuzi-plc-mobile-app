// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
              leading: SvgPicture.asset(
                'lib/pages/images/homeicon.svg',
                width: 24,
                height: 24,
              ),
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
              leading: SvgPicture.asset(
                'lib/pages/images/shopicon1.svg',
                width: 27,
                height: 27,
              ),
              title: Text('Shopping List'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/Chores-list');
            },
            child: ListTile(
              leading: SvgPicture.asset(
                'lib/pages/images/checlisticon.svg',
                width: 24,
                height: 24,
              ),
              title: Text('Check List'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/workout-home');
            },
            child: ListTile(
              leading: SvgPicture.asset(
                'lib/pages/images/gym.svg',
                width: 27,
                height: 27,
              ),
              title: Text('Work Out'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/study');
            },
            child: ListTile(
              leading: SvgPicture.asset(
                'lib/pages/images/reading.svg',
                width: 13,
                height: 13,
              ),
              title: Text('Read'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/cycle_main');
            },
            child: ListTile(
              leading: SvgPicture.asset(
                'lib/pages/images/cycle.svg',
                width: 24,
                height: 24,
              ),
              title: Text('Cycle Tracker'), // Updated title
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/how');
            },
            child: ListTile(
              leading: SvgPicture.asset(
                'lib/pages/images/question.svg',
                width: 26,
                height: 26,
              ),
              title: Text('How To'), // Updated title
            ),
          ),
        ],
      ),
    );
  }
}
