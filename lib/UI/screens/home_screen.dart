import 'package:flutter/material.dart';
import 'package:islamy/UI/app_utils/app_color.dart';
import 'package:islamy/UI/app_utils/app_images.dart';
import 'package:islamy/UI/widget/bottom_navigate_bar.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = '/home_screens';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppImages.bgTagMahl),
        Scaffold(
          bottomNavigationBar:
          BottomNavigateBar(),
          backgroundColor: AppColor.transParent,
        ),
      ],
    );
  }
}
