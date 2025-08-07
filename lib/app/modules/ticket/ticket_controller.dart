import 'package:get/get.dart';

class TicketController extends GetxController {
  bool isLoading = false;

  Future<void> getTicket() async {
    isLoading = true;
    update();
    await Future.delayed(Duration(seconds: 2));
    isLoading = false;
    update();
  }

  @override
  Future<void> onInit() async {
    await getTicket();
    super.onInit();
  }
}
