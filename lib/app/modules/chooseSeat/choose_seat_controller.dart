import 'dart:developer';
import 'package:get/get.dart';

class ChooseSeatController extends GetxController {
  List<int> selectedSeats = <int>[0, 45, 67, 99, 128];
  List<int> chosenSeats = <int>[];

  void toggleSeatSelection(int index) {
    if (chosenSeats.contains(index)) {
      chosenSeats.remove(index);
      log("Seat $index deselected");
    } else {
      chosenSeats.add(index);
      log("Seat $index selected");
    }
    update();
  }
}
