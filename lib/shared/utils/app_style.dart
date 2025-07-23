import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xticket/shared/utils/app_color.dart';

class AppStyle {
  //Primary
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
  static TextStyle primary4Medium12Lato = TextStyle(
    color: AppColor.primaryColor04,
    fontSize: 12.sp,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w500,
  );

  //Neutral
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
  static TextStyle neutral4Reguler14Lato = TextStyle(
    color: AppColor.neutralColor04,
    fontSize: 14.sp,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w400,
  );

  static TextStyle neutral3Reguler12Lato = TextStyle(
    color: AppColor.neutralColor03,
    fontSize: 12.sp,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w400,
  );

  //Dark
  static TextStyle darkReguler14Manrope = TextStyle(
    color: AppColor.dark,
    fontSize: 14.sp,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w400,
  );
  static TextStyle darkReguler12Lato = TextStyle(
    color: AppColor.dark,
    fontSize: 12.sp,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w400,
  );
  static TextStyle darkSemibold18Lato = TextStyle(
    color: AppColor.dark,
    fontSize: 18.sp,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w600,
  );
  static TextStyle darkMedium14Lato = TextStyle(
    color: AppColor.dark,
    fontSize: 14.sp,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w500,
  );
  //Black
  static TextStyle blackBold14Lato = TextStyle(
    color: AppColor.black,
    fontSize: 14.sp,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w700,
  );
  static TextStyle blackSemiBold18Lato = TextStyle(
    color: AppColor.black,
    fontSize: 18.sp,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w600,
  );
  static TextStyle blackExtrabold18Lato = TextStyle(
    color: AppColor.black,
    fontSize: 14.sp,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w900,
  );
  static TextStyle blackReguler12Lato = TextStyle(
    color: AppColor.black,
    fontSize: 12.sp,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w400,
  );
  //Yellow
  static TextStyle yellowMedium12Lato = TextStyle(
    color: AppColor.yellow,
    fontSize: 12.sp,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w500,
  );

  //Appbar
  static TextStyle appbarTitleTextStyle = TextStyle(
    color: AppColor.dark,
    fontSize: 20.sp,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w600,
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
