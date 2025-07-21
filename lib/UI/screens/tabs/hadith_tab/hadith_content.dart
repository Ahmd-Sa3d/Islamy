import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamy/UI/app_utils/app_color.dart';
import 'package:islamy/UI/app_utils/app_fonts.dart';
import 'package:islamy/UI/screens/tabs/hadith_tab/hadith_model.dart';

import '../../../app_utils/app_images.dart';

class HadithContent extends StatefulWidget {
  final int index;

  const HadithContent({super.key, required this.index});

  @override
  State<HadithContent> createState() => _HadithContentState();
}

class _HadithContentState extends State<HadithContent> {
  Hadith? hadith;

  @override
  initState() {
    super.initState();
    _loadHadithString(widget.index);
  }

  Future<void> _loadHadithString(int index) async {
    String hadithString = await rootBundle.loadString(
      'assets/Files/Hadeeth/h$index.txt',
    );
    int hadithStringIndex = hadithString.indexOf('\n');
    String hadithTitle = hadithString.substring(0, hadithStringIndex);
    String hadithContent = hadithString.substring(hadithStringIndex + 1);
    hadith = Hadith(title: hadithTitle, content: hadithContent);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    return Hadith != null
        ? Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.hadithCardBG),
                alignment: Alignment.bottomCenter,
              ),
              color: AppColor.gold,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 11.0.w,vertical: 12.h),
                  child: Stack(
                    children: [
                      Expanded(
                        child: Image.asset(
                          AppImages.hadithCardRightLeftCorner,
                          width: 500.w,fit: BoxFit.fill,
                        ),
                      ),

                      Positioned.fill(
                        child: Center(
                          child: Text(
                            hadith?.title ?? '',
                            style: AppFont.amiri16blackF700.copyWith(
                                fontSize: 24.sp
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 13.0),
                      child: Text(
                        hadith?.content ?? '',
                        style: AppFont.amiri16blackF700,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
        : Center(child: CircularProgressIndicator(color: AppColor.gold));
  }
}
