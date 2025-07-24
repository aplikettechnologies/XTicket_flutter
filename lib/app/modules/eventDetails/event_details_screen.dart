import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xticket/app/modules/eventDetails/widgets/widget_event_details.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';
import 'package:xticket/shared/widgets/app_button.dart';
import 'package:xticket/shared/widgets/app_divider.dart';
import 'package:xticket/shared/widgets/app_image_network.dart';
import 'package:xticket/shared/widgets/app_rating_bar.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image
              Stack(
                children: [
                  //Image
                  appImageNetwork(
                    height: 177.h,
                    url:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS92eisuWOx3tEjeW14mT9ACVgXDwIRBGtnww&s',
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 16.w,
                      left: 16.w,
                      top: 16.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Arrow
                        SvgPicture.asset(
                          AppAssets.icArrowLeft,
                          height: 24.h,
                          width: 24.w,
                        ),
                        //Share
                        SvgPicture.asset(
                          AppAssets.icShare,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
                            url:
                                'https://png.pngtree.com/png-clipart/20190611/original/pngtree-wolf-logo-png-image_2306634.jpg',
                          ),
                        ),
                        SizedBox(width: 8.w),

                        //Title
                        Expanded(
                          child: Text(
                            'Summer Splash A Seasonal Celebration',
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
                          initialRating: 3,
                          itemBuilder: (context, index) {
                            return SvgPicture.asset(
                              AppAssets.icFilledStar,
                              height: 24.h,
                              width: 24.w,
                            );
                          },
                        ),
                        Text('(3)', style: AppStyle.yellowMedium12Lato),
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
                      "Join us for the annual Summer Splash, the premier event of the season that brings together music, water games, and summer festivities. Celebrate the sunny days with live performances from top-tier bands and DJs, indulge in delicious summer treats, and participate in a variety of water activities. Whether you're looking to relax and soak up the sun or dance the night away, Summer Splash has something for everyone. It's not just an event; it's a summer tradition!",
                      style: AppStyle.neutral4Reguler14Lato,
                    ),
                    SizedBox(height: 16.h),

                    //Category
                    Text(
                      getTranslation(context, 'event_details.category'),
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
                      child: Text('Concert', style: AppStyle.darkReguler12Lato),
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
              eventDetails(icon: AppAssets.icCalender, value: '18 Jun 2024'),
              SizedBox(height: 12.h),

              //Clock
              eventDetails(icon: AppAssets.icClock, value: '09:00 AM'),
              SizedBox(height: 12.h),

              //Ticket
              eventDetails(icon: AppAssets.icTicket, value: 'From: 300.00 SAR'),
              SizedBox(height: 12.h),

              //Whatsapp
              eventDetails(icon: AppAssets.icWhatsapp, value: '012048355'),
              SizedBox(height: 12.h),

              //Call
              eventDetails(icon: AppAssets.icCall, value: '012048355'),
              SizedBox(height: 12.h),

              //Mail
              eventDetails(icon: AppAssets.icMail, value: 'summer@gmail.com'),
              SizedBox(height: 12.h),

              //Location
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: eventDetails(
                      icon: AppAssets.icLocation,
                      value: 'Al Safa Park, Jeddah, Saudi Arabia',
                    ),
                  ),
                  Container(
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
                      getTranslation(context, 'event_details.go_to_map'),
                      style: AppStyle.primary4Medium12Lato,
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
                    itemCount: 10,
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
                            url:
                                'https://media.istockphoto.com/id/939568002/photo/family-photo-portrait-four-relatives-are-hugging-on-the-white-background-smiling-at-home-blond.jpg?s=612x612&w=0&k=20&c=gSmK_r_XEs8l9D2WTjUp_Z-P3CrTYptAfp_XxewHltg=',
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
          onPressed: () {},
        ),
      ),
    );
  }
}
