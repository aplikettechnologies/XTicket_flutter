import 'dart:async';
import 'package:xticket/routes/app_routes.dart';

class AppConfigurationService {
  static Future<String> getInitialRoute() async {
    // simulate API call / token check
    await Future.delayed(const Duration(seconds: 2));

    final token = "";

    if (token.isNotEmpty) {
      return AppRoutes.dashboard;
    }
    return AppRoutes.onboarding;
  }
}
