import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/event/event_screen.dart';
import 'package:xticket/app/modules/home/home_screen.dart';
import 'package:xticket/app/modules/profile/profile_screen.dart';
import 'package:xticket/app/modules/ticket/ticket_screen.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';

import '../nearMe/nearme_screen.dart';

class DashboardController extends GetxController {
  RxInt currentIndex = 0.obs;

  // // Iconify
  final List<String> bottomNavIcons = [
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

  setTabIndex(int index) {
    currentIndex.value = index;
    update();
  }

  Future<void> changeLanguage() async {
    
  }
}
