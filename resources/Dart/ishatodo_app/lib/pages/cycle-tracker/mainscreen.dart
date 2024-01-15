import 'package:flutter/material.dart';
import 'package:ishatodo_app/pages/cycle-tracker/cycle_history.dart';
import 'package:ishatodo_app/pages/cycle-tracker/cycle_home.dart';
import 'package:ishatodo_app/pages/cycle-tracker/settings.dart';
import 'package:ishatodo_app/pages/cycle-tracker/notes.dart';
import 'package:ishatodo_app/pages/data/cycledatabase.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text(
                    'Home',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'History',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Notes',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ],
            ),
            // title: const Text('My apps'),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  if (0 == storage.getNumberRecords()) {
                    Navigator.popAndPushNamed(context, '/settings');
                  }
                },
              )
            ],
          ),
          body: const TabBarView(
            children: [
              TabHomeWidget(),
              TabHistoryWidget(),
              TabNotesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const InputWidget(),
    );
  }
}
