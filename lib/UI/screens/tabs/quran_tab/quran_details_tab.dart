import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

String suraContent = ' ';

class _QuranDetailsTabState extends State<QuranDetailsTab> {
  List<String> verses = [];

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
              padding: EdgeInsets.symmetric(
                vertical: 8.0.h,
                horizontal: 20.w,
              ),
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
              child: verses.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(child: QuranContentStyle(suraContent: suraContent)),
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
      suraLines[i] += '[${i + 1}]';
    }
    verses = suraLines;
    suraContent = suraLines.join();
    Future.delayed(Duration(seconds: 0), () => setState(() {}));
  }
}
