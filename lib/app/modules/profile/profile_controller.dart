import 'package:get/get.dart';

class ProfileController extends GetxController {
  String? selectCity;
  String? selectNotionality;
  String? selectBirthDay;
  String? selectGender;

  // Set selected city
  void updateCity(String city) {
    selectCity = city;
    update();
  }

  // Set selected nationality
  void updateNotionality(String notionality) {
    selectNotionality = notionality;
    update();
  }

  // Set selected gender
  void updateGender(String gender) {
    selectGender = gender;
    update();
  }
}
