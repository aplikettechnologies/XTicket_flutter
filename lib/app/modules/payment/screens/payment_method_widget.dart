import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared/utils/app_color.dart';
import '../../../../shared/utils/app_style.dart';

Widget paymentMethodWidget({
  required String title,
  required String assetPath,
  bool radioValue = false,
  required void Function()? onTap,
  double? h,
  double? w,
}) {
  return InkWell(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: onTap,
    child: Container(
      height: 65.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColor.grey1, width: 1.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            assetPath,
            height: h ?? 40.h,
            width: w ?? 45.w,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 12.w),
          Expanded(child: Text(title, style: AppStyle.blackBold14Manrope)),

          Container(
            width: 18.w,
            height: 18.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1.5.w, color: AppColor.dark),
            ),
            child:
                radioValue
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
        ],
      ),
    ),
  );
}
