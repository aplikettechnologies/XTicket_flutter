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
    child: StatefulBuilder(
      builder:
          (context, setState) => PopupMenuButton<String>(
            menuPadding: EdgeInsets.zero,
            icon: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.black.withValues(alpha: 0.10),
                    offset: Offset(1, 1),
                    blurRadius: 10,
                    spreadRadius: 1,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    controller.selectedCity.value,
                    style: AppStyle.lightGrey2Regular12Lato,
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
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search, color: Colors.teal),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    onChanged: (query) {
                      // You need to call setState outside PopupMenu here — workaround needed
                    },
                  ),
                ),
                // Divider
                const PopupMenuDivider(),
                // The actual list of cities
                ...controller.cities.map((city) {
                  return PopupMenuItem<String>(
                    value: city,
                    child: cityListTile(
                      city: city,
                      isSelect: controller.selectedCity.value == city,
                    ),
                  );
                }),
              ];
            },
            elevation: 0,
            color: AppColor.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
    ),
  );
}
