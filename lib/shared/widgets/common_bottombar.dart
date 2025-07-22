import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_color.dart';

Widget customBottomNavigationBar({
  required BuildContext context,
  required List<String> activeAssets,
  required int currentIndex,
  required Function(int) onTap,
  required List<String> navigationTitle,
}) {
  return Container(
    padding: EdgeInsets.only(
      top: 13.h,
      right: 12.w,
      left: 12.w,
      bottom: Platform.isIOS ? 35.h : 10.h,
    ),
    decoration: BoxDecoration(
      color: AppColor.white,
      boxShadow: [
        BoxShadow(
          color: AppColor.black.withValues(alpha: 0.09),
          blurRadius: 5,
          spreadRadius: 0,
          offset: Offset(0, -2),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(activeAssets.length, (index) {
        int selectedIndex =
            currentIndex == 2
                ? 1
                : currentIndex == 8
                ? 2
                : currentIndex == 1
                ? 3
                : currentIndex;
        return Expanded(
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              onTap(index);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  activeAssets[index],
                  height: 24.h,
                  width: 32.h,
                  fit: BoxFit.cover,
                  // ignore: deprecated_member_use
                  color:
                      selectedIndex == index
                          ? AppColor.navigationSelectedColor
                          : AppColor.navigationUnselectedColor,
                ),
                SizedBox(height: 8.h),
                Text(
                  navigationTitle[index],
                  style: TextStyle(
                    color:
                        selectedIndex == index
                            ? AppColor.navigationSelectedColor
                            : AppColor.navigationUnselectedColor,

                    fontSize: 12.sp,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    ),
  );
}
