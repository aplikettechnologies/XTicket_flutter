import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xticket/shared/utils/app_color.dart';

class AppIndicator extends StatelessWidget {
  final int index;
  final int currentPage;

  const AppIndicator({
    super.key,
    required this.index,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: index == currentPage ? 8.h : 6.h,
      width: index == currentPage ? 8.w : 6.w,
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color:
            index == currentPage
                ? AppColor.secondaryColorDark
                : AppColor.neutralColor07,
        shape: BoxShape.circle,
      ),
    );
  }
}
