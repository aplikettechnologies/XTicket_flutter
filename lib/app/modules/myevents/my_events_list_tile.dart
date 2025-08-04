import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/widgets/app_divider.dart';

import '../../../shared/utils/app_color.dart';
import '../../../shared/utils/app_style.dart';
import '../../../shared/widgets/app_image_network.dart';

Widget myEventsListTile({required BuildContext context}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(7.r),
          child: appImageNetwork(
            fit: BoxFit.cover,
            height: 80.h,
            width: 100.w,
            url:
                "https://img.freepik.com/free-psd/event-banner-template-design_23-2149231980.jpg",
          ),
        ),
        SizedBox(width: 14.w),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Summer Splash", style: AppStyle.black14BoldLato),
              SizedBox(height: 5.h),
              myEventDetails(
                icon: AppAssets.icLocation,
                value: "Al Safa Park, Jeddah, Saudi Arabia",
              ),
              myEventDetails(icon: AppAssets.icClock, value: "03:00 AM"),
            ],
          ),
        ),

        onOpenActionThreeDot(context),
      ],
    ),
  );
}

onOpenActionThreeDot(BuildContext context) {
  return PopupMenuButton<String>(
    icon: SvgPicture.asset(
      AppAssets.icThreeDot,
      height: 24.h,
      width: 24.w,
      fit: BoxFit.contain,
    ),
    padding: EdgeInsets.zero,
    position: PopupMenuPosition.under,
    itemBuilder:
        (BuildContext context) => [
          PopupMenuItem(
            onTap: () {},
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            value: 'ar',
            child: Row(
              spacing: 10.w,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  AppAssets.icEdit,
                  height: 20.h,
                  width: 20.w,
                  fit: BoxFit.cover,
                ),
                Text(
                  getTranslation(context, "event.edit"),
                  style: AppStyle.neutral2Medium14Manrope,
                ),
              ],
            ),
          ),
          PopupMenuItem(
            onTap: () {},
            padding: EdgeInsets.zero,
            value: 'en',
            height: 2.h,
            child: appDivider(
              dividerColor: AppColor.neutralColor08,
              borderHeight: 1.h,
            ),
          ),
          PopupMenuItem(
            onTap: () {},
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            value: 'en',
            child: Row(
              spacing: 10.w,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  AppAssets.icDelete,
                  height: 20.h,
                  width: 20.w,
                  fit: BoxFit.cover,
                ),
                Text(
                  getTranslation(context, "event.delete"),
                  style: AppStyle.neutral2Medium14Manrope,
                ),
              ],
            ),
          ),
        ],
    elevation: 1,
    color: AppColor.white,
    shadowColor: AppColor.grey1,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
  );
}

Widget myEventDetails({required String icon, required String value}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SvgPicture.asset(
        icon,
        height: 12.h,
        width: 12.w,
        colorFilter: ColorFilter.mode(AppColor.darkGrey, BlendMode.srcIn),
      ),
      SizedBox(width: 4.w),
      Expanded(child: Text(value, style: AppStyle.neutral3Reguler12Lato)),
    ],
  );
}
