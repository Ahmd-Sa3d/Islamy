import 'package:islamy/UI/app_utils/app_images.dart';

class OnBoardingData {
  final String image;
  final String title;
  final String? description;

  OnBoardingData({required this.image, required this.title, this.description});

 static List<OnBoardingData> introData = [
    OnBoardingData(image: AppImages.welcomeWord, title: 'Welcome To Islmi App'),

    OnBoardingData(
      image: AppImages.tagMahlIntroImage,
      title: 'Welcome To Islmi App',
      description: 'We Are Very Excited To Have You In Our Community',
    ),
    OnBoardingData(
      image: AppImages.quranIntroImage,
      title: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
    ),
    OnBoardingData(
      image: AppImages.do3aIntroImage,
      title: 'Bearish',
      description: 'Praise the name of your Lord, the Most High',
    ),
    OnBoardingData(
      image: AppImages.micIntroImage,
      title: 'Holy Quran Radio',
      description:
          'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];
}
