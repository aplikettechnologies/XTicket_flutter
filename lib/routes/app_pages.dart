import 'package:get/get.dart';
import '../app/modules/onboarding/onboarding_screen.dart';

class AppPages {
  static final List<GetPage<dynamic>> routes = [
    GetPage(name: "/", page: () => OnboardingScreen()),
  ];
}
