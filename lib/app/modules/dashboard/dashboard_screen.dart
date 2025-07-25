import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/dashboard/dashboard_controller.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';
import '../../../shared/widgets/app_svg_iconbutton.dart';
import '../../../shared/widgets/common_bottombar.dart';
import 'widgets/change_language_dropdown.dart';
import 'widgets/custom_drawer_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DashboardController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.white,
          appBar: AppBar(
            backgroundColor: AppColor.primaryColor04,
            automaticallyImplyLeading: false,
            leadingWidth: 45.w,
            leading: Builder(
              builder: (context) {
                return IconButton(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.sp,
                    horizontal: 12.w,
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: SvgPicture.asset(
                    AppAssets.icDrawerMenu,
                    height: 24.h,
                    width: 24.w,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            centerTitle: controller.currentIndex.value == 4 ? false : true,
            title:
                controller.currentIndex.value == 4
                    ? Text(
                      getTranslation(context, "dashboard.profile"),
                      style: AppStyle.whiteBold20Lato,
                    )
                    : SvgPicture.asset(
                      AppAssets.icAppLogoTitleWhite,
                      height: 31.h,
                      width: 55.w,
                      fit: BoxFit.fill,
                    ),
            elevation: 4,
            actions:
                controller.currentIndex.value == 4
                    ? [
                      svgIconButton(
                        iconPath: AppAssets.icSettingsWhite,
                        onPressed: () {
                          // handle tap
                        },
                        padding: EdgeInsets.all(5.sp),
                      ),
                    ]
                    : [
                      svgIconButton(
                        iconPath: AppAssets.icNotification,
                        onPressed: () {
                          // handle tap
                        },
                        padding: EdgeInsets.all(5.sp),
                      ),

                      changeLanguageDropdown(context),
                    ],
          ),
          drawer: customerDrawerWidget(context: context),
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
