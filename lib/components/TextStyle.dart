import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle getTextStyle(double fontSize, FontWeight weight, Color color) {
    return TextStyle(
      fontFamily: GoogleFonts.sofiaSans().fontFamily,
      fontSize: fontSize,
      fontWeight: weight,
      color: color,
    );
  }
}
