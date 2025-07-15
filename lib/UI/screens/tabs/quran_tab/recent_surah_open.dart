import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../app_utils/app_color.dart';
import '../../../app_utils/app_fonts.dart';
import '../../../app_utils/app_images.dart';
import '../../../app_utils/quran_utils.dart';
import '../../../app_utils/shared_pref_utils/provider.dart';

class RecentSurahOpen extends StatefulWidget {

  const RecentSurahOpen({super.key});

  @override
  State<RecentSurahOpen> createState() => _RecentSurahOpenState();

}

class _RecentSurahOpenState extends State<RecentSurahOpen> {
  List<int> recentSurahOpen = [];
  late MostRecentProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      provider.reloadLastSurahOpen();
      });
  }


  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: provider.recentSurahOpen.isNotEmpty,
      child: Padding(
        padding: EdgeInsets.only(left: 20.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Most Recently', style: AppFont.amiri16WhiteF700),
            SizedBox(height: 10.0.h,),
            Row(
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
                                      QuranUtils
                                          .englishQuranSura[provider.recentSurahOpen[index]],
                                      style: AppFont.amiri16blackF700,
                                    ),
                                    Text(
                                      QuranUtils
                                          .arabicQuranSura[provider.recentSurahOpen[index]],
                                      textDirection: TextDirection.rtl,
                                      style: AppFont.amiri16blackF700.copyWith(
                                        fontSize: 24,
                                      ),
                                    ),
                                    Text(
                                      ' ${QuranUtils.ayaNumber[provider.recentSurahOpen[index]]} Verses',
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
                      itemCount: provider.recentSurahOpen.length,
                    ),
                  ),
                ),
                //
                // SizedBox(height: 10.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
