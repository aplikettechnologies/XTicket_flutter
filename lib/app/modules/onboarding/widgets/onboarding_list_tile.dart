import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xticket/app/modules/onboarding/onboarding_controller.dart';

import '../../../../shared/utils/app_color.dart';

Widget onBoardingListTile({
  required BuildContext context,
  required OnBoardingModel item,
}) {
  return Column(
    children: [
      SvgPicture.asset(
        item.icon,
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height / 2,
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
      SizedBox(height: 28.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Text(
          item.title,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: AppColor.secondaryColorDark,
            fontWeight: FontWeight.w800,
            fontSize: 36.sp,
            fontFamily: "Manrope",
          ),
        ),
      ),
    ],
  );
}
