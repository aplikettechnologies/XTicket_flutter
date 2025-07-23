import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController searchEventController = TextEditingController();
  TextEditingController cityController = TextEditingController(text: "Makka");
  List<String> eventBanner = [
    'https://mir-s3-cdn-cf.behance.net/project_modules/fs/fafe8b78782507.5caecfa8ef0fe.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVoORAR5bOcWjWN2ZOLnhOUuuqBjkiIlUtr_DERYg5qww8FmjqGBf8wTWx37JZn7hSsMQ&usqp=CAUg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWc7PWklGUwhPq6GG3a3ccaqQXzGw0v_hul6drFsHKcXX-VRAZsZs7SsoOMiTIJ8kfraM&usqp=CAU',
  ];

  RxInt currentBannerIndex = 0.obs;
  List<String> cities = [
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

  RxString selectedCity = 'City'.obs;
  setCity(String c) {
    selectedCity.value = c;
    update();
  }
}
