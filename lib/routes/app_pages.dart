import 'package:get/get.dart';
import 'package:xticket/app/modules/auth/login/login_screen.dart';
import 'package:xticket/app/modules/auth/registration/registration_screen.dart';
import '../app/modules/auth/forgetPassword/forget_password_screen.dart';
import '../app/modules/eventDetails/event_details_screen.dart';
import '../app/modules/onboarding/onboarding_screen.dart';

class AppPages {
  static final List<GetPage<dynamic>> routes = [
    GetPage(name: "/", page: () => EventDetailsScreen()),
  ];
}
