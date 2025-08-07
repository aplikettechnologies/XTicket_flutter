import 'package:get/get.dart';
import 'package:xticket/app/modules/auth/forgetPassword/forget_password_screen.dart';
import 'package:xticket/app/modules/auth/login/login_screen.dart';
import 'package:xticket/app/modules/auth/registration/registration_screen.dart';
import 'package:xticket/app/modules/chooseSeat/choose_seat_screen.dart';
import 'package:xticket/app/modules/createEvent/create_event_screen.dart';
import 'package:xticket/app/modules/dashboard/dashboard_screen.dart';
import 'package:xticket/app/modules/eventDetails/event_details_screen.dart';
import 'package:xticket/app/modules/map/map_screen.dart';
import 'package:xticket/app/modules/onboarding/onboarding_screen.dart';
import 'package:xticket/app/modules/search/search_screen.dart';
import 'package:xticket/app/modules/settings/settings_screen.dart';
import 'package:xticket/routes/app_routes.dart';
import '../app/modules/changePassword/change_password_screen.dart';
import '../app/modules/home/events_model.dart';
import '../app/modules/notification/notification_screen.dart';

class AppPages {
  static final List<GetPage<dynamic>> routes = [
    GetPage(name: "/", page: () => DashboardScreen()),
    GetPage(name: AppRoutes.onboarding, page: () => OnboardingScreen()),
    GetPage(name: AppRoutes.login, page: () => LoginScreen()),
    GetPage(name: AppRoutes.registration, page: () => RegistrationScreen()),
    GetPage(name: AppRoutes.forgetPassword, page: () => ForgetPasswordScreen()),
    GetPage(name: AppRoutes.dashboard, page: () => DashboardScreen()),
    GetPage(name: AppRoutes.notification, page: () => NotificationScreen()),
    GetPage(name: AppRoutes.createEvent, page: () => CreateEventScreen()),
    GetPage(name: AppRoutes.settings, page: () => SettingsScreen()),
    GetPage(name: AppRoutes.changePassword, page: () => ChangePasswordScreen()),
    GetPage(
      name: AppRoutes.eventDetails,
      page: () {
        final EventDetails event = Get.arguments as EventDetails;

        return EventDetailsScreen(data: event);
      },
    ),
    GetPage(
      name: AppRoutes.map,
      page: () => MapScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(name: AppRoutes.search, page: () => SearchScreen()),
    GetPage(name: AppRoutes.chooseSeat, page: () => ChooseSeatScreen()),
  ];
}
