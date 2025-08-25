import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xticket/shared/widgets/app_zoom_in_widget.dart';
import '../utils/app_color.dart';
import '../utils/app_style.dart';

class AppOverlay {
  /// Show a simple overlay loader
  static Future<void> showOverlayLoader({String? message}) async {
    if (Get.isDialogOpen != true) {
      Get.dialog(
        OverlayLoader(
          message: message ?? "Please wait...",
          overlayColor: AppColor.black.withValues(alpha: 0.60),
        ),
        barrierDismissible: false,
        barrierColor: Colors.transparent,
      );
    }
  }

  /// Show a loader while executing an async function
  static Future<T> showLoader<T>({
    required Future<T> Function() asyncFunc,
    String? message,
    Color? overlayColor,
  }) async {
    if (Get.isDialogOpen != true) {
      Get.dialog(
        OverlayLoader(message: message, overlayColor: overlayColor),
        barrierDismissible: false,
        barrierColor: Colors.transparent,
      );
    }

    try {
      T result = await asyncFunc();
      if (Get.isDialogOpen ?? false) Get.back(); // Close loader
      return result;
    } catch (e) {
      if (Get.isDialogOpen ?? false) Get.back(); // Close loader
      rethrow;
    }
  }

  /// Close any currently open overlay
  static void hide() {
    if (Get.isDialogOpen ?? false) Get.back();
  }
}

class OverlayLoader extends StatelessWidget {
  const OverlayLoader({super.key, this.message, this.overlayColor});
  final String? message;
  final Color? overlayColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          color: overlayColor ?? Colors.white.withValues(alpha: 0.75),
          width: double.infinity,
          height: double.infinity,
        ),
        ZoomIn(
          duration: const Duration(milliseconds: 200),
          child: Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 25.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 2,
                      spreadRadius: 0,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: AppColor.black,
                        strokeWidth: 1,
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Text(
                      message ?? "Please wait...",
                      style: AppStyle.blackBold14Manrope.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
