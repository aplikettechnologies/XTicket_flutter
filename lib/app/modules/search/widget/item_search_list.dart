import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/widgets/app_image_network.dart';

Widget itemSearchList() {
  return Padding(
    padding: EdgeInsets.only(bottom: 12.h),
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
        Expanded(child: Text('Summer Splash Celebration event')),
      ],
    ),
  );
}
