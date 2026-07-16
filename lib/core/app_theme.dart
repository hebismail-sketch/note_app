import 'package:flutter/material.dart';

class AppTheme {
  //==================== Colors ====================//

  // Light Mode
  static const Color lightBackground = Color(0xffF5EBCF);
  static const Color lightAppBar = Color(0xffE2CEA3);
  static const Color lightText = Color(0xff2F2A24);
  static const Color lightSecondaryText = Color(0xff6D665D);

  // Dark Mode
  static const Color darkBackground = Color(0xff121212);
  static const Color darkAppBar = Color(0xff1A1A1A);
  static const Color darkText = Color(0xffF6F1E8);
  static const Color darkSecondaryText = Color(0xffB0A99F);

  // Shared
  static const Color accent = Color(0xffD6B97A);

  //==================== Light Theme ====================//

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    brightness: Brightness.light,

    scaffoldBackgroundColor: lightBackground,

    appBarTheme: const AppBarTheme(
      backgroundColor: lightAppBar,
      foregroundColor: lightText,
      elevation: 0,
      centerTitle: false,
    ),

    colorScheme: ColorScheme.fromSeed(
      seedColor: accent,
      brightness: Brightness.light,
    ),

    iconTheme: const IconThemeData(
      color: lightText,
      size: 24,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: lightText,
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        color: lightSecondaryText,
        fontSize: 16,
      ),
      titleLarge: TextStyle(
        color: lightText,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  //==================== Dark Theme ====================//

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,

    brightness: Brightness.dark,

    scaffoldBackgroundColor: darkBackground,

    appBarTheme: const AppBarTheme(
      backgroundColor: darkAppBar,
      foregroundColor: darkText,
      elevation: 0,
      centerTitle: false,
    ),

    colorScheme: ColorScheme.fromSeed(
      seedColor: accent,
      brightness: Brightness.dark,
    ),

    iconTheme: const IconThemeData(
      color: darkText,
      size: 24,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: darkText,
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        color: darkSecondaryText,
        fontSize: 16,
      ),
      titleLarge: TextStyle(
        color: darkText,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}