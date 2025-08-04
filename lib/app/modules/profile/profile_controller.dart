import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxString selectCity = "Dammam".obs;
  RxString selectNotionality = "Afghan".obs;
  RxString selectBirthDay = "".obs;
  RxString selectGender = "Male".obs;

  // Set selected city
  void updateCity(String city) {
    selectCity.value = city;
    update();
  }

  // Set selected nationality
  void updateNotionality(String notionality) {
    selectNotionality.value = notionality;
    update();
  }

  // Set selected birth date
  void updateBirthDay(String birthDay) {
    selectBirthDay.value = birthDay;
    update();
  }

  // Set selected gender
  void updateGender(String gender) {
    selectGender.value = gender;
    update();
  }
}
