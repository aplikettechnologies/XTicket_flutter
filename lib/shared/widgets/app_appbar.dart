import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';

import '../utils/app_assets.dart';

PreferredSizeWidget appAppbar({
  required String title,
  Color? bgColor,
  void Function()? backOnPressed,
  Color? navigationBarColor,
  Color? systemNavigationBarDividerColor,
  Color? statusBarColor,
  Brightness? statusBarBrightness,
  Brightness? systemNavigationBarIconBrightness,
  Brightness? statusBarIconBrightness,
  double? leadingWidth,
  List<Widget>? actions,
  Widget? backIcon,
  bool? centerTitle,
}) {
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle(
      systemNavigationBarColor: navigationBarColor,
      statusBarBrightness: statusBarBrightness ?? Brightness.dark,
      statusBarColor: statusBarColor,
      systemNavigationBarIconBrightness:
          systemNavigationBarIconBrightness ?? Brightness.dark,
      systemNavigationBarDividerColor: systemNavigationBarDividerColor,
      statusBarIconBrightness: statusBarIconBrightness ?? Brightness.dark,
    ),
    actions: actions,
    backgroundColor: bgColor ?? AppColor.white,
    centerTitle: centerTitle,
    scrolledUnderElevation: 0,
    leadingWidth: leadingWidth ?? 50.w,
    leading: InkWell(
      onTap:
          backOnPressed ??
          () {
            Get.back();
          },
      child:
          backIcon ??
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: SvgPicture.asset(
              AppAssets.icBack,
              height: 24.h,
              width: 24.w,
            ),
          ),
    ),
    title: Text(title, style: AppStyle.appbarTitleTextStyle),
  );
}
