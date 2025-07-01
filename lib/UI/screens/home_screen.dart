import 'package:flutter/material.dart';
import 'package:islamy/UI/app_utils/app_color.dart';
import 'package:islamy/UI/app_utils/app_images.dart';
import 'package:islamy/UI/screens/tabs/hadith_tab/hadith_tab.dart';
import 'package:islamy/UI/screens/tabs/quran_tab/quran_tab.dart';
import 'package:islamy/UI/screens/tabs/radio_tab/radio_tab.dart';
import 'package:islamy/UI/screens/tabs/sebha_tab/sebha_tab.dart';
import 'package:islamy/UI/screens/tabs/time_tab/time_tab.dart';
import 'package:islamy/UI/widget/bottom_navigate_bar.dart';

class HomeScreen extends StatefulWidget {
  static final String routeName = '/home_screens';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> backgroundImages = [
    AppImages.quranBgIMage,
    AppImages.hadithBgImage,
    AppImages.sebhaBgImage,
    AppImages.radioBgImage,
    AppImages.timeBgImage,
  ];
  List<Widget> tabsList = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  int selectedIndex = 0;

  void _onTabChange(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgroundImages[selectedIndex],
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),

        Scaffold(
          bottomNavigationBar: BottomNavigateBar(
            currentIndex: selectedIndex,
            onTabChange: _onTabChange,
          ),
          body: SafeArea(
            child: Column(
              children: [
                Image.asset(AppImages.onBoardingMosque),
                tabsList[selectedIndex],
              ],
            ),
          ),
          backgroundColor: AppColor.transParent,
        ),
      ],
    );
  }
}
