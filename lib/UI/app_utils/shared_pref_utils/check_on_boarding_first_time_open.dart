import 'package:shared_preferences/shared_preferences.dart';

class CheckOnBoardingFirstTimeOpen {
  static const String checkOnboardingKey = 'checkOnBoarding';

  static Future<bool> isOnboardingOpened() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isOnboardingOpened =
        prefs.getBool(CheckOnBoardingFirstTimeOpen.checkOnboardingKey) ?? true;
    if(isOnboardingOpened) {
      await prefs.setBool(
          CheckOnBoardingFirstTimeOpen.checkOnboardingKey, false);
    }
    return isOnboardingOpened;
  }
}
