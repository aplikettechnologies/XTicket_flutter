import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreenController extends GetxController {
  TextEditingController citySearchController = TextEditingController();
  TextEditingController eventSearchController = TextEditingController();
  String selectedCity = '';
  int selectedCityIndex = 0;

  void onChangeCity({required String value, required int index}) {
    selectedCity = value;
    selectedCityIndex = index;
    update();
  }
}
