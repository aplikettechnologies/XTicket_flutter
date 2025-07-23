import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget svgIconButton({
  required String iconPath,
  required VoidCallback onPressed,
  double? size,
  EdgeInsets? padding,
}) {
  return IconButton(
    padding: padding ?? EdgeInsets.zero,
    constraints: const BoxConstraints(),
    onPressed: onPressed,
    icon: SvgPicture.asset(
      iconPath,
      height: size ?? 24.h,
      width: size ?? 24.w,
      fit: BoxFit.contain,
    ),
  );
}
