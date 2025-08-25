import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/no_internet/controller/no_internet_controller.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/widgets/app_appbar.dart';

import '../../../../shared/localization/localization_const.dart';
import '../../../../shared/utils/app_style.dart';
import '../../../../shared/widgets/app_button.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColor.white,
        statusBarColor: AppColor.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appAppbar(
          title: getTranslation(context, "no_internet.no_internet_connection"),
          backIcon: SizedBox.shrink(),
          centerTitle: true,
          appBarTextStyle: AppStyle.appbarTitleTextStyle.copyWith(
            fontSize: 18.sp,
          ),
        ),
        body: GetBuilder<NoInternetController>(
          init: NoInternetController(),
          builder: (controller) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        AppAssets.icNoInternet,
                        height: 200.h,
                        width: 200.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      getTranslation(
                        context,
                        "no_internet.no_internet_connection",
                      ),
                      style: AppStyle.primary1Semibold20Manrope,
                    ),
                    SizedBox(height: 20.h),
                    appButton(
                      context: context,
                      isLoading: controller.isRetry.value,
                      loaderText: getTranslation(
                        context,
                        "no_internet.retrying",
                      ),
                      text: getTranslation(context, "no_internet.retry"),
                      onPressed: () async => controller.retry(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
