import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';

Widget itemCategoryList({required String icon, required String title}) {
  return Padding(
    padding: EdgeInsets.only(right: 20.w),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 55.h,
          width: 55.w,
          alignment: Alignment.center,
          padding: EdgeInsets.all(13.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.lightYellow,
          ),
          child: SvgPicture.asset(icon, height: 28.h, width: 28.w),
        ),
        SizedBox(height: 4.h),
        Text(title, style: AppStyle.neutral3Reguler12Lato),
      ],
    ),
  );
}
