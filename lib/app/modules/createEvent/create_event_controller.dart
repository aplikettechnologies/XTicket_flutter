import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateEventController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;
  String selectedPrice = 'item 1';
  String? selectStartTime;
  String? selectEndTime;

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    super.onInit();
  }

  void onSelectedPrice({required String price}) {
    selectedPrice = price;
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
