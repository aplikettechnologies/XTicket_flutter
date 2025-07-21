import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xticket/shared/utils/app_color.dart';

Widget appDivider({
  double? borderHeight,
  double? dividerWidth,
  Color? dividerColor,
}) {
  return Container(
    height: borderHeight ?? 1.h,
    width: dividerWidth ?? double.infinity,
    color: dividerColor ?? AppColor.black,
  );
}
