import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamy/UI/app_utils/app_color.dart';
import 'package:islamy/UI/app_utils/app_fonts.dart';
import 'package:islamy/UI/app_utils/app_images.dart';
import 'package:islamy/UI/app_utils/quran_utils.dart';
import 'package:islamy/UI/screens/tabs/quran_tab/quran_details/quran_content_style.dart';

// ignore: must_be_immutable
class QuranDetailsTab extends StatefulWidget {
  static final String routeName = '/quran_details';

  const QuranDetailsTab({super.key});

  @override
  State<QuranDetailsTab> createState() => _QuranDetailsTabState();
}

class _QuranDetailsTabState extends State<QuranDetailsTab> {
  List<String> verses = [];
  int? selectedVersesIndex;

  @override
  Widget build(BuildContext context) {
    int args = ModalRoute.of(context)?.settings.arguments as int;
    verses.isEmpty ? loadSuraFiles(args) : null;
    return Scaffold(
      appBar: AppBar(
        title: Text(QuranUtils.englishQuranSura[args]),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppImages.quranMaskLeft),

                  Text(
                    QuranUtils.arabicQuranSura[args],
                    style: AppFont.amiri20GoldF700,
                  ),

                  Image.asset(AppImages.quranMaskRight),
                ],
              ),
            ),
            Expanded(
              child:
                  verses.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : ListView.separated(
                        separatorBuilder:
                            (context, index) => Divider(
                              height: 8.h,
                              color: AppColor.transParent,
                            ),
                        itemBuilder: (context, index) {
                          return QuranContentStyle(
                            isSelected: selectedVersesIndex == index,
                            index: index + 1,
                            suraContent: verses[index],
                            onTap: () {
                              setState(() {
                                selectedVersesIndex = index;
                              });
                            },
                          );
                        },
                        itemCount: verses.length,
                      ),
            ),
            Image.asset(AppImages.bottomMosqueImage),
          ],
        ),
      ),
    );
  }

  void loadSuraFiles(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/Files/suras/${index + 1}.txt',
    );
    List<String> suraLines = fileContent.split('\n');
    for (int i = 0; i < suraLines.length; i++) {
      verses = suraLines;
      Future.delayed(Duration(seconds: 0));
      setState(() {});
    }
  }
}
