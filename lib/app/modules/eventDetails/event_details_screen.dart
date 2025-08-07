import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/eventDetails/event_details_controller.dart';
import 'package:xticket/app/modules/eventDetails/widgets/widget_event_details.dart';
import 'package:xticket/app/modules/home/events_model.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';
import 'package:xticket/shared/widgets/app_button.dart';
import 'package:xticket/shared/widgets/app_divider.dart';
import 'package:xticket/shared/widgets/app_image_network.dart';
import 'package:xticket/shared/widgets/app_rating_bar.dart';
import 'package:xticket/shared/widgets/skeletonizer_container.dart';

import '../../../routes/app_routes.dart';

class EventDetailsScreen extends StatelessWidget {
  final EventDetails data;
  const EventDetailsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<EventDetailsController>(
        init: EventDetailsController(),
        builder: (controller) {
          return SafeArea(
            child: SkeletonizerContainer(
              enabled: controller.isLoading,
              child: CustomScrollView(
                physics: ClampingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    scrolledUnderElevation: 0,
                    expandedHeight: 220.h,
                    leadingWidth: 50.w,
                    leading: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: SvgPicture.asset(
                          AppAssets.icBack,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                    ),

                    actions: [
                      Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: SvgPicture.asset(
                          AppAssets.icShare,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                    ],
                    pinned: true,
                    floating: false,
                    backgroundColor: AppColor.white,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        children: [
                          //Image
                          appImageNetwork(
                            height: 220.h,
                            url: data.images.first,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Image
                        SizedBox(height: 16.h),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Title
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //Icon
                                  Container(
                                    height: 50.h,
                                    width: 50.w,
                                    padding: EdgeInsets.all(9.w),
                                    decoration: BoxDecoration(
                                      color: AppColor.neutralColor09,
                                      shape: BoxShape.circle,
                                    ),
                                    child: appImageNetwork(
                                      height: 28.h,
                                      width: 32.w,
                                      url: data.orgenagerLogo,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),

                                  //Title
                                  Expanded(
                                    child: Text(
                                      data.title,
                                      style: AppStyle.black14BoldLato,
                                    ),
                                  ),
                                  SizedBox(width: 50.w),
                                  //Like
                                  SvgPicture.asset(
                                    AppAssets.icLike,
                                    height: 24.h,
                                    width: 24.w,
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.h),

                              //RattingBar
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AppRatingBar.builder(
                                    onRatingUpdate: (value) {},
                                    unratedWidget: SvgPicture.asset(
                                      AppAssets.icUnfilledStar,
                                      height: 24.h,
                                      width: 24.w,
                                    ),
                                    itemSize: 24.w,
                                    ignoreGestures: true,
                                    itemCount: 5,
                                    initialRating: data.rating,
                                    itemBuilder: (context, index) {
                                      return SvgPicture.asset(
                                        AppAssets.icFilledStar,
                                        height: 24.h,
                                        width: 24.w,
                                      );
                                    },
                                  ),
                                  Text(
                                    '(${data.rating.toInt()})',
                                    style: AppStyle.yellowMedium12Lato,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),

                              //About
                              Text(
                                getTranslation(context, 'event_details.about'),
                                style: AppStyle.blackSemiBold18Lato,
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                data.about,
                                style: AppStyle.neutral4Reguler14Lato,
                              ),
                              SizedBox(height: 16.h),

                              //Category
                              Text(
                                getTranslation(
                                  context,
                                  'event_details.category',
                                ),
                                style: AppStyle.blackSemiBold18Lato,
                              ),
                              SizedBox(height: 14.h),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.neutralColor08,
                                  borderRadius: BorderRadius.circular(100.r),
                                ),
                                child: Text(
                                  data.category,
                                  style: AppStyle.darkReguler12Lato,
                                ),
                              ),
                              SizedBox(height: 20.h),
                            ],
                          ),
                        ),

                        //divider
                        appDivider(
                          borderHeight: 1.h,
                          dividerColor: AppColor.neutralColor08,
                        ),
                        SizedBox(height: 16.h),

                        //Calender
                        eventDetails(
                          icon: AppAssets.icCalender,
                          value: data.date,
                        ),
                        SizedBox(height: 12.h),

                        //Clock
                        eventDetails(icon: AppAssets.icClock, value: data.time),
                        SizedBox(height: 12.h),

                        //Ticket
                        eventDetails(
                          icon: AppAssets.icTicket,
                          value: data.price,
                        ),
                        SizedBox(height: 12.h),

                        //Whatsapp
                        eventDetails(
                          icon: AppAssets.icWhatsapp,
                          value: data.whatsapp,
                        ),
                        SizedBox(height: 12.h),

                        //Call
                        eventDetails(icon: AppAssets.icCall, value: data.phone),
                        SizedBox(height: 12.h),

                        //Mail
                        eventDetails(icon: AppAssets.icMail, value: data.email),
                        SizedBox(height: 12.h),

                        //Location
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: eventDetails(
                                icon: AppAssets.icLocation,
                                value: data.location,
                              ),
                            ),

                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () => Get.toNamed(AppRoutes.map),
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(right: 16.w),
                                padding: EdgeInsets.symmetric(
                                  vertical: 3.h,
                                  horizontal: 13.w,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.r),
                                  border: Border.all(
                                    color: AppColor.primaryColor04,
                                    width: 1.w,
                                  ),
                                ),
                                child: Text(
                                  getTranslation(
                                    context,
                                    'event_details.go_to_map',
                                  ),
                                  style: AppStyle.primary4Medium12Lato,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),

                        //divider
                        appDivider(
                          borderHeight: 1.h,
                          dividerColor: AppColor.neutralColor08,
                        ),
                        SizedBox(height: 20.h),

                        //findUs
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            getTranslation(context, 'event_details.find_us'),
                            style: AppStyle.blackSemiBold18Lato,
                          ),
                        ),
                        SizedBox(height: 11.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppAssets.icFacebookGreen,
                                height: 26.h,
                                width: 26.w,
                              ),
                              SizedBox(width: 10.w),

                              SvgPicture.asset(
                                AppAssets.icYoutube,
                                height: 24.h,
                                width: 35.w,
                              ),
                              SizedBox(width: 10.w),
                              SvgPicture.asset(
                                AppAssets.icLinkedIn,
                                height: 24.h,
                                width: 24.w,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 18.h),

                        //divider
                        appDivider(
                          borderHeight: 1.h,
                          dividerColor: AppColor.neutralColor08,
                        ),
                        SizedBox(height: 12.h),

                        //images
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            getTranslation(context, 'event_details.images'),
                            style: AppStyle.blackSemiBold18Lato,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: SizedBox(
                            height: 65.h,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: data.images.length,
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 8.w),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.r),
                                    child: appImageNetwork(
                                      height: 65.h,
                                      width: 110.w,
                                      url: data.images[index],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 42.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 18.3,
              spreadRadius: 0,
              offset: Offset(0, -2),
              color: AppColor.black.withValues(alpha: 0.10),
            ),
          ],
        ),
        padding: EdgeInsets.only(
          right: 16.w,
          left: 16.w,
          top: 11.h,
          bottom: 30.h,
        ),
        child: appButton(
          context: context,
          text: getTranslation(context, 'event_details.book_now'),
          onPressed: () {
            Get.toNamed(AppRoutes.chooseSeat);
          },
        ),
      ),
    );
  }
}
