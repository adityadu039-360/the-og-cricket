import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryGold = Color(0xFFFFC107);
  static const Color backgroundBlack = Color(0xFF090909);
  static const Color surfaceBlack = Color(0xFF151515);

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    scaffoldBackgroundColor: backgroundBlack,

    colorScheme: const ColorScheme.dark(
      primary: primaryGold,
      secondary: primaryGold,
      surface: surfaceBlack,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundBlack,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),

    cardTheme: CardThemeData(
      color: surfaceBlack,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryGold,
        foregroundColor: Colors.black,
        elevation: 0,
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceBlack,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: primaryGold,
          width: 1.5,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 16,
      ),
    ),

    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontWeight: FontWeight.w900,
        letterSpacing: -1,
      ),
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w800,
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w800,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w800,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: Colors.white70,
      ),
    ),

    dividerTheme: const DividerThemeData(
      color: Color(0xFF252525),
      thickness: 1,
    ),

    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: surfaceBlack,
      indicatorColor: Color(0x33FFC107),
      elevation: 0,
    ),
  );
}