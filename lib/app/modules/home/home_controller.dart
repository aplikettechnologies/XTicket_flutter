import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xticket/shared/utils/app_list.dart';

class HomeController extends GetxController {
  TextEditingController searchEventController = TextEditingController();
  TextEditingController cityController = TextEditingController(text: "Makka");
  List<Map<String, dynamic>> categoryList = [];

  HomeController({required BuildContext context}) {
    categoryList = AppList.appEventCategoryList(context);
  }

  List<String> eventBanner = [
    'https://mir-s3-cdn-cf.behance.net/project_modules/fs/fafe8b78782507.5caecfa8ef0fe.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVoORAR5bOcWjWN2ZOLnhOUuuqBjkiIlUtr_DERYg5qww8FmjqGBf8wTWx37JZn7hSsMQ&usqp=CAUg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWc7PWklGUwhPq6GG3a3ccaqQXzGw0v_hul6drFsHKcXX-VRAZsZs7SsoOMiTIJ8kfraM&usqp=CAU',
  ];

  RxInt currentBannerIndex = 0.obs;

  final List<String> allCities = [
    'Dammam',
    'Riyadh',
    'Mecca',
    'Jeddah',
    'Buraydah',
    'Madina',
    'Al Bahah',
    'Al Kharj',
    'Tubuk',
    'Al-Hasa',
    'Jawf',
  ];

  RxList<String> filteredCities = <String>[].obs;

  RxString selectedCity = 'City'.obs;

  void setCity(String city) {
    selectedCity.value = city;
    update();
  }

  void filterCities(String query) {
    if (query.isEmpty) {
      filteredCities.value = allCities;
    } else {
      filteredCities.value =
          allCities
              .where((city) => city.toLowerCase().contains(query.toLowerCase()))
              .toList();
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    filteredCities.value = allCities;
  }
}
