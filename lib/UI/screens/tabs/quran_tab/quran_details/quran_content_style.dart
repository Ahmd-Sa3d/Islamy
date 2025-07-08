import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamy/UI/app_utils/app_color.dart';
import 'package:islamy/UI/app_utils/app_fonts.dart';

class QuranContentStyle extends StatelessWidget {
  final String suraContent;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const QuranContentStyle({
    super.key,
    required this.suraContent,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.0.w),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? AppColor.gold : AppColor.transParent,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColor.gold),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '[$index]'
                '$suraContent',
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style:
                    isSelected
                        ? AppFont.amiri16blackF700
                        : AppFont.amiri20GoldF700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
