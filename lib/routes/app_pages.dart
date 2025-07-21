import 'package:get/get.dart';
import '../app/modules/login/login_screen.dart';

class AppPages {
  static final List<GetPage<dynamic>> routes = [
    GetPage(name: "/", page: () => LoginScreen()),
  ];
}
