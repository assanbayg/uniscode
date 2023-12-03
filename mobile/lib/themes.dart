import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Color.fromARGB(255, 125, 144, 255),
      onPrimary: Colors.white,
      primaryContainer: Colors.indigoAccent,
      secondary: Colors.yellow,
    ),
    textTheme:
        GoogleFonts.montserratTextTheme(ThemeData.light().textTheme.apply(
              bodyColor: Colors.black,
              displayColor: Colors.black,
            )),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Colors.blue,
      onPrimary: Colors.black,
      primaryContainer: Colors.blueAccent,
      secondary: Colors.red,
    ),
    textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        )),
  );
}
