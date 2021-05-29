import 'package:butterfly/config/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BrandStyles {
  static final TextStyle headingRegular = GoogleFonts.inter(
    fontSize: 22,
    color: BrandColors.black,
  );
  static final TextStyle headingBold = GoogleFonts.inter(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: BrandColors.black,
  );
  static final TextStyle bodyRegular = GoogleFonts.inter(
    fontSize: 18,
    color: BrandColors.black,
  );
  static final TextStyle bodyBold = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: BrandColors.black,
  );
  static final TextStyle subtitle = GoogleFonts.inter(
    fontSize: 14,
    color: BrandColors.black,
  );
  static final TextStyle subtitleBold = GoogleFonts.inter(
    fontSize: 14,
    color: BrandColors.black,
    fontWeight: FontWeight.bold,
  );

  static final ThemeData themeData = ThemeData(
    primaryColor: BrandColors.blue,
  );
}
