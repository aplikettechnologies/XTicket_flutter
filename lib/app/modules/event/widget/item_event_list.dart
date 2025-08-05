import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xticket/app/modules/home/events_model.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_helper.dart';
import 'package:xticket/shared/utils/app_style.dart';
import 'package:xticket/shared/widgets/app_image_network.dart';

Widget itemEventList(EventDetails data) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: appImageNetwork(
              height: 130.h,
              url: data.images.first,
              fit: BoxFit.cover,
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 21.w, right: 21.w),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 9,
                  spreadRadius: 0,
                  offset: Offset(0, 4),
                  color: AppColor.black.withValues(alpha: 0.2),
                ),
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(4.r),
                bottomRight: Radius.circular(4.r),
              ),
              color: AppColor.lightYellow1,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppHelper.getDay(data.date),
                  style: AppStyle.blackExtrabold18Lato.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, -3.h),
                  child: Text(
                    AppHelper.getMonthMMM(data.date),
                    style: AppStyle.blackReguler12Lato.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      SizedBox(height: 8.h),
      Text(data.title, maxLines: 1, style: AppStyle.black14BoldLato),
    ],
  );
}
