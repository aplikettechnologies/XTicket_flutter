import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xticket/routes/app_routes.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () => Get.offAllNamed(AppRoutes.onboarding));
    return Scaffold(
      backgroundColor: AppColor.primaryColor04,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.icAppLogoBlack,
              height: 55.h,
              width: 70.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Text(
                  getTranslation(context, 'splash.ticket'),
                  style: AppStyle.darkBold24Lato.copyWith(fontSize: 47.sp),
                ),
                Text(
                  getTranslation(context, 'splash.at'),
                  style: AppStyle.dark14ExtraBoldLato.copyWith(fontSize: 47.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
