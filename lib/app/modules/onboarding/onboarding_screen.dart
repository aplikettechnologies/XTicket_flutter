import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/onboarding/onboarding_controller.dart';
import 'package:xticket/app/modules/onboarding/widgets/onboarding_list_tile.dart';
import 'package:xticket/routes/app_routes.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/widgets/app_button.dart';

import '../../../shared/utils/app_indicator.dart';
import '../../../shared/widgets/app_textbutton.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: GetBuilder(
          init: OnboardingController(),
          builder:
              (controller) => Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: SvgPicture.asset(
                      AppAssets.bgOnboarding,
                      fit: BoxFit.fill,
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                    ),
                  ),
                  SafeArea(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset(
                        AppAssets.icAppLogoWithTitle,
                        height: 44.h,
                        width: 73.w,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: appTextButton(
                        onPressed: () => Get.offAllNamed(AppRoutes.login),
                        label: getTranslation(context, "onboarding.skip"),
                        style: TextStyle(
                          color: AppColor.primaryColor01,
                          fontSize: 14.sp,
                          fontFamily: "Manrope",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 100.h),
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: PageView.builder(
                              controller: controller.pageController,
                              itemCount: controller.onboardingList.length,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (value) {
                                controller.updatePage(value);
                              },
                              itemBuilder: (context, index) {
                                final item = controller.onboardingList[index];
                                return onBoardingListTile(
                                  context: context,
                                  item: item,
                                );
                              },
                            ),
                          ),

                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(
                                    controller.onboardingList.length,
                                    (index) => AppIndicator(
                                      index: index,
                                      currentPage: controller.currentPage,
                                    ),
                                  ),
                                ),

                                appButton(
                                  height: 40.h,
                                  width:
                                      controller.currentPage == 2
                                          ? 150.w
                                          : 130.w,
                                  context: context,
                                  onPressed: controller.goToNextPage,
                                  text:
                                      controller.currentPage == 2
                                          ? getTranslation(
                                            context,
                                            "onboarding.getstarted",
                                          )
                                          : getTranslation(
                                            context,
                                            "onboarding.next",
                                          ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 40.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
