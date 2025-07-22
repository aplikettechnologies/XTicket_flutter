import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/dashboard/dashboard_controller.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_color.dart';

import '../../../shared/widgets/common_bottombar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DashboardController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primaryColor04,
            automaticallyImplyLeading: false,
            leadingWidth: 30.w,
            leading: SvgPicture.asset(
              AppAssets.icDrawerMenu,
              height: 24.h,
              width: 24.w,
              fit: BoxFit.contain,
            ),
            centerTitle: true,
            title: SvgPicture.asset(
              AppAssets.icAppLogo,
              height: 24.h,
              width: 24.w,
              fit: BoxFit.contain,
            ),
            actions: [
              SvgPicture.asset(
                AppAssets.icNotification,
                height: 24.h,
                width: 24.w,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 10.w),
              PopupMenuButton<String>(
                onSelected: (value) {},
                icon: Row(
                  spacing: 6.w,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppAssets.icDownArrow,
                      height: 24,
                      width: 24,
                      fit: BoxFit.contain,
                    ),
                    Text("AR"),
                  ],
                ),
                padding: EdgeInsets.all(10.sp),
                itemBuilder:
                    (BuildContext context) => [
                      PopupMenuItem(
                        value: 'en',
                        child: Row(
                          spacing: 10.w,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 24.h,
                              width: 24.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.primaryColor04,
                              ),
                            ),
                            Text(getTranslation(context, "dashboard.english")),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'ar',
                        child: Row(
                          spacing: 10.w,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 24.h,
                              width: 24.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.primaryColor04,
                              ),
                            ),
                            Text(getTranslation(context, "dashboard.arabic")),
                          ],
                        ),
                      ),
                    ],
                elevation: 4,
                color: AppColor.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r), // rounded corners
                ),
              ),
            ],
          ),
          body:
              controller.bottomNavigationScreens[controller.currentIndex.value],
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              customBottomNavigationBar(
                context: context,
                activeAssets: controller.bottomNavActiveIcons,
                currentIndex: controller.currentIndex.value,
                onTap: (i) => controller.setTabIndex(i),
                navigationTitle: controller.bottomNavIcons,
              ),
            ],
          ),
        );
      },
    );
  }
}
