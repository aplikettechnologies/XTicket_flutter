import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';

Widget eventDetails({required String icon, required String value}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          height: 24.h,
          width: 24.w,
          colorFilter: ColorFilter.mode(
            AppColor.neutralColor03,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(child: Text(value, style: AppStyle.neutral3Reguler12Lato)),
      ],
    ),
  );
}
