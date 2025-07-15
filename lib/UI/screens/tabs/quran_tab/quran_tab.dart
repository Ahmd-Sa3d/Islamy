import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamy/UI/app_utils/app_color.dart';
import 'package:islamy/UI/app_utils/app_fonts.dart';
import 'package:islamy/UI/app_utils/app_icons.dart';
import 'package:islamy/UI/app_utils/quran_utils.dart';
import 'package:islamy/UI/app_utils/shared_pref_utils/provider.dart';
import 'package:islamy/UI/screens/tabs/quran_tab/quran_details_tab.dart';
import 'package:islamy/UI/screens/tabs/quran_tab/recent_surah_open.dart';
import 'package:islamy/UI/widget/sura_list_name.dart';
import 'package:provider/provider.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> suraIndexList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MostRecentProvider>(context);
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.all(20.0),
            child: TextField(
              onChanged: (searchText) {
                suraSearchText(searchText);
              },
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

          SizedBox(height: 10.h),
          RecentSurahOpen(),
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 17),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('Sura List', style: AppFont.amiri16WhiteF700),
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    provider.updateLastSuraIndex(suraIndexList[index]);
                    Navigator.pushNamed(
                      context,
                      QuranDetailsTab.routeName,
                      arguments: suraIndexList[index],
                    );
                  },
                  child: SuraListName(
                    suraNumber: index + 1,
                    index: suraIndexList[index],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10);
              },
              itemCount: suraIndexList.length,
            ),
          ),
        ],
      ),
    );
  }

  suraSearchText(String searchText) {
    List<int> filterList = [];
    for (int i = 0; i < QuranUtils.arabicQuranSura.length; i++) {
      if (QuranUtils.arabicQuranSura[i].contains(searchText)) {
        filterList.add(i);
      } else if (QuranUtils.englishQuranSura[i].toLowerCase().contains(
        searchText.toLowerCase(),
      )) {
        filterList.add(i);
      }
      suraIndexList = filterList;
      setState(() {});
    }
  }
}
