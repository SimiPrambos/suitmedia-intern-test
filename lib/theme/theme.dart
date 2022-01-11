import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin AppTheme {
  static const primaryColor = Color.fromRGBO(43, 99, 123, 1);

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    fontFamily: 'Inter',

    // AppBar
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),

    // button
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      fillColor: Colors.white,
      filled: true,
    ),
  );
}
