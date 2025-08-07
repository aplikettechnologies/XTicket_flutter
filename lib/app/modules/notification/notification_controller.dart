import 'package:get/get.dart';

class NotificationController extends GetxController {
  bool isLoading = false;

  Future<void> getNotification() async {
    isLoading = true;
    update();
    await Future.delayed(Duration(seconds: 2));
    isLoading = false;
    update();
  }

  @override
  Future<void> onInit() async {
    await getNotification();
    super.onInit();
  }
}
