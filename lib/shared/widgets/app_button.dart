import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_style.dart';

import '../utils/app_color.dart';

Widget appButton({
  required BuildContext context,
  required String text,
  required Function()? onPressed,
  Color? backgroundColor,
  TextStyle? textStyle,
  TextStyle? buttonLoadingtextStyle,
  double? width,
  double? height,
  String? loaderText,
  double? borderRadius,
  bool isLoading = false,
}) {
  return Container(
    constraints: BoxConstraints(
      maxHeight: height ?? double.infinity,
      minWidth: width ?? double.infinity,
    ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor ?? AppColor.primaryColor04,
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
                ? loadingPleaseWaitWidget(
                  buttonLoadingtextStyle:
                      buttonLoadingtextStyle ?? AppStyle.buttonLoadingTextStyle,
                  text:
                      loaderText ??
                      getTranslation(context, "onboarding.please_wait"),
                )
                : Text(
                  text,
                  key: const ValueKey('buttonText'),
                  style: textStyle ?? AppStyle.buttonTextStyle,
                ),
      ),
    ),
  );
}

Widget loadingPleaseWaitWidget({
  TextStyle? buttonLoadingtextStyle,
  required String text,
  double? h,
  double? w,
}) {
  return Row(
    key: const ValueKey('loadingWidget'),
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: w ?? 18.sp,
        height: h ?? 18.sp,
        child: const CircularProgressIndicator(
          strokeWidth: 2,
          color: Colors.white,
          strokeCap: StrokeCap.round,
        ),
      ),
      SizedBox(width: 8.w),
      Text(text, style: buttonLoadingtextStyle),
    ],
  );
}
