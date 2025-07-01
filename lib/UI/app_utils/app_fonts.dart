import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamy/UI/app_utils/app_color.dart';

// Use Material.dart instead of dart:ui

class AppFont {
  static TextStyle amiri20GoldF700 = GoogleFonts.amiri(
    textStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColor.gold,
    ),
  );

  static TextStyle amiri16WhiteF700 = GoogleFonts.amiri(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColor.white,
    ),
  );


  static TextStyle amiri16blackF700 = GoogleFonts.amiri(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColor.black,
    ),
  );
}
