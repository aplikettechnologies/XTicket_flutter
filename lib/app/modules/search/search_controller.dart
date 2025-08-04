import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreenController extends GetxController {
  TextEditingController citySearchController = TextEditingController();
  TextEditingController eventSearchController = TextEditingController();
  String? selectedCountry;
  int selectedCategoryIndex = 0;
  String selectedCategory = '';
  String selectedCity = '';
  int selectedCityIndex = 0;
  String? selectDate;

  void onChangeCountry({required String country}) {
    selectedCountry = country;
    update();
  }

  void onSelectCategory({required String category, required int index}) {
    selectedCategory = category;
    selectedCategoryIndex = index;
    update();
  }
}
