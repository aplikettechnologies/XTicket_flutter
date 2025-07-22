import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xticket/shared/utils/app_color.dart';

class AppStyle {
  //primary
  static TextStyle primary1Semibold20Manrope = TextStyle(
    color: AppColor.primaryColor01,
    fontSize: 20.sp,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w600,
  );
  static TextStyle primary4Semibold12Manrope = TextStyle(
    color: AppColor.primaryColor04,
    fontSize: 12.sp,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w600,
  );
  // neutral
  static TextStyle neutral4Regular12Manrope = TextStyle(
    color: AppColor.neutralColor04,
    fontSize: 12.sp,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w400,
  );
  static TextStyle neutral5Medium14Manrope = TextStyle(
    color: AppColor.neutralColor05,
    fontSize: 14.sp,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w500,
  );
  static TextStyle darkReguler14Manrope = TextStyle(
    color: AppColor.dark,
    fontSize: 14.sp,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w400,
  );

  //TextFieldStyle
  static TextStyle hintTextStyle = TextStyle(
    color: AppColor.neutralColor05,
    fontSize: 14.sp,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w500,
  );
  static TextStyle errorTextStyle = TextStyle(
    color: AppColor.red,
    fontSize: 14.sp,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w500,
  );
  static TextStyle textTextStyle = TextStyle(
    color: AppColor.primaryColor01,
    fontSize: 14.sp,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w500,
  );
  static TextStyle headerTextStyle = TextStyle(
    color: AppColor.dark,
    fontSize: 14.sp,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w500,
  );

  //ButtonStyle
  static TextStyle buttonTextStyle = TextStyle(
    color: AppColor.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Manrope",
  );
  static TextStyle buttonLoadingTextStyle = TextStyle(
    color: AppColor.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Manrope",
  );

  //ToastStyle
  static TextStyle toastTitleTextStyle = TextStyle(
    color: AppColor.neutralColor01,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Manrope",
  );
  static TextStyle toastSubTitleTextStyle = TextStyle(
    color: AppColor.neutralColor01,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Manrope",
  );
}
