import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/widgets/app_image_network.dart';

Widget itemNotificationList() {
  return Container(
    decoration: BoxDecoration(
      color: AppColor.grey1,
      borderRadius: BorderRadius.circular(6.r),
    ),
    padding: EdgeInsets.all(12.w),
    margin: EdgeInsets.only(bottom: 8.h, right: 16.w, left: 16.w),

    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: appImageNetwork(
            height: 50.h,
            width: 50.w,
            url:
                'https://99designs-blog.imgix.net/blog/wp-content/uploads/2022/06/Starbucks_Corporation_Logo_2011.svg-e1657703028844.png?auto=format&q=60&fit=max&w=930',
          ),
        ),
        SizedBox(width: 14.w),
        Expanded(
          child: Html(
            data: """
        <strong>Summer Splash Celebration Tomorrow!</strong>  <body> Dive into fun and...</body>
        """,
            style: {
              "body": Style(
                color: AppColor.black,
                fontSize: FontSize(12.sp),
                fontFamily: 'Lato',
                maxLines: 2,
                textOverflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w500,
              ),
              "strong": Style(
                color: AppColor.black,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w900,
              ),
            },
          ),
        ),
      ],
    ),
  );
}
