import 'package:flutter/material.dart';
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
    return MaterialApp(debugShowCheckedModeBanner: false,
      initialRoute: '/splash_screen',

      routes: {
    '/home_screens': (_)=>HomeScreen(),
    '/splash_screen': (_)=>SplashScreen(),
    '/intro_screen': (_)=>OnBoardingScreen(),
      },
    );
  }
}
