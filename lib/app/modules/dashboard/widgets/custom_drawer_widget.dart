import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/dashboard/dashboard_controller.dart';
import 'package:xticket/routes/app_routes.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_style.dart';
import 'package:xticket/shared/widgets/app_image_network.dart';

import '../../../../shared/utils/app_color.dart';

Widget customerDrawerWidget({required BuildContext context}) {
  return GetBuilder(
    init: DashboardController(),
    builder:
        (controller) => Container(
          decoration: BoxDecoration(color: AppColor.white),
          width: MediaQuery.sizeOf(context).width / 1.4,
          child: Column(
            children: [
              customDrawerHeader(),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 32.h,
                    horizontal: 21.w,
                  ),
                  color: AppColor.primaryColor04,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        drawerListTile(
                          title: getTranslation(context, "drawer.myEvents"),
                          leadingIcon: AppAssets.icEventWhite,
                          trailingIcon: AppAssets.icRightArrow,
                          onTap: () {
                            Get.back();
                            controller.setTabIndex(2);

                            // Handle My Events tap
                          },
                        ),
                        drawerListTile(
                          title: getTranslation(context, "drawer.myTickets"),
                          leadingIcon: AppAssets.icTicketWhite,
                          trailingIcon: AppAssets.icRightArrow,
                          onTap: () {
                            Get.back();
                            controller.setTabIndex(1);
                          },
                        ),
                        drawerListTile(
                          title: getTranslation(context, "drawer.eQueue"),
                          leadingIcon: AppAssets.icSearchWhite,
                          trailingIcon: AppAssets.icRightArrow,
                          onTap: () {
                            Get.back();
                            controller.setTabIndex(3);
                          },
                        ),
                        drawerListTile(
                          title: getTranslation(context, "drawer.favorite"),
                          leadingIcon: AppAssets.icHeartWhite,
                          trailingIcon: AppAssets.icRightArrow,
                          onTap: () {
                            Get.back();
                          },
                        ),
                        drawerListTile(
                          title: getTranslation(context, "drawer.settings"),
                          leadingIcon: AppAssets.icSettingsWhite,
                          trailingIcon: AppAssets.icRightArrow,
                          onTap: () {
                            Get.toNamed(AppRoutes.settings);
                          },
                        ),
                        drawerListTile(
                          title: getTranslation(context, "drawer.faq"),
                          leadingIcon: AppAssets.icFaqWhite,
                          trailingIcon: AppAssets.icRightArrow,
                          onTap: () {
                            // Handle FAQ tap
                          },
                        ),
                        drawerListTile(
                          title: getTranslation(
                            context,
                            "drawer.privacyPolicy",
                          ),
                          leadingIcon: AppAssets.icShieldWhite,
                          trailingIcon: AppAssets.icRightArrow,
                          onTap: () {
                            // Handle Privacy Policy tap
                          },
                        ),
                        drawerListTile(
                          title: getTranslation(context, "drawer.logout"),
                          leadingIcon: AppAssets.icLogoutWhite,
                          trailingIcon: AppAssets.icRightArrow,
                          onTap: () {
                            Get.toNamed(AppRoutes.login);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 20.h, left: 21.w, right: 21.w),
                width: double.infinity,
                color: AppColor.primaryColor04,
                child: SvgPicture.asset(
                  AppAssets.icAppLogoTitleWhite,
                  height: 55.h,
                  width: 25.w,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
  );
}

Widget customDrawerHeader() {
  return Container(
    color: AppColor.secondaryColorBlack,
    width: double.infinity,
    child: Padding(
      padding: EdgeInsets.only(top: 20.h, left: 28.w, bottom: 28.h),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.h,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: appImageNetwork(
                width: 60.r,
                height: 60.r,
                url:
                    "https://images.pexels.com/photos/50855/pexels-photo-50855.jpeg",
              ),
            ),
            Text("Emily Smith", style: AppStyle.blackExtraBold20Lato),
          ],
        ),
      ),
    ),
  );
}

Widget drawerListTile({
  required String title,
  required String leadingIcon,
  required VoidCallback onTap,
  String? trailingIcon,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.only(bottom: 15.h),
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColor.grey, width: 1.w)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            leadingIcon,
            height: 24.h,
            width: 24.w,
            fit: BoxFit.cover,
          ),
          Text(
            title,
            style: AppStyle.whiteMedium14Lato,
            overflow: TextOverflow.ellipsis,
          ),
          if (trailingIcon != null)
            SvgPicture.asset(
              trailingIcon,
              height: 30.h,
              width: 30.w,
              fit: BoxFit.cover,
            ),
        ],
      ),
    ),
  );
}
