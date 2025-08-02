import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';
import 'package:xticket/shared/widgets/app_button.dart';

import '../../../shared/localization/localization_const.dart';
import '../../../shared/utils/app_assets.dart';
import '../../../shared/widgets/app_image_network.dart';
import '../../../shared/widgets/app_svg_iconbutton.dart';
import '../../../shared/widgets/app_textformfield.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              appTextFormField(
                readOnly: true,
                suffixIcon: svgIconButton(
                  iconPath: AppAssets.icDownArrow,
                  color: AppColor.black2,
                  size: 30.sp,

                  onPressed: () {
                    // handle tap
                  },
                  padding: EdgeInsets.all(5.sp),
                ),
                context: context,
                hintText: getTranslation(context, 'profile.city'),
                headerText: getTranslation(context, 'profile.city'),
              ),
              SizedBox(height: 12.h),
              appTextFormField(
                readOnly: true,
                suffixIcon: svgIconButton(
                  iconPath: AppAssets.icDownArrow,
                  color: AppColor.black2,
                  size: 30.sp,

                  onPressed: () {
                    // handle tap
                  },
                  padding: EdgeInsets.all(5.sp),
                ),
                context: context,
                hintText: getTranslation(context, 'profile.notionality'),
                headerText: getTranslation(context, 'profile.notionality'),
              ),
              SizedBox(height: 12.h),
              appTextFormField(
                readOnly: true,
                context: context,
                suffixIcon: svgIconButton(
                  iconPath: AppAssets.icCalendar,
                  size: 34.sp,
                  onPressed: () {
                    // handle tap
                  },
                  padding: EdgeInsets.all(5.sp),
                ),
                hintText: getTranslation(context, 'profile.date_of_birth'),
                headerText: getTranslation(context, 'profile.date_of_birth'),
              ),
              SizedBox(height: 12.h),
              appTextFormField(
                readOnly: true,
                suffixIcon: svgIconButton(
                  iconPath: AppAssets.icDownArrow,
                  color: AppColor.black2,
                  size: 30.sp,

                  onPressed: () {
                    // handle tap
                  },
                  padding: EdgeInsets.all(5.sp),
                ),
                context: context,
                hintText: getTranslation(context, 'profile.gender'),
                headerText: getTranslation(context, 'profile.gender'),
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
  }
}
