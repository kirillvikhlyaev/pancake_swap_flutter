import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      hoverColor: Colors.white.withOpacity(0.1),
      primarySwatch: Colors.grey,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          titleTextStyle: TextStyle(fontSize: 18, color: Colors.white),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          )),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          textStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 16, color: Colors.white)),
          backgroundColor: MaterialStateProperty.all(const Color(0xFF44454E)),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 18),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
          fillColor: Color(0xFF44454E),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(width: 3, color: Colors.orange[400]!),
          )),
      textTheme: const TextTheme(
        displayMedium: TextStyle(fontSize: 16, color: Colors.white),
        displayLarge: TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      scaffoldBackgroundColor: const Color(0xFF242630),
    );
  }
}
