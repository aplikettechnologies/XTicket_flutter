import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/auth/login/login_controller.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';
import 'package:xticket/shared/widgets/app_divider.dart';
import 'package:xticket/shared/widgets/app_textformfield.dart';

import '../../../../routes/app_routes.dart';
import '../../../../shared/widgets/app_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 24.h),
                    //logo
                    Center(
                      child: Container(
                        height: 96.w,
                        width: 96.h,
                        padding: EdgeInsets.all(21.h),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.primaryColor10,
                        ),
                        child: SvgPicture.asset(
                          AppAssets.icAppLogo,
                          width: 54.w,
                          height: 44.h,
                        ),
                      ),
                    ),
                    SizedBox(height: 14.h),

                    //Welcome
                    Text(
                      getTranslation(context, 'login.welcome'),
                      style: AppStyle.primary1Semibold20Manrope,
                    ),
                    SizedBox(height: 4.h),

                    //SignIn
                    Text(
                      getTranslation(context, 'login.sign_in_to_your_account'),
                      style: AppStyle.neutral4Regular12Manrope,
                    ),
                    SizedBox(height: 29.h),

                    //EmailAddress
                    appTextFormField(
                      context: context,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 14.w, top: 2.h),
                        child: SvgPicture.asset(
                          AppAssets.icMail,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                      hintText: getTranslation(context, 'login.email_address'),
                      headerText: getTranslation(
                        context,
                        'login.email_address',
                      ),
                    ),
                    SizedBox(height: 14.h),

                    //Password
                    appTextFormField(
                      context: context,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 14.w, top: 2.h),
                        child: SvgPicture.asset(
                          AppAssets.icPassword,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                      hintText: getTranslation(context, 'login.password'),
                      headerText: getTranslation(context, 'login.password'),
                    ),
                    SizedBox(height: 12.h),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.forgetPassword);
                        },
                        child: Text(
                          getTranslation(context, 'login.forgot_password'),
                          style: AppStyle.primary1Medium14Manrope,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),

                    //signIn
                    appButton(
                      context: context,
                      onPressed: () {
                        Get.offAllNamed(AppRoutes.dashboard);
                      },
                      text: getTranslation(context, 'login.sign_in'),
                    ),
                    SizedBox(height: 24.h),

                    //OrSignInWith
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: appDivider()),
                        SizedBox(width: 7.w),
                        Text(
                          getTranslation(context, 'login.or_sign_in_with'),
                          style: AppStyle.darkReguler14Manrope,
                        ),
                        SizedBox(width: 7.w),
                        Expanded(child: appDivider()),
                      ],
                    ),
                    SizedBox(height: 40.h),

                    //Google&Facebook
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Google
                        Container(
                          height: 67.h,
                          width: 67.h,
                          padding: EdgeInsets.all(16.h),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColor.neutralColor07),
                          ),
                          child: SvgPicture.asset(
                            AppAssets.icGoogle,
                            height: 36.h,
                            width: 36.h,
                          ),
                        ),
                        SizedBox(width: 20.w),

                        //facebook
                        Container(
                          height: 67.h,
                          width: 67.h,
                          padding: EdgeInsets.all(16.h),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColor.neutralColor07),
                          ),
                          child: SvgPicture.asset(
                            AppAssets.icFacebook,
                            height: 36.h,
                            width: 36.h,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          //DontHaveAccount
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(bottom: 55.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  getTranslation(context, 'login.dont_have_an_account'),
                  style: AppStyle.neutral4Regular12Manrope,
                ),
                SizedBox(width: 2.w),

                InkWell(
                  onTap: () {
                    Get.offAllNamed(AppRoutes.registration);
                  },
                  child: Text(
                    getTranslation(context, 'login.sign_up'),
                    style: AppStyle.primary4Semibold12Manrope,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
