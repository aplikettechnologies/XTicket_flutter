import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/event/event_screen.dart';
import 'package:xticket/app/modules/home/home_screen.dart';
import 'package:xticket/app/modules/profile/profile_screen.dart';
import 'package:xticket/app/modules/ticket/ticket_controller.dart';
import 'package:xticket/app/modules/ticket/ticket_screen.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import '../../../shared/localization/current_local_storage.dart';
import '../../../shared/utils/app_configuration.dart';
import '../nearMe/nearme_screen.dart';

class DashboardController extends GetxController {
  RxInt currentIndex = 0.obs;

  // Icon labels (lazy evaluated with translation)
  List<String> get bottomNavIcons => [
    getTranslation(Get.context!, "dashboard.home"),
    getTranslation(Get.context!, "dashboard.myTicket"),
    getTranslation(Get.context!, "dashboard.events"),
    getTranslation(Get.context!, "dashboard.nearMe"),
    getTranslation(Get.context!, "dashboard.profile"),
  ];

  final List<String> bottomNavActiveIcons = [
    AppAssets.icHome,
    AppAssets.icTicket,
    AppAssets.icEvent,
    AppAssets.icSearch,
    AppAssets.icUserProfile,
  ];

  final List<Widget> bottomNavigationScreens = [
    HomeScreen(),
    TicketScreen(),
    EventScreen(),
    NearmeScreen(),
    ProfileScreen(),
  ];

  void setTabIndex(int index) {
    currentIndex.value = index;
    update();
  }

  void changeLanguages(String languageCode) async {
    Locale newLocale = await setLocale(languageCode);
    await Get.updateLocale(newLocale);
    AppConfiguration.languageCode = languageCode;
    await CurrentLocalStorage.setLanguageCode(languageCode: languageCode);
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    // 👇 Read index from arguments if passed
    final args = Get.arguments;
    log("args==> $args");
    if (args is Map && args['openIndex'] is int) {
      setTabIndex(args['openIndex'] as int);
      if (args['openIndex'] as int == 1) {
        await Get.find<TicketController>().getTicket();
      }
    }
  }
}
