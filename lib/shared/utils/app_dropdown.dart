import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../shared/utils/app_assets.dart';
import '../../../../shared/utils/app_color.dart';
import '../../../../shared/utils/app_style.dart';

Widget appDropdown({
  required Function(String?) onChanged,
  required String? selectedValue,
  required String hintText,
  TextStyle? textStyle,
  TextStyle? itemTextStyle,
  required List<String> items,
  Widget? customButton,
}) {
  return DropdownButtonHideUnderline(
    child: DropdownButton2<String>(
      dropdownStyleData: DropdownStyleData(
        elevation: 0,
        padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
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
      onChanged: onChanged,
      menuItemStyleData: MenuItemStyleData(
        height: 35.h,
        padding: EdgeInsets.only(right: 16.w, left: 16.w),
      ),
      value:
          (selectedValue != null && items.contains(selectedValue))
              ? selectedValue
              : null,

      items:
          items
              .map(
                (location) => DropdownMenuItem<String>(
                  value: location,
                  child: Text(
                    location,
                    style: itemTextStyle ?? AppStyle.textTextStyle,
                  ),
                ),
              )
              .toList(),

      customButton:
          customButton ??
          Container(
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
                    selectedValue ?? hintText,
                    style: textStyle ?? AppStyle.textTextStyle,
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
