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

  bool isLoading = false;

  Future<void> getProfileData() async {
    isLoading = true;
    update();
    await Future.delayed(Duration(seconds: 2));
    isLoading = false;
    update();
  }

  @override
  Future<void> onInit() async {
    await getProfileData();
    super.onInit();
  }
}
