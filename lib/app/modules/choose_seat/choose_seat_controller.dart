import 'dart:developer';
import 'package:get/get.dart';

class ChooseSeatController extends GetxController {
  List<int> selectedSeats = <int>[0, 45, 67, 99, 128];
  List<int> reservedSeats = [85];

  void toggleSeatSelection(int index) {
    if (selectedSeats.contains(index)) {
      selectedSeats.remove(index);
      log("Seat $index deselected");
    } else {
      selectedSeats.add(index);
      log("Seat $index selected");
    }
    update();
  }
}
