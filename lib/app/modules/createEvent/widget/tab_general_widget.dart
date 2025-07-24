import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/createEvent/create_event_controller.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';
import 'package:xticket/shared/widgets/app_button.dart';
import 'package:xticket/shared/widgets/app_textformfield.dart';

Widget generalTab({required BuildContext context}) {
  CreateEventController controller = Get.put(CreateEventController());
  return SingleChildScrollView(
    physics: ClampingScrollPhysics(),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          //UploadImage
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            constraints: BoxConstraints(minHeight: 194.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColor.grey2, width: 1.w),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(15.w),
                  decoration: BoxDecoration(
                    color: AppColor.neutralColor08,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    AppAssets.icUpload,
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(getTranslation(context, 'create_event.upload_your_image')),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          //UploadProfie
          Text(
            getTranslation(context, 'create_event.upload_profile'),
            style: AppStyle.darkSemibold18Manrope,
          ),
          SizedBox(height: 8.h),
          Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(maxWidth: 106.h, maxHeight: 42.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              border: Border.all(color: AppColor.primaryColor04, width: 1.w),
            ),
            child: SvgPicture.asset(
              AppAssets.icUpload,
              height: 24.h,
              width: 24.w,
              colorFilter: ColorFilter.mode(
                AppColor.primaryColor04,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(height: 16.h),

          //EventTitle
          appTextFormField(
            context: context,
            headerStyle: AppStyle.darkSemibold18Manrope,
            headerText: getTranslation(context, 'create_event.event_title'),
            filled: false,
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
          SizedBox(height: 16.h),

          //EventCategory
          appTextFormField(
            context: context,
            headerStyle: AppStyle.darkSemibold18Manrope,
            headerText: getTranslation(context, 'create_event.event_category'),
            filled: false,
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
          SizedBox(height: 16.h),

          //EventDescription
          appTextFormField(
            context: context,
            headerStyle: AppStyle.darkSemibold18Manrope,
            headerText: getTranslation(
              context,
              'create_event.event_description',
            ),
            filled: false,
            maxLines: 5,
            enableBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.grey2, width: 1.w),
              borderRadius: BorderRadius.circular(14.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.primaryColor04,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(14.r),
            ),
          ),
          SizedBox(height: 56.h),

          //Next
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
          SizedBox(height: 30.h),
        ],
      ),
    ),
  );
}
