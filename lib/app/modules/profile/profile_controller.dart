import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  String? selectCity;
  String? selectNationality;
  String? selectBirthDay;
  String? selectGender;
  TextEditingController nameTextController = TextEditingController();
  TextEditingController phoneNoTextController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  // Set selected city
  void updateCity(String city) {
    selectCity = city;
    update();
  }

  // Set selected nationality
  void updateNationality(String nationality) {
    selectNationality = nationality;
    update();
  }

  // Set selected gender
  void updateGender(String gender) {
    selectGender = gender;
    update();
  }
}
