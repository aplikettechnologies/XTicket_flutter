import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xticket/shared/utils/app_color.dart';

class AppStyle {
  //------------------------ PRIMARY COLOR ------------------------//
  static TextStyle primary1Semibold20Manrope = TextStyle(
    color: AppColor.primaryColor01,
    fontSize: 20.sp,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w600,
  );

  static TextStyle primary1Medium14Manrope = TextStyle(
    color: AppColor.primaryColor01,
    fontSize: 14.sp,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w500,
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

  static TextStyle primary4RegularManrope = TextStyle(
    color: AppColor.primaryColor04,
    fontSize: 14.sp,
    fontFamily: 'Manripe',
    fontWeight: FontWeight.w400,
  );

  static TextStyle primaryColor04ExtraBold14Lato = TextStyle(
    color: AppColor.primaryColor04,
    fontSize: 14.sp,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w900,
  );

  //------------------------ NEUTRAL COLOR ------------------------//
  static TextStyle neutral5Regular12Manrope = TextStyle(
    color: AppColor.neutralColor05,
    fontSize: 12.sp,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w400,
  );
  static TextStyle neutral4Medium12Manrope = TextStyle(
    color: AppColor.neutralColor04,
    fontSize: 12.sp,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w500,
  );
  static TextStyle neutral4Regular12Manrope = TextStyle(
    color: AppColor.neutralColor04,
    fontSize: 12.sp,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w400,
  );
  static TextStyle neutral2SemiBold14Manrope = TextStyle(
    color: AppColor.neutralColor02,
    fontSize: 14.sp,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w600,
  );
  static TextStyle neutral3Medium14Manrope = TextStyle(
    color: AppColor.neutralColor03,
    fontSize: 14.sp,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w500,
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

  //------------------------ DARK COLOR ------------------------//
  static TextStyle darkBold24Lato = TextStyle(
    color: AppColor.dark,
    fontSize: 24.sp,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w700,
  );
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

  static TextStyle dark14ExtraBoldLato = TextStyle(
    color: AppColor.dark,
    fontSize: 14.sp,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w900,
  );

  //------------------------ BLACK COLOR ------------------------//
  static TextStyle blackMedium18Manrope = TextStyle(
    color: AppColor.black,
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Manrope",
  );
  static TextStyle blackBold14Manrope = TextStyle(
    color: AppColor.black,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    fontFamily: "Manrope",
  );

  static TextStyle black14BoldLato = TextStyle(
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
  static TextStyle blackMedium12Lato = TextStyle(
    color: AppColor.black,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Lato",
  );
  static TextStyle blackBold16Lato = TextStyle(
    color: AppColor.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    fontFamily: "Lato",
  );
  static TextStyle blackExtraBold20Lato = TextStyle(
    color: AppColor.black,
    fontSize: 20.sp,
    fontWeight: FontWeight.w800,
    fontFamily: "Lato",
  );

  static TextStyle black16ExtraBoldManrope = TextStyle(
    color: AppColor.black,
    fontSize: 16.sp,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w700,
  );

  //------------------------ YELLOW COLOR ------------------------//
  static TextStyle yellowMedium12Lato = TextStyle(
    color: AppColor.yellow,
    fontSize: 12.sp,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w500,
  );

  //------------------------ WHITE COLOR ------------------------//
  static TextStyle whiteMedium14Lato = TextStyle(
    color: AppColor.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Lato",
  );

  static TextStyle whiteBold20Lato = TextStyle(
    color: AppColor.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    fontFamily: "Lato",
  );

  //------------------------ GREY COLOR ------------------------//
  static TextStyle grey2Regular12Lato = TextStyle(
    color: AppColor.grey2,
    fontSize: 12.sp,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w400,
  );

  //------------------------ APPBAR STYLE ------------------------//
  static TextStyle appbarTitleTextStyle = TextStyle(
    color: AppColor.dark,
    fontSize: 20.sp,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w600,
  );

  //------------------------ TEXTFIELD STYLE ------------------------//
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

  //------------------------ BUTTON STYLE ------------------------//
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

  //------------------------ TOAST STYLE ------------------------//
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

  //------------------------ SEARCH STYLE ------------------------//
  static TextStyle searchHintTextStyle = TextStyle(
    color: AppColor.grey2,
    fontSize: 12.sp,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w400,
  );
  static TextStyle searchTextStyle = TextStyle(
    color: AppColor.primaryColor01,
    fontSize: 12.sp,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w400,
  );

  //Search City Decotation
  static InputBorder searchCityTextFormFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(50.r),
    borderSide: BorderSide(color: AppColor.grey1, width: 1.w),
  );
}
