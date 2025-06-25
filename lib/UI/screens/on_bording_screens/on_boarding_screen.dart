import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:islamy/UI/app_utils/Appfonts.dart';
import 'package:islamy/UI/app_utils/app_color.dart';
import 'package:islamy/UI/app_utils/app_images.dart';
import 'package:islamy/UI/screens/on_bording_screens/on_boarding_data.dart';

class OnBoardingScreen extends StatefulWidget {
  static final String routeName = '/intro_screen';

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController(initialPage: 0);
  int currentPage = 0;
  int totalPage = OnBoardingData.introData.length;
bool isVisible = true;
  void _onPageChanged() {
    setState(() {
      currentPage = controller.page?.round() ?? 0;
    });
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(_onPageChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: SafeArea(
        child: Column(
          children: [
            Center(child: Image.asset(AppImages.islamyOnBoarding)),
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                controller: controller,
                itemBuilder: (context, index) {
                  final introItems = OnBoardingData.introData[index];
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 20,
                        ),
                        child: Image.asset(introItems.image),
                      ),
                      Text(
                        introItems.title,
                        style: AppFont.amiri.copyWith(fontSize: 24),
                      ),
                      SizedBox(height: 40),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          introItems.description ?? '',
                          style: AppFont.amiri,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                },
                itemCount: OnBoardingData.introData.length,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: currentPage == 0? false:true,
                    child: TextButton(
                      onPressed: () {
                        if (currentPage < OnBoardingData.introData.length + 1) {
                          controller.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      child: Text(
                        'Previous',
                        style: AppFont.amiri.copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (currentPage < OnBoardingData.introData.length - 1) {
                        controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      } else {
                        Navigator.pushReplacementNamed(
                          context,
                          '/home_screens',
                        );
                      }
                    },
                    child: Text(
                      currentPage == totalPage - 1 ? 'Finish' : 'Next',
                      style: AppFont.amiri.copyWith(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            DotsIndicator(
              dotsCount: OnBoardingData.introData.length,
              position: currentPage.toDouble(),
              decorator: DotsDecorator(
                activeColor: AppColor.gold,
                size: Size.square(9.0),
                activeSize: Size(20.0, 9.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
