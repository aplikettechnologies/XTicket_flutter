import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../shared/utils/app_assets.dart';
import '../../../../shared/utils/app_color.dart';
import '../../../../shared/utils/app_style.dart';

Widget appDropdown({
  required Function(String?) onChanged,
  required String selectedValue,
  required List<String> items,
}) {
  return DropdownButtonHideUnderline(
    child: DropdownButton2<String>(
      dropdownStyleData: DropdownStyleData(
        elevation: 0,
        padding: EdgeInsets.only(top: 10.h, bottom: 0.h),
        decoration: BoxDecoration(
          color: AppColor.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: const Offset(0, 4),
              spreadRadius: 0,
              color: AppColor.black.withValues(alpha: 0.10),
            ),
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r),
          ),
        ),
      ),

      items:
          items
              .map(
                (location) => DropdownMenuItem<String>(
                  value: location,
                  child: Text(location, style: AppStyle.appbarTitleTextStyle),
                ),
              )
              .toList(),
      onChanged: onChanged,
      value: selectedValue,
      customButton: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(100.r),
          border: Border.all(color: AppColor.grey2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                selectedValue.toString(),
                style: AppStyle.appbarTitleTextStyle,
              ),
            ),
            SizedBox(width: 5.w),
            SvgPicture.asset(
              AppAssets.icFieldDropdown,
              height: 24.h,
              width: 24.w,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    ),
  );
}
