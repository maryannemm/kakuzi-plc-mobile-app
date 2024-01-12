import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ishatodo_app/pages/Notification/notifications.dart';
import 'package:ishatodo_app/pages/Workout/gym/gym_data.dart';
import 'package:ishatodo_app/routes.dart';
import 'package:provider/provider.dart';

import 'home.dart';

void main() async {
  // Initialize Hive
  await Hive.initFlutter();

  // Open Hive boxes
  await Hive.openBox('newBox');
  //shopping list box
  await Hive.openBox('totalBox');
  //checklist box
  await Hive.openBox('choreBox');
  //gym box
  await Hive.openBox('gymHive');
  //study box
  await Hive.openBox('studyHive');

  WidgetsFlutterBinding.ensureInitialized();
  //initialize local notifications before running app
  await LocalNotifications.init();

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
