import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/widgets/app_button.dart';

import '../../../shared/utils/app_indicator.dart';
import '../../../shared/widgets/app_textbutton.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(
                  AppAssets.icAppLogoWithTitle,
                  height: 44.h,
                  width: 73.w,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: appTextButton(
                  onPressed: () {},
                  label: getTranslation(context, "onboarding.skip"),
                  style: TextStyle(
                    color: AppColor.primaryColor01,
                    fontSize: 14.sp,
                    fontFamily: "Manrope",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: SvgPicture.asset(
                AppAssets.bgOnboarding,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 100.h),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppAssets.bgOnboarding1,
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height / 1.9,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 28.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        getTranslation(context, "onboarding.buyTicketWith"),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColor.secondaryColorDark,
                          fontWeight: FontWeight.w800,
                          fontSize: 36.sp,
                          fontFamily: "Manrope",
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(
                              3,
                              (index) =>
                                  AppIndicator(index: index, currentPage: 2),
                            ),
                          ),

                          appButton(
                            height: 40.h,
                            width: 130.w,
                            context: context,
                            onPressed: () {},
                            text: getTranslation(context, "onboarding.next"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
