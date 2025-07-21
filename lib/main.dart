import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamy/UI/app_utils/app_theme.dart';
import 'package:islamy/UI/app_utils/shared_pref_utils/check_on_boarding_first_time_open.dart';
import 'package:islamy/UI/screens/home_screen.dart';
import 'package:islamy/UI/screens/on_bording_screens/on_boarding_screen.dart';
import 'package:islamy/UI/screens/splash_screen.dart';
import 'package:islamy/UI/screens/tabs/quran_tab/quran_details/quran_details_tab.dart';
import 'package:provider/provider.dart';
import 'UI/app_utils/shared_pref_utils/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  final isOnboardingOpened = await CheckOnBoardingFirstTimeOpen.isOnboardingOpened();
  runApp(
    ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),
      child: MyApp(isOnboardingOpened: isOnboardingOpened, ),
    ),
  );
}


class MyApp extends StatelessWidget {
  final bool isOnboardingOpened ;
  const MyApp({super.key, required this.isOnboardingOpened});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(430, 932),
      // Your design size (match your design mockup)
      minTextAdapt: true,
      // Allow text to scale
      splitScreenMode: true,
      // Support different screen sizes
      builder: (context, child) {
        return MaterialApp(
          theme: AppTheme.darkThem,
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          initialRoute: isOnboardingOpened ? '/intro_screen' : '/home_screens',

          routes: {
            '/home_screens': (_) => HomeScreen(),
            '/splash_screen': (_) => SplashScreen(),
            '/intro_screen' : (_) => OnBoardingScreen(),
            '/quran_details': (_) => QuranDetailsTab(),
          },
        );
      },
    );
  }
}
