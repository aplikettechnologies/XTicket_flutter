import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_color.dart';

Widget appRoundFAB({
  required VoidCallback onPressed,
  required String iconAsset,
  Color? backgroundColor,
  double? size,
  double? iconSize,
  Color? iconColor,
  EdgeInsetsGeometry? padding,
}) {
  return SizedBox(
    height: size ?? 56.sp,
    width: size ?? 56.sp,
    child: FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor ?? AppColor.primaryColor04,
      shape: const CircleBorder(),
      elevation: 0,
      child: Padding(
        padding: padding ?? EdgeInsets.all(12.sp),
        child: SvgPicture.asset(
          iconAsset,
          width: iconSize ?? 24.sp,
          height: iconSize ?? 24.sp,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(AppColor.white, BlendMode.srcIn),
        ),
      ),
    ),
  );
}
