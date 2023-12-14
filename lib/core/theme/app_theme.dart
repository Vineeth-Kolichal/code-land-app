import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    colorScheme: ColorScheme.fromSeed(seedColor: themeYello),
    useMaterial3: true,
  );

  //Colors
  static const Color themeYello = Color(0xFFFBEB5A);
  static const Color blackColor = Colors.black;
  static const Color textFieldBg = Color(0xFFE7E6DD);
  static const Color whiteColor = Colors.white;
  static const Color lightGreyColor = Color.fromARGB(255, 202, 201, 201);
  static const Color labelOrange = Color(0xFFDC7135);
  static const Color labelBlue = Color(0xFF3E7DE2);
  static const Color labelGreen = Color(0xFF42A928);
  static const Color yelloBordeColor = Color(0xFFFFCC00);
  static const Color lightGreyColor2 = Color(0xFFF3F2F2);
  static const Color redColor = Color(0xFFE61919);
  static const Color buttonBlue = Color(0xFF3E7DE2);
  static const Color bottomNavColor = Color(0xFF242632);
}
