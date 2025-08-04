import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xticket/shared/utils/app_color.dart';

import '../utils/app_style.dart';

Widget appSelectDate({
  required BuildContext context,
  required String title,
  TextStyle? titleStyle,
  double? height,
  double? width,
  void Function(TimeOfDay?)? onTimePicked,
}) {
  return InkWell(
    onTap: () async {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: 7, minute: 15),
        initialEntryMode: TimePickerEntryMode.input,
        barrierColor: AppColor.barrierColor,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: AppColor.primaryColor04,
                primaryContainer: AppColor.primaryColor10,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
              textTheme: TextTheme(),
            ),
            child: child!,
          );
        },
      );

      if (onTimePicked != null) {
        onTimePicked(pickedTime);
      }
    },
    child: Container(
      width: width ?? double.infinity,
      height: height ?? 40.h,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColor.white,
        border: Border.all(color: AppColor.grey2, width: 1.w),
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Text(title, style: titleStyle ?? AppStyle.blackReguler12Manrope),
    ),
  );
}
