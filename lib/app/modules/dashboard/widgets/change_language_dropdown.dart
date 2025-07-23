import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';

changeLanguageDropdown(BuildContext context) {
  return Theme(
    data: Theme.of(context).copyWith(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      canvasColor: AppColor.white,
    ),
    child: PopupMenuButton<String>(
      onSelected: (value) {
        log("language --> $value");
      },
      icon: Row(
        spacing: 6.w,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            AppAssets.icDownArrow,
            height: 24.h,
            width: 24.w,
            fit: BoxFit.contain,
          ),
          Text("AR", style: AppStyle.buttonLoadingTextStyle),
          SizedBox(width: 8.w),
        ],
      ),
      padding: EdgeInsets.all(10.sp),
      position: PopupMenuPosition.under,
      itemBuilder:
          (BuildContext context) => [
            PopupMenuItem(
              onTap: () {},
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 6),
              value: 'en',
              child: Row(
                spacing: 10.w,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppAssets.icFlagSaudiArabia,
                    height: 25.h,
                    width: 25.w,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    getTranslation(context, "dashboard.english"),
                    style: AppStyle.black12MediumLato,
                  ),
                ],
              ),
            ),
            PopupMenuItem(
              onTap: () {},
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 6),
              value: 'ar',
              child: Row(
                spacing: 10.w,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppAssets.icFlagUnitedStates,
                    height: 25.h,
                    width: 25.w,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    getTranslation(context, "dashboard.arabic"),
                    style: AppStyle.black12MediumLato,
                  ),
                ],
              ),
            ),
          ],
      elevation: 0,
      color: AppColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r), // rounded corners
      ),
    ),
  );
}
