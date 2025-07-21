import 'package:get/get.dart';

import '../app/modules/onboarding/onboarding_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage<dynamic>> routes = [
    GetPage(name: AppRoutes.onboarding, page: () => OnboardingScreen()),
  ];
}
