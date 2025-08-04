import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_assets.dart';
import '../utils/app_color.dart';
import '../utils/app_style.dart';

Widget appSelectDate({
  required BuildContext context,
  double? height,
  double? width,
  required String title,
  TextStyle? titleStyle,
  Widget? customButton,
  void Function(DateTime?)? onDatePicked,
}) {
  return InkWell(
    onTap: () async {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)),
        barrierColor: AppColor.barrierColor,
      );

      if (onDatePicked != null && pickedDate != null) {
        onDatePicked(pickedDate);
      }
    },

    child:
        customButton ??
        Container(
          width: width ?? double.infinity,
          height: height ?? 40.h,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 14.w),
          decoration: BoxDecoration(
            color: AppColor.neutralColor08,
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.icCalendar, height: 24.h, width: 24.w),
              SizedBox(width: 8.w),

              Expanded(
                child: Text(
                  title,
                  style: AppStyle.neutral4Reguler14Lato.copyWith(
                    color: AppColor.neutralColor05,
                  ),
                ),
              ),

              SizedBox(width: 5.w),
            ],
          ),
        ),
  );
}
