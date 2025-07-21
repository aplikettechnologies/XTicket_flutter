import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_color.dart';

Widget appButton({
  required BuildContext context,
  required String text,
  required VoidCallback onPressed,
  Color? backgroundColor,
  Color? textColor,
  double? width,
  double? height,
  double? borderRadius,
  double? fontSize,
  bool isLoading = false,
}) {
  return Center(
    child: Container(
      constraints: BoxConstraints(
        maxHeight: height ?? 50.h,
        minHeight: height ?? 50.h,
        maxWidth: width ?? MediaQuery.sizeOf(context).width / 1.5,
        minWidth: width ?? MediaQuery.sizeOf(context).width / 1.5,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor ?? AppColor.primaryColor04,
          foregroundColor: textColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 100.r),
          ),
        ).copyWith(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          splashFactory: NoSplash.splashFactory,
        ),
        onPressed: onPressed,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child:
              isLoading
                  ? _loadingPleaseWaitWidget()
                  : Text(
                    text,
                    key: const ValueKey('buttonText'),
                    style: TextStyle(
                      color: textColor ?? AppColor.white,
                      fontSize: fontSize ?? 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Manrope",
                    ),
                  ),
        ),
      ),
    ),
  );
}

Widget _loadingPleaseWaitWidget() {
  return Row(
    key: const ValueKey('loadingWidget'),
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: 18.sp,
        height: 18.sp,
        child: const CircularProgressIndicator(
          strokeWidth: 2,
          color: Colors.white,
        ),
      ),
      SizedBox(width: 8.w),
      Text(
        "Please wait...",
        style: TextStyle(
          color: AppColor.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
