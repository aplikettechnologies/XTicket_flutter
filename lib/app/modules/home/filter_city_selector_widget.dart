// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/home/home_controller.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';

import 'city_list_tile.dart';

Widget filterCitySelector({
  required BuildContext context,
  required HomeController controller,
}) {
  return Expanded(
    flex: 2,
    child: PopupMenuButton<String>(
      menuPadding: EdgeInsets.zero,
      icon: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: AppColor.white,
          boxShadow: [
            BoxShadow(
              color: AppColor.black.withValues(alpha: 0.1),
              offset: Offset(1, 1),
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              controller.selectedCity.value,
              style: AppStyle.grey2Regular12Lato,
            ),
            SizedBox(width: 5.w),
            SvgPicture.asset(
              AppAssets.icDownArrow.removeAllWhitespace,
              width: 24.w,
              height: 24.h,
              fit: BoxFit.contain,
              color: AppColor.primaryColor04,
            ),
          ],
        ),
      ),
      padding: EdgeInsets.zero,
      position: PopupMenuPosition.under,

      itemBuilder: (BuildContext context) {
        return [
          // Custom search field
          PopupMenuItem<String>(
            enabled: false,
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.5,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: TextFormField(
                cursorColor: AppColor.primaryColor04,
                decoration: InputDecoration(
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 40.w,
                    minHeight: 40.h,
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                      left: 12.w,
                      right: 8.w,
                    ), // adjust spacing
                    child: SvgPicture.asset(
                      AppAssets.icSearch.removeAllWhitespace,
                      width: 24.w,
                      height: 24.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  enabledBorder: AppStyle.searchCityTextFormFieldBorder,
                  errorBorder: AppStyle.searchCityTextFormFieldBorder,
                  focusedBorder: AppStyle.searchCityTextFormFieldBorder,
                  disabledBorder: AppStyle.searchCityTextFormFieldBorder,
                  focusedErrorBorder: AppStyle.searchCityTextFormFieldBorder,
                ),
                onChanged: (query) => controller.filterCities(query),
              ),
            ),
          ),
          // The actual list of cities
          ...controller.filteredCities.map((city) {
            return PopupMenuItem<String>(
              value: city,
              onTap: () => controller.setCity(city),
              child: cityListTile(
                city: city,
                isSelect: controller.selectedCity.value == city,
              ),
            );
          }),
        ];
      },
      elevation: 2,
      color: AppColor.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
  );
}
