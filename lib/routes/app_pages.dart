import 'package:get/get.dart';
import 'package:xticket/app/modules/auth/login/login_screen.dart';
import 'package:xticket/app/modules/auth/registration/registration_screen.dart';
import 'package:xticket/app/modules/dashboard/dashboard_screen.dart';
import '../app/modules/auth/forgetPassword/forget_password_screen.dart';
import '../app/modules/event/event_screen.dart';
import '../app/modules/eventDetails/event_details_screen.dart';
import '../app/modules/notification/notification_screen.dart';
import '../app/modules/onboarding/onboarding_screen.dart';
import '../app/modules/ticketBooking/ticket_booking_screen.dart';

class AppPages {
  static final List<GetPage<dynamic>> routes = [
    GetPage(name: "/", page: () => DashboardScreen()),
  ];
}
