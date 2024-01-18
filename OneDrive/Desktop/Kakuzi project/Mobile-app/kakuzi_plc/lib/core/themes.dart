// theme.dart

import 'package:flutter/material.dart';

class CustomeThemes {
  static ThemeData getTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: Colors.green,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.lightGreen,
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: Colors.lightGreen[100],
        endShape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      textTheme: TextTheme(
        displayMedium: TextField.materialMisspelledTextStyle,
      ),
      scaffoldBackgroundColor: Colors.grey[50],
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              // Choose the color based on the button's state
              if (states.contains(MaterialState.pressed)) {
                // Color when the button is pressed
                return Colors.green[700];
              }
              // Default color
              return Colors.green;
            },
          ),
        ),
      ),
    );
  }
}
