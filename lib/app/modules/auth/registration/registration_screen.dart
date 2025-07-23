import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';
import 'package:xticket/shared/widgets/app_divider.dart';
import 'package:xticket/shared/widgets/app_textformfield.dart';

import '../../../../shared/widgets/app_button.dart';
import 'registration_controller.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
      init: RegistrationController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
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
                    getTranslation(context, 'registration.welcome'),
                    style: AppStyle.primary1Semibold20Manrope,
                  ),
                  SizedBox(height: 4.h),

                  //SignIn
                  Text(
                    getTranslation(
                      context,
                      'registration.enter_your_account_here',
                    ),
                    style: AppStyle.neutral4Regular12Manrope,
                  ),
                  SizedBox(height: 29.h),

                  //UserName
                  appTextFormField(
                    context: context,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 14.w, top: 2.h),
                      child: SvgPicture.asset(
                        AppAssets.icUser,
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                    hintText: getTranslation(context, 'registration.user_name'),
                    headerText: getTranslation(
                      context,
                      'registration.user_name',
                    ),
                  ),
                  SizedBox(height: 14.h),

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
                    hintText: getTranslation(
                      context,
                      'registration.email_address',
                    ),
                    headerText: getTranslation(
                      context,
                      'registration.email_address',
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
                    hintText: getTranslation(context, 'registration.password'),
                    headerText: getTranslation(
                      context,
                      'registration.password',
                    ),
                  ),
                  SizedBox(height: 36.h),

                  //signIn
                  appButton(
                    context: context,
                    onPressed: () {},
                    text: getTranslation(context, 'registration.sign_up'),
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
                        getTranslation(context, 'registration.or_sign_in_with'),
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
          //DontHaveAccount
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(bottom: 55.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  getTranslation(
                    context,
                    'registration.already_have_an_account',
                  ),
                  style: AppStyle.neutral4Regular12Manrope,
                ),
                SizedBox(width: 2.w),

                Text(
                  getTranslation(context, 'registration.sign_in'),
                  style: AppStyle.primary4Semibold12Manrope,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
