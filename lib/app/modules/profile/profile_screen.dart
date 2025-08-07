import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:xticket/app/modules/profile/profile_controller.dart';
import 'package:xticket/shared/dialogs/dialog_select_photo.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_configration.dart';
import 'package:xticket/shared/utils/app_helper.dart';
import 'package:xticket/shared/utils/app_style.dart';
import 'package:xticket/shared/widgets/app_button.dart';
import 'package:xticket/shared/widgets/app_select_date.dart';
import 'package:xticket/shared/widgets/app_toast.dart';

import '../../../shared/localization/localization_const.dart';
import '../../../shared/utils/app_assets.dart';
import '../../../shared/utils/app_dropdown.dart';
import '../../../shared/utils/app_validator.dart';
import '../../../shared/widgets/app_image_network.dart';
import '../../../shared/widgets/app_svg_iconbutton.dart';
import '../../../shared/widgets/app_textformfield.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Form(
                key: controller.formKey,
                autovalidateMode: AutovalidateMode.onUnfocus,
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    vertical: 26.h,
                    horizontal: 16.w,
                  ),
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
                                  child: ClipOval(
                                    child: appImageNetwork(
                                      width: 80.r,
                                      height: 80.r,
                                      fit: BoxFit.cover,
                                      url:
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQyawVbjORfalGKAFdWZyJbg8cH12xX-MlLw&s",
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
                                    AppHelper().showAppDialog(
                                      context: context,
                                      dialogWidget: dialogSelectPhoto(
                                        context: context,
                                        cameraTap: () {},
                                        gallaryTap: () {},
                                      ),
                                    );
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
                        textEditingController: controller.nameTextController,
                        context: context,
                        textCapitalization: TextCapitalization.words,
                        validator:
                            (value) => AppValidator.isFieldEmptyValidation(
                              value: value,
                              title: getTranslation(
                                context,
                                'profile.full_name',
                              ),
                              context: context,
                            ),

                        hintText: getTranslation(context, 'profile.full_name'),
                        headerText: getTranslation(
                          context,
                          'profile.full_name',
                        ),
                      ),
                      SizedBox(height: 12.h),
                      appTextFormField(
                        textEditingController: controller.phoneNoTextController,
                        maxLength: AppConfigration.mobileNumberLimit,
                        validator:
                            (value) => AppValidator.isValidPhone(
                              value: value,
                              context: context,
                            ),
                        textCapitalization: TextCapitalization.none,
                        textInputType: TextInputType.number,
                        context: context,
                        hintText: getTranslation(
                          context,
                          'profile.phone_number',
                        ),
                        headerText: getTranslation(
                          context,
                          'profile.phone_number',
                        ),
                      ),
                      SizedBox(height: 12.h),

                      Text(
                        getTranslation(context, 'profile.city'),
                        style: AppStyle.headerTextStyle,
                      ),
                      SizedBox(height: 8.h),

                      appDropdown(
                        hintText: getTranslation(context, 'profile.city'),
                        onChanged: (value) {
                          controller.updateCity(value.toString());
                        },
                        selectedValue: controller.selectCity,
                        items: [
                          'Dammam',
                          'Riyadh',
                          'Mecca',
                          'Jeddah',
                          'Buraydah',
                          'Madina',
                          'Al Bahah',
                          'Al Kharj',
                          'Tubuk',
                          'Al-Hasa',
                          'Jawf',
                        ],
                        customButton: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.neutralColor08,
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  controller.selectCity ??
                                      getTranslation(context, 'profile.city'),
                                  style: AppStyle.neutral4Reguler14Lato
                                      .copyWith(color: AppColor.neutralColor05),
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

                      SizedBox(height: 12.h),

                      Text(
                        getTranslation(context, 'profile.nationality'),
                        style: AppStyle.headerTextStyle,
                      ),
                      SizedBox(height: 8.h),

                      appDropdown(
                        hintText: getTranslation(
                          context,
                          'profile.nationality',
                        ),
                        onChanged: (value) {
                          controller.updateNationality(value.toString());
                        },
                        selectedValue: controller.selectNationality,
                        items: [
                          'Afghan',
                          'Albanian',
                          'Algerian',
                          'American',
                          'Argentinian',
                          'Armenian',
                          'Australian',
                          'Austrian',
                          'Bangladeshi',
                          'Belgian',
                          'Brazilian',
                          'British',
                          'Bulgarian',
                          'Cambodian',
                          'Canadian',
                          'Chilean',
                        ],
                        customButton: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.neutralColor08,
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  controller.selectNationality ??
                                      getTranslation(
                                        context,
                                        'profile.nationality',
                                      ),
                                  style: AppStyle.neutral4Reguler14Lato
                                      .copyWith(color: AppColor.neutralColor05),
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

                      SizedBox(height: 12.h),
                      Text(
                        getTranslation(context, 'profile.date_of_birth'),
                        style: AppStyle.headerTextStyle,
                      ),
                      SizedBox(height: 8.h),
                      appSelectDate(
                        context: context,
                        title: getTranslation(context, 'profile.date_of_birth'),
                        onDatePicked: (date) {
                          if (date != null) {
                            controller.selectBirthDay = DateFormat(
                              'dd-MMM-yyyy',
                            ).format(date);
                            controller.update();
                          }
                        },
                        customButton: Container(
                          width: double.infinity,
                          height: 45.h,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                            top: 8.h,
                            bottom: 8.h,
                            left: 14.w,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.neutralColor08,
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  controller.selectBirthDay ??
                                      getTranslation(
                                        context,
                                        'profile.date_of_birth',
                                      ),
                                  style: AppStyle.neutral4Reguler14Lato
                                      .copyWith(color: AppColor.neutralColor05),
                                ),
                              ),
                              SvgPicture.asset(
                                AppAssets.icCalendar,
                                height: 24.h,
                                width: 24.w,
                              ),
                              SizedBox(width: 8.w),

                              SizedBox(width: 5.w),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 12.h),

                      Text(
                        getTranslation(context, 'profile.gender'),
                        style: AppStyle.headerTextStyle,
                      ),
                      SizedBox(height: 8.h),

                      appDropdown(
                        hintText: getTranslation(context, 'profile.gender'),
                        onChanged: (value) {
                          controller.updateGender(value.toString());
                        },

                        selectedValue: controller.selectGender,
                        items: ['Male', 'Female', 'Other'],
                        customButton: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.neutralColor08,
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  controller.selectGender ??
                                      getTranslation(context, 'profile.gender'),
                                  style: AppStyle.neutral4Reguler14Lato
                                      .copyWith(color: AppColor.neutralColor05),
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
                    ],
                  ),
                ),
              ),
            ),

            //EditProfile
            Container(
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
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    if (controller.selectCity != null) {
                      if (controller.selectNationality != null) {
                        if (controller.selectBirthDay != null) {
                          if (controller.selectGender != null) {
                            Get.back();
                          } else {
                            AppToast.showSuccess(
                              title: getTranslation(
                                context,
                                'app_validation.error',
                              ),
                              subTitle: getTranslation(
                                context,
                                'app_validation.please_select_gender',
                              ),
                              context: context,
                            );
                          }
                        } else {
                          AppToast.showSuccess(
                            title: getTranslation(
                              context,
                              'app_validation.error',
                            ),
                            subTitle: getTranslation(
                              context,
                              'app_validation.please_select_dob',
                            ),
                            context: context,
                          );
                        }
                      } else {
                        AppToast.showSuccess(
                          title: getTranslation(
                            context,
                            'app_validation.error',
                          ),
                          subTitle: getTranslation(
                            context,
                            'app_validation.please_select_nationality',
                          ),
                          context: context,
                        );
                      }
                    } else {
                      AppToast.showSuccess(
                        title: getTranslation(context, 'app_validation.error'),
                        subTitle: getTranslation(
                          context,
                          'app_validation.please_select_city',
                        ),
                        context: context,
                      );
                    }
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
