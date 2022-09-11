import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/utils/colors.dart';

class CustomTextStyle {
  static TextStyle blackTitle = GoogleFonts.rubik(
    fontSize: 20,
    color: ColorUtils.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle whiteTitle = GoogleFonts.rubik(
    fontSize: 20,
    color: ColorUtils.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle dp16BoldBlack = GoogleFonts.rubik(
    fontSize: 16,
    color: ColorUtils.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle dp14MedBlack = GoogleFonts.rubik(
    fontSize: 14,
    color: ColorUtils.black,
    fontWeight: FontWeight.w500,
  );
  static TextStyle dp14MedGrey = GoogleFonts.rubik(
    fontSize: 14,
    color: ColorUtils.black.withOpacity(0.6),
    fontWeight: FontWeight.w500,
  );
  static TextStyle dp14RegBlack = GoogleFonts.rubik(
    fontSize: 14,
    color: ColorUtils.black,
    fontWeight: FontWeight.w400,
  );
  static TextStyle dp14MedRed = GoogleFonts.rubik(
    fontSize: 14,
    color: ColorUtils.red,
    fontWeight: FontWeight.w500,
  );
  static TextStyle dp14MedWhite = GoogleFonts.rubik(
    fontSize: 14,
    color: ColorUtils.white,
    fontWeight: FontWeight.w500,
  );
}
