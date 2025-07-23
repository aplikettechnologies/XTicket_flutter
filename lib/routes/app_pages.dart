import 'package:get/get.dart';
import 'package:xticket/app/modules/dashboard/dashboard_screen.dart';
import 'package:xticket/routes/app_routes.dart';
import '../app/modules/onboarding/onboarding_screen.dart';

class AppPages {
  static final List<GetPage<dynamic>> routes = [
    GetPage(name: "/", page: () => OnboardingScreen()),
    GetPage(name: AppRoutes.dashboard, page: () => DashboardScreen()),
  ];
}
