import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xticket/shared/utils/app_assets.dart';

import '../utils/app_color.dart';
import '../utils/app_style.dart';

class AppToast {
  /// Show success toast
  static void showSuccess({
    required String title,
    required String subTitle,
    String? prefixIcon,
  }) {
    final context = Get.overlayContext;
    if (context == null) return;

    showToastWidget(
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 32,
              spreadRadius: 0,
              offset: Offset(0, -3),
              color: AppColor.black.withValues(alpha: 0.12),
            ),
          ],
          color: AppColor.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.r),
            topRight: Radius.circular(8.r),
            bottomRight: Radius.circular(3.r),
            bottomLeft: Radius.circular(3.r),
          ),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5.h, right: 8.w),
              child: SvgPicture.asset(AppAssets.icClose),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    title,
                    style: AppStyle.toastTitleTextStyle,
                    overflow: TextOverflow.visible,
                    maxLines: 3,
                    softWrap: true,
                  ),
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    subTitle,
                    style: AppStyle.toastSubTitleTextStyle,
                    overflow: TextOverflow.visible,
                    maxLines: 3,
                    softWrap: true,
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  height: 5.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.red,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(3.r),
                      bottomLeft: Radius.circular(3.r),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      context: context,
      animation: StyledToastAnimation.slideFromBottom,
      reverseAnimation: StyledToastAnimation.slideToBottom,
      position: StyledToastPosition.bottom,
      animDuration: Duration(milliseconds: 350),
      isIgnoring: true,
    );
  }

  /// Show failure toast
  static void showFailure({required String msg, String? prefixIcon}) {
    final context = Get.overlayContext;
    if (context == null) return;

    showToastWidget(
      LayoutBuilder(
        builder: (context, c) {
          return Container(
            margin: EdgeInsets.only(right: 16.w, left: 16.w, top: 24.h),
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColor.red,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  prefixIcon ?? AppAssets.icErrorGreen,
                  height: 24.h,
                  width: 24.w,
                  colorFilter: ColorFilter.mode(
                    AppColor.white,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Text(
                    msg,
                    style: AppStyle.whiteMedium14Lato.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                    overflow: TextOverflow.visible,
                    maxLines: 3,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      context: context,
      duration: Duration(seconds: 5),
      animation: StyledToastAnimation.slideFromTop,
      reverseAnimation: StyledToastAnimation.slideFromTop,
      animDuration: Duration(milliseconds: 350),
      position: StyledToastPosition.top,
      isIgnoring: false,
    );
  }
}
