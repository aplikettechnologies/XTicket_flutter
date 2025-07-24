import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';

import '../../../shared/localization/localization_const.dart';
import '../../../shared/utils/app_assets.dart';
import '../../../shared/widgets/app_textformfield.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 26.h, horizontal: 16.w),
      child: Column(
        children: [
          Center(
            child: Container(
              height: 80.h,
              width: 80.w,
              decoration: BoxDecoration(
                color: AppColor.neutralColor08,
                shape: BoxShape.circle,
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
            hintText: getTranslation(context, 'ticket_booking.full_name'),
            headerText: getTranslation(context, 'ticket_booking.full_name'),
          ),
          SizedBox(height: 12.h),
          appTextFormField(
            context: context,
            hintText: getTranslation(context, 'ticket_booking.full_name'),
            headerText: getTranslation(context, 'ticket_booking.full_name'),
          ),
        ],
      ),
    );
  }
}
