import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamy/UI/app_utils/app_fonts.dart';
import 'package:islamy/UI/app_utils/app_images.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double sebhaAngle = 0;
  int azkarSebhaIndex = 0;
  int counterAzkar = 0;
  List<String> azkarSebha = [
    'سبحان الله',
    'الحمدلله',
    'الله أكبر',
    'لا إلهَ إلاّ اللّهُ وَحْـدَهُ لا شريكَ لهُ، لهُ الملكُ ولهُ الحَمْد، وهُوَ على كُلّ شَيءٍ قَـدير',
  ];

  void _onSebhaClick() {
    setState(() {
      counterAzkar++;

      if (azkarSebhaIndex == 2 && counterAzkar == 34) {
        counterAzkar = 100;
        azkarSebhaIndex = 3;
      } else if (azkarSebhaIndex == 3 && counterAzkar > 100) {
        azkarSebhaIndex = 0;
        counterAzkar = 0;
      } else if (counterAzkar == 34) {
        azkarSebhaIndex++;
        counterAzkar = 1;
      }
    });
  }

  void _resetOnLongPress() {
    counterAzkar = 0;
    azkarSebhaIndex = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.h),
            Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
              style: AppFont.amiri16WhiteF700.copyWith(fontSize: 36.sp),
            ),
            Column(
              children: [
                SizedBox(height: 50.h),
                SizedBox(
                  width: 0.4.sw,
                  child: Image.asset(AppImages.sebhaHead, fit: BoxFit.contain),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        sebhaAngle += 12 / 180;
                        setState(() {});
                        _onSebhaClick();
                      },
                      onLongPress: () {
                        _resetOnLongPress();
                      },
                      child: AnimatedRotation(
                        turns: sebhaAngle,
                        duration: Duration(milliseconds: 250),
                        child: SizedBox(
                          width: 0.9.sw,

                          child: Image.asset(
                            AppImages.sebhaBody,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: 100.w,
                            left: 100.w,
                            top: 20.h,
                          ),
                          child: Text(
                            azkarSebha[azkarSebhaIndex],
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                            style: AppFont.amiri16WhiteF700.copyWith(
                              fontSize: 36.sp,
                            ),
                          ),
                        ),
                        Text(
                          counterAzkar.toString(),
                          style: AppFont.amiri16WhiteF700.copyWith(
                            fontSize: 36.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
