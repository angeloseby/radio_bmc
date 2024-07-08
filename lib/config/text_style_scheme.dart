import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:radio_bmc/config/color_scheme.dart';

class TTextStyle {
  static TextStyle titleStyle = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static TextStyle copyrightStyle = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: TColorScheme.subColor,
  );

  static TextStyle headlineStyle = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: Colors.yellow,
  );

  static TextStyle bodyStyle = GoogleFonts.poppins(
    fontSize: 14,
    color: Colors.white,
  );
}
