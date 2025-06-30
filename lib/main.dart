import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamy/UI/screens/home_screen.dart';
import 'package:islamy/UI/screens/on_bording_screens/on_boarding_screen.dart';
import 'package:islamy/UI/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          initialRoute: '/intro_screen',

          routes: {
            '/home_screens': (_) => HomeScreen(),
            '/splash_screen': (_) => SplashScreen(),
            '/intro_screen': (_) => OnBoardingScreen(),
          },
        );
      },
    );
  }
}
