import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../shared/localization/localization_const.dart';
import '../../../../shared/utils/app_color.dart';
import '../../../../shared/utils/app_dropdown.dart';
import '../../../../shared/utils/app_style.dart';
import '../../../../shared/widgets/app_textformfield.dart';
import '../create_event_controller.dart';

Widget detailsTab({required BuildContext context}) {
  CreateEventController controller = Get.put(CreateEventController());
  return SingleChildScrollView(
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
            onChanged: (value) {
              controller.selectedPrice = value!;
              controller.update();
            },
            items: ['item 1', 'item 2', 'item 3', 'item 4', 'item 5'],
            selectedValue: controller.selectedPrice.toString(),
          ),
          SizedBox(height: 16.h),

          //TimeDate
          Text(
            getTranslation(context, 'create_event.time_date'),
            style: AppStyle.darkSemibold18Manrope,
          ),
          
        ],
      ),
    ),
  );
}
