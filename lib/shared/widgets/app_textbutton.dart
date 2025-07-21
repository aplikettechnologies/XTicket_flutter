import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget appTextButton({
  required VoidCallback onPressed,
  required String label,
  TextStyle? style,
}) {
  return TextButton(
    onPressed: onPressed,
    style: ButtonStyle(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
    ),
    child: Text(
      label,
      style:
          style ??
          TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.deepPurple,
          ),
    ),
  );
}
