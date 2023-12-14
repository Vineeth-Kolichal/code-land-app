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
}
