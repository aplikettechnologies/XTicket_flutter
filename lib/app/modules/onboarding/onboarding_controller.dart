import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';

import '../../../routes/app_routes.dart';

class OnboardingController extends GetxController {
  int currentPage = 0;
  late PageController pageController;
  List<OnBoardingModel> onboardingList = [];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    final context = Get.context!;
    onboardingList = [
      OnBoardingModel(
        icon: AppAssets.bgOnboarding1,
        title: getTranslation(context, "onboarding.buyTicketWith"),
      ),
      OnBoardingModel(
        icon: AppAssets.bgOnboarding2,
        title: getTranslation(context, "onboarding.quickEasyChickIn"),
      ),
      OnBoardingModel(
        icon: AppAssets.bgOnboarding3,
        title: getTranslation(
          context,
          "onboarding.discoverEventsTailoredForYou",
        ),
      ),
    ];
  }

  void updatePage(int index) {
    currentPage = index;
    update();
  }

  void goToNextPage() {
    if (currentPage == 2) {
      // Navigation
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

class OnBoardingModel {
  final String title;
  final String icon;

  OnBoardingModel({required this.title, required this.icon});
}
