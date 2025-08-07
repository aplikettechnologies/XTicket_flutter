import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/auth/forgetPassword/forget_password_controller.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_style.dart';
import '../../../../shared/utils/app_color.dart';
import '../../../../shared/utils/app_validator.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_textformfield.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
      init: ForgetPasswordController(),
      builder: (controller) {
        return Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUnfocus,
          child: Scaffold(
            appBar: AppBar(
              leadingWidth: 50.w,
              backgroundColor: AppColor.white,
              leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: SvgPicture.asset(
                    AppAssets.icBack,
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
              ),
            ),
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.h),
                      //Icon
                      Container(
                        height: 80.h,
                        width: 80.w,
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor10,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          height: 80.h,
                          width: 80.w,
                          padding: EdgeInsets.all(20.w),
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor04,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            AppAssets.icPassword,
                            height: 20.h,
                            width: 15.w,
                            colorFilter: ColorFilter.mode(
                              AppColor.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),

                      //ForgetPassword
                      Text(
                        getTranslation(
                          context,
                          'forget_password.forget_password',
                        ),
                        style: AppStyle.primary1Semibold20Manrope,
                      ),
                      SizedBox(height: 14.h),

                      //EnterTheEmailAssociated
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.w),
                        child: Text(
                          getTranslation(
                            context,
                            'forget_password.enter_the_email_associated',
                          ),
                          textAlign: TextAlign.center,
                          style: AppStyle.neutral5Medium14Manrope.copyWith(
                            color: AppColor.neutralColor04,
                          ),
                        ),
                      ),

                      SizedBox(height: 30.h),
                      //Email
                      appTextFormField(
                        context: context,
                        onChanged: (value) {
                          controller.formKey.currentState!.validate();
                        },
                        textCapitalization: TextCapitalization.none,
                        textInputType: TextInputType.emailAddress,
                        validator:
                            (value) => AppValidator.isValidEmail(
                              value: value,
                              context: context,
                            ),
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
                          'forget_password.email',
                        ),
                        headerText: getTranslation(
                          context,
                          'forget_password.email',
                        ),
                      ),
                      SizedBox(height: 24.h),

                      //SendEmail
                      appButton(
                        context: context,
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            Get.back();
                          }
                          // AppToast.showSuccess(
                          //   subTitle: 'Invalid email or password',
                          //   title: 'Please input correct email or password',
                          //   context: context,
                          // );
                        },
                        text: getTranslation(
                          context,
                          'forget_password.send_email',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
