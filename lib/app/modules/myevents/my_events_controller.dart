import 'package:get/get.dart';

class MyEventsController extends GetxController {
  bool isLoading = false;

  Future<void> getMyEvents() async {
    isLoading = true;
    update();
    await Future.delayed(Duration(seconds: 2));
    isLoading = false;
    update();
  }

  @override
  Future<void> onInit() async {
    await getMyEvents();
    super.onInit();
  }
}
