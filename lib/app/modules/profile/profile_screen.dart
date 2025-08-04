import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:xticket/app/modules/profile/profile_controller.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';
import 'package:xticket/shared/widgets/app_button.dart';
import 'package:xticket/shared/widgets/app_select_date.dart';

import '../../../shared/localization/localization_const.dart';
import '../../../shared/utils/app_assets.dart';
import '../../../shared/utils/app_dropdown.dart';
import '../../../shared/widgets/app_image_network.dart';
import '../../../shared/widgets/app_svg_iconbutton.dart';
import '../../../shared/widgets/app_textformfield.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileController(),
      builder: (controller) {
        return Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 26.h, horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      height: 115.h,
                      width: 115.w,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 80.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                color: AppColor.neutralColor08,
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.r),
                                child: appImageNetwork(
                                  width: 60.r,
                                  height: 60.r,
                                  url:
                                      "https://images.pexels.com/photos/50855/pexels-photo-50855.jpeg",
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 0,
                            child: svgIconButton(
                              iconPath: AppAssets.icEditProfile,
                              onPressed: () {
                                // handle tap
                              },
                              padding: EdgeInsets.all(5.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Center(
                    child: Text(
                      "Muhammad Yasir",
                      style: AppStyle.black16ExtraBoldManrope,
                    ),
                  ),
                  SizedBox(height: 26.h),
                  appTextFormField(
                    context: context,
                    hintText: getTranslation(context, 'profile.full_name'),
                    headerText: getTranslation(context, 'profile.full_name'),
                  ),
                  SizedBox(height: 12.h),
                  appTextFormField(
                    context: context,
                    hintText: getTranslation(context, 'profile.phone_number'),
                    headerText: getTranslation(context, 'profile.phone_number'),
                  ),
                  SizedBox(height: 12.h),

                  Text(
                    getTranslation(context, 'profile.city'),
                    style: AppStyle.headerTextStyle,
                  ),
                  SizedBox(height: 8.h),

                  appDropdown(
                    hintText: getTranslation(context, 'profile.city'),
                    onChanged: (value) {
                      controller.updateCity(value.toString());
                    },
                    selectedValue: controller.selectCity,
                    items: [
                      'Dammam',
                      'Riyadh',
                      'Mecca',
                      'Jeddah',
                      'Buraydah',
                      'Madina',
                      'Al Bahah',
                      'Al Kharj',
                      'Tubuk',
                      'Al-Hasa',
                      'Jawf',
                    ],
                    customButton: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.neutralColor08,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              controller.selectCity ??
                                  getTranslation(context, 'profile.city'),
                              style: AppStyle.neutral4Reguler14Lato.copyWith(
                                color: AppColor.neutralColor05,
                              ),
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

                  SizedBox(height: 12.h),

                  Text(
                    getTranslation(context, 'profile.notionality'),
                    style: AppStyle.headerTextStyle,
                  ),
                  SizedBox(height: 8.h),

                  appDropdown(
                    hintText: getTranslation(context, 'profile.notionality'),
                    onChanged: (value) {
                      controller.updateNotionality(value.toString());
                    },
                    selectedValue: controller.selectNotionality,
                    items: [
                      'Afghan',
                      'Albanian',
                      'Algerian',
                      'American',
                      'Argentinian',
                      'Armenian',
                      'Australian',
                      'Austrian',
                      'Bangladeshi',
                      'Belgian',
                      'Brazilian',
                      'British',
                      'Bulgarian',
                      'Cambodian',
                      'Canadian',
                      'Chilean',
                    ],
                    customButton: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.neutralColor08,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              controller.selectNotionality ??
                                  getTranslation(
                                    context,
                                    'profile.notionality',
                                  ),
                              style: AppStyle.neutral4Reguler14Lato.copyWith(
                                color: AppColor.neutralColor05,
                              ),
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

                  SizedBox(height: 12.h),
                  Text(
                    getTranslation(context, 'profile.date_of_birth'),
                    style: AppStyle.headerTextStyle,
                  ),
                  SizedBox(height: 8.h),
                  appSelectDate(
                    context: context,
                    title: getTranslation(context, 'profile.date_of_birth'),
                    onDatePicked: (date) {
                      if (date != null) {
                        controller.selectBirthDay = DateFormat(
                          'dd-MMM-yyyy',
                        ).format(date);
                        controller.update();
                      }
                    },
                    customButton: Container(
                      width: double.infinity,
                      height: 45.h,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                        top: 8.h,
                        bottom: 8.h,
                        left: 14.w,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.neutralColor08,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              controller.selectBirthDay ??
                                  getTranslation(
                                    context,
                                    'profile.date_of_birth',
                                  ),
                              style: AppStyle.neutral4Reguler14Lato.copyWith(
                                color: AppColor.neutralColor05,
                              ),
                            ),
                          ),
                          SvgPicture.asset(
                            AppAssets.icCalendar,
                            height: 24.h,
                            width: 24.w,
                          ),
                          SizedBox(width: 8.w),

                          SizedBox(width: 5.w),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 12.h),

                  Text(
                    getTranslation(context, 'profile.gender'),
                    style: AppStyle.headerTextStyle,
                  ),
                  SizedBox(height: 8.h),

                  appDropdown(
                    hintText: getTranslation(context, 'profile.gender'),
                    onChanged: (value) {
                      controller.updateGender(value.toString());
                    },
                    selectedValue: controller.selectGender,
                    items: ['Male', 'Female', 'Other'],
                    customButton: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.neutralColor08,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              controller.selectGender ??
                                  getTranslation(context, 'profile.gender'),
                              style: AppStyle.neutral4Reguler14Lato.copyWith(
                                color: AppColor.neutralColor05,
                              ),
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
                  SizedBox(height: 80.h),
                ],
              ),
            ),
            //CreateEvent
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 18.3,
                      spreadRadius: 0,
                      offset: Offset(0, -2),
                      color: AppColor.black.withValues(alpha: 0.1),
                    ),
                  ],
                ),
                child: appButton(
                  context: context,
                  text: getTranslation(context, 'profile.edit_profile'),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
