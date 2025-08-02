import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_style.dart';
import 'package:xticket/shared/widgets/app_appbar.dart';
import 'package:xticket/shared/widgets/app_button.dart';
import 'package:xticket/shared/widgets/app_textformfield.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppbar(
        title: getTranslation(context, 'change_password.change_password'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //CurrentPassword
              SizedBox(height: 17.h),
              appTextFormField(
                context: context,
                hintText: getTranslation(
                  context,
                  'change_password.current_password',
                ),
                hintTextStyle: AppStyle.primary4Semibold12Manrope,
              ),
              SizedBox(height: 14.h),

              //NewPassword
              appTextFormField(
                context: context,
                hintText: getTranslation(
                  context,
                  'change_password.new_password',
                ),
                hintTextStyle: AppStyle.primary4Semibold12Manrope,
              ),
              SizedBox(height: 14.h),

              //ConfirmPassword
              appTextFormField(
                context: context,
                hintText: getTranslation(
                  context,
                  'change_password.confirm_new_password',
                ),
                hintTextStyle: AppStyle.primary4Semibold12Manrope,
              ),
              SizedBox(height: 40.h),

              //Confirm
              appButton(
                context: context,
                text: getTranslation(context, 'change_password.confirm'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
