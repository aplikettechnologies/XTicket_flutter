import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xticket/shared/utils/app_color.dart';

import '../../../shared/utils/app_style.dart';

Widget cityListTile({required String city, required bool isSelect}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    spacing: 8.w,
    children: [
      Container(
        height: 16.h,
        width: 16.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColor.black, width: 1.w),
        ),
        child:
            isSelect
                ? Center(
                  child: Container(
                    height: 10.h,
                    width: 10.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.black,
                    ),
                  ),
                )
                : null,
      ),

      Text(city, style: AppStyle.black12MediumLato),
    ],
  );
}
