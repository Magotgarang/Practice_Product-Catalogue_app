import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue,
    ),
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
    ),
  );
}
