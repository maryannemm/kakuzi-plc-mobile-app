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
    );
  }
}
