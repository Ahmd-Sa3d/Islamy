import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamy/UI/app_utils/app_color.dart';
import 'package:islamy/UI/app_utils/app_fonts.dart';
import 'package:islamy/UI/app_utils/app_icons.dart';
import 'package:islamy/UI/app_utils/app_images.dart';
import 'package:islamy/UI/app_utils/quran_utils.dart';
import 'package:islamy/UI/screens/tabs/quran_tab/quran_details_tab.dart';
import 'package:islamy/UI/widget/sura_list_name.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              style: AppFont.amiri20GoldF700.copyWith(color: AppColor.white),
              decoration: InputDecoration(
                hintText: 'Sura Name',
                hintStyle: AppFont.amiri20GoldF700.copyWith(
                  color: AppColor.white,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: AppColor.gold),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: AppColor.gold),
                ),
                prefixIcon: ImageIcon(
                  AssetImage(AppIcons.quranSuffixIcon),
                  color: AppColor.gold,
                ),
              ),
              cursorColor: AppColor.gold,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Text('Most Recently', style: AppFont.amiri16WhiteF700),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 150.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColor.gold,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 17.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      QuranUtils.englishQuranSura[index],
                                      style: AppFont.amiri16blackF700,
                                    ),
                                    Text(
                                      QuranUtils.arabicQuranSura[index],
                                      textDirection: TextDirection.rtl,
                                      style: AppFont.amiri16blackF700.copyWith(
                                        fontSize: 24,
                                      ),
                                    ),
                                    Text(
                                      '112 versus',
                                      style: AppFont.amiri16blackF700.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(AppImages.recentlyOpenImage),
                            ],
                          ),
                        );
                      },
                      separatorBuilder:
                          (context, index) => SizedBox(width: 10.w),
                      itemCount: 114,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 17),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('Sura List', style: AppFont.amiri16WhiteF700),
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.0.w),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, QuranDetailsTab.routeName);
                    },
                    child: SuraListName(index: index, suraNumber: index + 1),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
                itemCount: 114,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
