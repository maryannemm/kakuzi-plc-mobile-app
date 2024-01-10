import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ishatodo_app/pages/Workout/gym/gym_data.dart'; // Assuming you have a GymData class
import 'package:ishatodo_app/routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'home.dart';

void main() async {
  // Initialize Hive
  await Hive.initFlutter();

  // Open Hive boxes
  await Hive.openBox('newBox');
  await Hive.openBox('totalBox');
  await Hive.openBox('choreBox');
  await Hive.openBox('gymHive');
  await Hive.openBox('studyHive');

  //notifications
  NotificationService().initNotification();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GymData gymData;

  @override
  void initState() {
    super.initState();
    gymData = GymData();
    gymData.initializeWorkoutList();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GymData>(
      create: (context) => gymData,
      child: MaterialApp(
        routes: appRoutes,
        title: 'Baggishas home',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          iconTheme: const IconThemeData(
            color: Colors.indigo,
          ),
          primarySwatch: Colors.deepPurple,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.deepPurple[300],
          ),
          scaffoldBackgroundColor: Colors.purple[50],
          buttonTheme: ButtonThemeData(buttonColor: Colors.purple[200]),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.purple[200],
          ),
          drawerTheme: DrawerThemeData(backgroundColor: Colors.purple[50]),
        ),
        home: const Home(),
      ),
    );
  }
}
