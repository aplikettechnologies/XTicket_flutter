import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../shared/localization/localization_const.dart';
import '../../../../shared/utils/app_assets.dart';
import '../../../../shared/utils/app_color.dart';
import '../../../../shared/utils/app_style.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_textformfield.dart';
import '../create_event_controller.dart';

Widget locationTab({required BuildContext context}) {
  CreateEventController controller = Get.put(CreateEventController());
  return SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32.h),
          //SearchLocation
          appTextFormField(
            context: context,
            headerStyle: AppStyle.darkSemibold18Manrope,
            headerText: getTranslation(context, 'create_event.search_location'),
            filled: false,
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 14.w, top: 2.h),
              child: SvgPicture.asset(
                AppAssets.icMarker,
                height: 24.h,
                width: 24.w,
              ),
            ),
            enableBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.grey2, width: 1.w),
              borderRadius: BorderRadius.circular(100.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.primaryColor04,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
          SizedBox(height: 20.h),

          //Or
          Center(
            child: Text(
              getTranslation(context, 'create_event.or'),
              style: AppStyle.darkReguler14Manrope.copyWith(fontSize: 12.sp),
            ),
          ),
          SizedBox(height: 20.h),

          //SelectLocation
          appTextFormField(
            context: context,
            headerStyle: AppStyle.darkSemibold18Manrope,
            headerText: getTranslation(context, 'create_event.search_location'),
            filled: false,
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 14.w, top: 2.h),
              child: SvgPicture.asset(
                AppAssets.icTarget,
                height: 24.h,
                width: 24.w,
              ),
            ),
            enableBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.grey2, width: 1.w),
              borderRadius: BorderRadius.circular(100.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.primaryColor04,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
          SizedBox(height: 39.h),

          //next
          appButton(
            context: context,
            text: getTranslation(context, 'create_event.next'),
            onPressed: () {
              if (controller.tabController.index <
                  controller.tabController.length - 1) {
                controller.tabController.animateTo(
                  controller.tabController.index + 1,
                );
              }
            },
          ),
        ],
      ),
    ),
  );
}
