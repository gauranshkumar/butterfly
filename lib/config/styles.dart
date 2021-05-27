import 'package:butterfly/config/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BrandStyles {
  static final TextStyle headingRegular = GoogleFonts.inter(fontSize: 22);
  static final TextStyle headingBold =
      GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.bold);
  static final TextStyle bodyRegular = GoogleFonts.inter(fontSize: 18);
  static final TextStyle bodyBold =
      GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold);
  static final TextStyle subtitle = GoogleFonts.inter(fontSize: 16);

  static final ThemeData themeData = ThemeData(
    primaryColor: BrandColors.blue,
    textTheme: TextTheme(
      bodyText1: GoogleFonts.inter(),
      subtitle1: GoogleFonts.inter(),
      headline1: GoogleFonts.inter(),
      button: GoogleFonts.inter(),
      headline2: GoogleFonts.inter(),
      bodyText2: GoogleFonts.inter(),
    ),
  );
}
