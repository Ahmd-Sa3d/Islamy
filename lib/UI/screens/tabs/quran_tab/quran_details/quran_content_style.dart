import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamy/UI/app_utils/app_fonts.dart';

class QuranContentStyle extends StatelessWidget {
  final String suraContent;

  const QuranContentStyle({
    super.key,
    required this.suraContent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.0.w),
      child: Center(
        child: Padding(
          padding:  EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Text(
              suraContent,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: AppFont.amiri20GoldF700.copyWith(height: 3.h),
            ),
          ),
        ),
      ),
    );
  }
}
