import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xticket/routes/app_routes.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_style.dart';

import '../../../../shared/utils/app_color.dart';
import '../create_event_controller.dart';

Widget confirmTab({required BuildContext context}) {
  CreateEventController controller = Get.put(CreateEventController());
  return SingleChildScrollView(
    physics: ClampingScrollPhysics(),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),

          //General
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.grey4,
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.only(
              top: 12.h,
              left: 12.w,
              right: 29.w,
              bottom: 24.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getTranslation(context, 'create_event.general'),
                  style: AppStyle.blackSemibold20Manrope,
                ),
                SizedBox(height: 12.h),
                //ImageUploaded
                Padding(
                  padding: EdgeInsets.only(left: 28.w - 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.icPhoto,
                        height: 24.h,
                        width: 24.w,
                      ),
                      SizedBox(width: 8.w),

                      Text(
                        getTranslation(context, 'create_event.image_uploaded'),
                        style: AppStyle.primary4Medium14Manrope,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),

                //ProfileUpdated
                Padding(
                  padding: EdgeInsets.only(left: 28.w - 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.icPhoto,
                        height: 24.h,
                        width: 24.w,
                      ),
                      SizedBox(width: 8.w),

                      Text(
                        getTranslation(context, 'create_event.profile_updated'),
                        style: AppStyle.primary4Medium14Manrope,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),

                //Title
                Padding(
                  padding: EdgeInsets.only(left: 28.w - 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppAssets.icErrorGreen,
                        height: 24.h,
                        width: 24.w,
                      ),
                      SizedBox(width: 8.w),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getTranslation(context, 'create_event.title'),
                            style: AppStyle.primary4Medium14Manrope,
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            controller.eventTitleTextController.text.toString(),
                            style: AppStyle.neutral4Regular12Manrope,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),

                //Description
                Padding(
                  padding: EdgeInsets.only(left: 28.w - 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppAssets.icErrorGreen,
                        height: 24.h,
                        width: 24.w,
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getTranslation(context, 'create_event.description'),
                            style: AppStyle.primary4Medium14Manrope,
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            controller.eventDescriptionTextController.text
                                .toString(),
                            style: AppStyle.neutral4Regular12Manrope,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          //Location
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.grey4,
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.only(
              top: 12.h,
              left: 12.w,
              right: 29.w,
              bottom: 24.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getTranslation(context, 'create_event.location'),
                  style: AppStyle.blackSemibold20Manrope,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28.w - 12.w, top: 12.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.icLocation,
                        height: 24.h,
                        width: 24.w,
                        colorFilter: ColorFilter.mode(
                          AppColor.primaryColor04,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 8.w),

                      Text(
                        controller.selectLocationTextController.text.toString(),
                        style: AppStyle.primary4Medium14Manrope,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          //Details
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.grey4,
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.only(
              top: 12.h,
              left: 12.w,
              right: 29.w,
              bottom: 24.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getTranslation(context, 'create_event.details'),
                  style: AppStyle.blackSemibold20Manrope,
                ),
                SizedBox(height: 12.h),

                //Mail
                Padding(
                  padding: EdgeInsets.only(left: 28.w - 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.icMail,
                        height: 24.h,
                        width: 24.w,
                        colorFilter: ColorFilter.mode(
                          AppColor.primaryColor04,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 5.w),

                      Text(
                        controller.emailTextController.text.toString(),
                        style: AppStyle.primary4Medium14Manrope,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),

                //Call
                Padding(
                  padding: EdgeInsets.only(left: 28.w - 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.icCall,
                        height: 24.h,
                        width: 24.w,
                        colorFilter: ColorFilter.mode(
                          AppColor.primaryColor04,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 5.w),

                      Text(
                        controller.contactNoTextController.text.toString(),
                        style: AppStyle.primary4Medium14Manrope,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),

                //whatsapp
                if (controller.wpNoTextController.text.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(left: 28.w - 12.w, bottom: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppAssets.icWhatsapp,
                          height: 20.h,
                          width: 20.w,
                          colorFilter: ColorFilter.mode(
                            AppColor.primaryColor04,
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(width: 8.w),

                        Text(
                          controller.wpNoTextController.text.toString(),
                          style: AppStyle.primary4Medium14Manrope,
                        ),
                      ],
                    ),
                  ),

                //price
                Padding(
                  padding: EdgeInsets.only(left: 28.w - 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppAssets.icTicket,
                        height: 20.h,
                        width: 20.w,
                        colorFilter: ColorFilter.mode(
                          AppColor.primaryColor04,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 8.w),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getTranslation(context, 'create_event.price'),
                            style: AppStyle.primary4Medium14Manrope,
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '0.0 SAR - 300.00 SAR',
                            style: AppStyle.neutral4Regular12Manrope,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),

                //dateTime
                Padding(
                  padding: EdgeInsets.only(left: 28.w - 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppAssets.icClock,
                        height: 20.h,
                        width: 20.w,
                        colorFilter: ColorFilter.mode(
                          AppColor.primaryColor04,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getTranslation(context, 'create_event.date_time'),
                            style: AppStyle.primary4Medium14Manrope,
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '${getTranslation(context, 'create_event.start_time')}: 26/05/2024  ${controller.selectStartTime}',
                            style: AppStyle.neutral4Regular12Manrope,
                          ),
                          Text(
                            '${getTranslation(context, 'create_event.end_time')}: 26/05/2024 ${controller.selectEndTime}',
                            style: AppStyle.neutral4Regular12Manrope,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),

                //SocialLinks
                Padding(
                  padding: EdgeInsets.only(left: 28.w - 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppAssets.icLocation,
                        height: 24.h,
                        width: 24.w,
                        colorFilter: ColorFilter.mode(
                          AppColor.primaryColor04,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 8.w),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getTranslation(
                              context,
                              'create_event.social_links',
                            ),
                            style: AppStyle.primary4Medium14Manrope,
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                AppAssets.icFacebookGreen,
                                height: 17.h,
                                width: 17.w,
                              ),
                              SizedBox(width: 10.w),
                              SvgPicture.asset(
                                AppAssets.icYoutube,
                                height: 17.h,
                                width: 17.w,
                              ),
                              SizedBox(width: 10.w),
                              SvgPicture.asset(
                                AppAssets.icLinkedIn,

                                height: 17.h,
                                width: 17.w,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          //Confirm
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.grey4,
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.only(
              top: 12.h,
              left: 12.w,
              right: 29.w,
              bottom: 24.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getTranslation(context, 'create_event.confirm'),
                  style: AppStyle.blackSemibold20Manrope,
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.only(left: 28.w - 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.icCheckBroken,
                        height: 24.h,
                        width: 24.w,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        getTranslation(context, 'create_event.confirm'),
                        style: AppStyle.primary1Bold14Manrope.copyWith(
                          color: AppColor.primaryColor04,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Previous
              Expanded(
                child: InkWell(
                  onTap: () {
                    if (controller.tabController.index > 0) {
                      controller.tabController.animateTo(
                        controller.tabController.index - 1,
                      );
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40.h,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      border: Border.all(color: AppColor.primaryColor04),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppAssets.icLeftArrow,
                          height: 18.h,
                          width: 18.w,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          getTranslation(context, 'create_event.previous'),
                          style: AppStyle.primary4Medium14Manrope.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 26.w),
              //Confirm
              Expanded(
                child: InkWell(
                  onTap: () {
                    Get.offAllNamed(AppRoutes.dashboard);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40.h,
                    padding: EdgeInsets.symmetric(vertical: 10.h),

                    decoration: BoxDecoration(
                      color: AppColor.primaryColor04,
                      borderRadius: BorderRadius.circular(100.r),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          getTranslation(context, 'create_event.confirm'),
                          style: AppStyle.primary4Medium14Manrope.copyWith(
                            fontSize: 12.sp,
                            color: AppColor.white,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        SvgPicture.asset(
                          AppAssets.icCheckBroken,
                          height: 18.h,
                          width: 18.w,
                          colorFilter: ColorFilter.mode(
                            AppColor.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
        ],
      ),
    ),
  );
}
