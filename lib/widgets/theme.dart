import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: darkbluish,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: darkbluish,
        ),
        cardColor: Colors.white,
        canvasColor: creamColor,
        //   primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.5,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        cardColor: Colors.black,
        canvasColor: darkcreamColor,
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: lightBluishColor,
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.5,
          iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
      );

  // Colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkcreamColor = Vx.gray900;
  static Color darkbluish = const Color.fromARGB(255, 67, 55, 129);
  static Color lightBluishColor = Vx.indigo500;
}
