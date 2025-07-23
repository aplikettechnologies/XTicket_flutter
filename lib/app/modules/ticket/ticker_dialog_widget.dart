import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:get/get.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';
import 'package:xticket/shared/widgets/app_svg_iconbutton.dart';

class TicketPopupCard extends StatelessWidget {
  const TicketPopupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withValues(alpha: 0.25),
            spreadRadius: 0,
            offset: Offset.zero,
            blurRadius: 18,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: svgIconButton(
              iconPath: AppAssets.icClose,
              onPressed: () => Get.back(),
              padding: EdgeInsets.zero,
              size: 25.sp,
            ),
          ),
          SizedBox(height: 10.h),
          SvgPicture.asset(
            AppAssets.icDummyQrCode,
            height: 200.h,
            width: 200.w,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 13.h),
          Text("233556TU46NJ", style: AppStyle.blackMedium18Manrope),
          const SizedBox(height: 20),
          DottedLine(
            dashColor: AppColor.grey2,
            lineThickness: 1.h,
            dashLength: 5.w,
          ),

          SizedBox(height: 20.h),
          Text("Summer Splash", style: AppStyle.neutral2SemiBold14Manrope),
          SizedBox(height: 5.h),
          Text(
            "Al Safa Park, Jeddah, Saudi Arabia",
            style: AppStyle.neutral3Medium14Manrope,
          ),
          SizedBox(height: 5.h),
          Text(
            "Mar 19 2024 - Mar 21 2024",
            style: AppStyle.neutral3Medium14Manrope,
          ),
          SizedBox(height: 5.h),
          Text("8:30 PM - 11:30 PM ", style: AppStyle.neutral3Medium14Manrope),
          SizedBox(height: 5.h),
          Text(
            "Type: 20 Mar 10:30 -11:30 PM ",
            style: AppStyle.neutral3Medium14Manrope,
          ),
          SizedBox(height: 5.h),
          Text("Price: 300.00 SAR", style: AppStyle.neutral2SemiBold14Manrope),
          SizedBox(height: 5.h),
        ],
      ),
    );
  }
}
