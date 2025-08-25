import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_color.dart';

Widget appRadioButton({
  required bool value,
  required ValueChanged<bool> onChanged,
  double? h,
  double? w,
}) {
  return InkWell(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    onTap: () {
      onChanged(!value);
    },
    child: Container(
      width: h ?? 16.w,
      height: w ?? 16.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1.5.w, color: AppColor.dark),
      ),
      child:
          value
              ? Container(
                width: 8.h,
                height: 8.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColor.dark,
                  shape: BoxShape.circle,
                ),
              )
              : SizedBox.shrink(),
    ),
  );
}
