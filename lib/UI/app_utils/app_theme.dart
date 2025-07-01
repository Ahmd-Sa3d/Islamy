import 'package:flutter/material.dart';
import 'package:islamy/UI/app_utils/app_color.dart';
import 'package:islamy/UI/app_utils/app_fonts.dart';

class AppTheme {
  static ThemeData get darkThem {
    return ThemeData.dark().copyWith(
      canvasColor: AppColor.gold,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: AppColor.gold),
        backgroundColor: AppColor.quranBgBlack,
        titleTextStyle: AppFont.amiri20GoldF700,
      ),
    );
  }
}
