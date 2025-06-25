import 'package:flutter/material.dart';
import 'package:islamy/UI/app_utils/app_images.dart';
import 'package:islamy/UI/screens/on_bording_screens/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await Future.delayed( Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full screen background image
          Positioned.fill(
            child: Image.asset(
              AppImages.splashScreen,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
