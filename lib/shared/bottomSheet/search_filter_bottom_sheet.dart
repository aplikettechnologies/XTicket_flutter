import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_dropdown.dart';
import 'package:xticket/shared/widgets/app_button.dart';
import 'package:xticket/shared/widgets/app_select_date.dart';

import '../utils/app_color.dart';
import '../utils/app_style.dart';

Widget searchFilterBottomSheet({required BuildContext context}) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24.r),
      color: AppColor.white,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 26.h),
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    getTranslation(context, 'search.filters'),
                    style: AppStyle.darkSemibold18Lato.copyWith(
                      fontSize: 20.sp,
                    ),
                  ),
                ),
              ),
              SvgPicture.asset(AppAssets.icClose, height: 30.h, width: 30.w),
            ],
          ),
        ),
        SizedBox(height: 47.h),

        //SelectCategory
        Text(
          getTranslation(context, 'search.select_category'),
          style: AppStyle.darkMedium14Lato,
        ),
        SizedBox(height: 12.h),
        Wrap(
          spacing: 4.w,
          runSpacing: 4.h,
          children:
              [
                'Technology',
                'Seminars',
                'Education',
                'Workshop',
                'Concerts',
                'Health',
              ].map((category) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      border: Border.all(color: AppColor.primaryColor04),
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Text(
                      category,
                      style: AppStyle.primary4Medium12Lato.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
        SizedBox(height: 26.h),

        //SelectCountry
        Text(
          getTranslation(context, 'search.select_country'),
          style: AppStyle.darkMedium14Lato,
        ),
        SizedBox(height: 12.h),
        appDropdown(
          onChanged: (value) {},
          selectedValue: 'aaa',
          items: ['aaa', 'bbbb'],
          customButton: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColor.neutralColor08,
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.icLanguage,
                  height: 24.h,
                  width: 24.w,
                ),
                Expanded(
                  child: Text(
                    'selectedValue',
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

        SizedBox(height: 26.h),

        //date
        Text(
          getTranslation(context, 'search.date'),
          style: AppStyle.darkMedium14Lato,
        ),

        SizedBox(height: 12.h),

        SizedBox(height: 40.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Reset
            Expanded(
              child: Container(
                height: 40.h,
                alignment: Alignment.center,

                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.primaryColor04,
                    width: 1.w,
                  ),
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Text(
                  getTranslation(context, 'search.reset'),
                  style: AppStyle.primary4Medium14Manrope,
                ),
              ),
            ),
            SizedBox(width: 8.w),

            Expanded(
              flex: 2,
              child: appButton(
                context: context,
                text: getTranslation(context, 'search.apply_filters'),
                onPressed: () {},
              ),
            ),
          ],
        ),
        SizedBox(height: 50.w),
      ],
    ),
  );
}
