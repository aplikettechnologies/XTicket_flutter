import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/widgets/app_button.dart';
import 'package:xticket/shared/widgets/app_select_time.dart';
import '../../../../shared/localization/localization_const.dart';
import '../../../../shared/utils/app_color.dart';
import '../../../../shared/utils/app_dropdown.dart';
import '../../../../shared/utils/app_style.dart';
import '../../../../shared/widgets/app_textformfield.dart';
import '../create_event_controller.dart';

Widget detailsTab({required BuildContext context}) {
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
          Text(
            getTranslation(context, 'create_event.details'),
            style: AppStyle.darkExtraBold24Manrope,
          ),
          SizedBox(height: 24.h),

          //EmailAddress
          appTextFormField(
            context: context,
            headerStyle: AppStyle.darkSemibold18Manrope,
            headerText: getTranslation(context, 'create_event.email_address'),
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

          //ContactNumber
          appTextFormField(
            context: context,
            headerStyle: AppStyle.darkSemibold18Manrope,
            headerText: getTranslation(context, 'create_event.contact_number'),
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

          //WhatsApp
          appTextFormField(
            context: context,
            headerStyle: AppStyle.darkSemibold18Manrope,
            headerText: getTranslation(context, 'create_event.whatsapp_number'),
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

          //SelectPrice
          Text(
            getTranslation(context, 'create_event.select_price'),
            style: AppStyle.darkSemibold18Manrope,
          ),
          SizedBox(height: 8.h),
          appDropdown(
            hintText: getTranslation(context, 'search.select_price'),
            onChanged: (value) {
              controller.selectedPrice = value!;
              controller.update();
            },
            items: ['item 1', 'item 2', 'item 3', 'item 4', 'item 5'],
            selectedValue: controller.selectedPrice.toString(),
          ),
          SizedBox(height: 36.h),

          //TimeDate
          Text(
            getTranslation(context, 'create_event.time_date'),
            style: AppStyle.darkSemibold18Manrope,
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: appSelectDate(
                  context: context,
                  title:
                      controller.selectStartTime ??
                      getTranslation(context, 'create_event.start_time'),
                  onTimePicked: (time) {
                    if (time != null) {
                      controller.selectStartTime = time.format(context);
                      controller.update();
                    }
                  },
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: appSelectDate(
                  context: context,
                  title:
                      controller.selectEndTime ??
                      getTranslation(context, 'create_event.end_time'),
                  onTimePicked: (time) {
                    if (time != null) {
                      controller.selectEndTime = time.format(context);
                      controller.update();
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),

          //addSocialLink
          Text(
            getTranslation(context, 'create_event.add_social_links'),
            style: AppStyle.darkExtraBold24Manrope.copyWith(fontSize: 20.sp),
          ),
          SizedBox(height: 24.h),
          appTextFormField(
            context: context,
            headerText: '',
            filled: false,
            hintText: getTranslation(
              context,
              'create_event.enter_social_media_links',
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

          //Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppAssets.icFacebookGreen,
                height: 26.h,
                width: 26.w,
              ),
              SizedBox(width: 10.w),
              SvgPicture.asset(AppAssets.icYoutube, height: 26.h, width: 26.w),
              SizedBox(width: 10.w),
              SvgPicture.asset(AppAssets.icLinkedIn, height: 26.h, width: 26.w),
            ],
          ),
          SizedBox(height: 51.h),

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
          SizedBox(height: 36.h),
        ],
      ),
    ),
  );
}
