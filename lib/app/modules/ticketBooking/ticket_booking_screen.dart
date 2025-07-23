import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:xticket/app/modules/ticketBooking/ticket_booking_controller.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';
import 'package:xticket/shared/widgets/app_appbar.dart';
import 'package:xticket/shared/widgets/app_button.dart';
import 'package:xticket/shared/widgets/app_divider.dart';
import 'package:xticket/shared/widgets/app_textformfield.dart';

import '../../../shared/utils/app_assets.dart';

class TicketBookingScreen extends StatelessWidget {
  const TicketBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TicketBookingController>(
      init: TicketBookingController(),
      builder: (controller) {
        return Scaffold(
          appBar: appAppbar(
            title: getTranslation(context, 'ticket_booking.ticket_booking'),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),

                    //EnterYourInfo
                    Text(
                      getTranslation(context, 'ticket_booking.enter_your_info'),
                      style: AppStyle.darkSemibold18Lato,
                    ),
                    SizedBox(height: 24.h),

                    //FullName
                    appTextFormField(
                      context: context,
                      headerText: getTranslation(
                        context,
                        'ticket_booking.full_name',
                      ),
                      hintText: getTranslation(
                        context,
                        'ticket_booking.enter_your_name',
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 14.w, top: 2.h),
                        child: SvgPicture.asset(
                          AppAssets.icUser,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                    ),
                    SizedBox(height: 14.h),

                    //Email
                    appTextFormField(
                      context: context,
                      headerText: getTranslation(
                        context,
                        'ticket_booking.email_address',
                      ),
                      hintText: getTranslation(
                        context,
                        'ticket_booking.enter_your_email',
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 14.w, top: 2.h),
                        child: SvgPicture.asset(
                          AppAssets.icMail,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                    ),
                    SizedBox(height: 14.h),

                    //numberOfTicket
                    appTextFormField(
                      context: context,
                      headerText: getTranslation(
                        context,
                        'ticket_booking.number_of_tickets',
                      ),
                      hintText: getTranslation(
                        context,
                        'ticket_booking.number_of_tickets',
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 14.w, top: 2.h),
                        child: SvgPicture.asset(
                          AppAssets.icTicket,
                          height: 24.h,
                          colorFilter: ColorFilter.mode(
                            AppColor.black,
                            BlendMode.srcIn,
                          ),
                          width: 24.w,
                        ),
                      ),
                    ),
                    SizedBox(height: 14.h),
                    SizedBox(height: 40.h),
                    //PaymentDetails
                    Text(
                      getTranslation(context, 'ticket_booking.payment_details'),
                      style: AppStyle.darkSemibold18Lato.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    appDivider(dividerColor: AppColor.neutralColor05),
                    SizedBox(height: 12.h),

                    //ListofTicket
                    ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  '${getTranslation(context, 'ticket_booking.ticket')} ${index + 1}',
                                  style: AppStyle.darkMedium14Lato,
                                ),
                              ),
                              Text(
                                '300.00 ${getTranslation(context, 'ticket_booking.sar')}',
                                style: AppStyle.blackExtrabold18Lato,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 4.h),
                    appDivider(dividerColor: AppColor.neutralColor05),
                    SizedBox(height: 12.h),

                    //Total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            getTranslation(context, 'ticket_booking.total'),
                            style: AppStyle.darkMedium14Lato,
                          ),
                        ),
                        Text(
                          '600.00 ${getTranslation(context, 'ticket_booking.sar')}',
                          style: AppStyle.blackExtrabold18Lato,
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),

                    //Continue
                    appButton(
                      context: context,
                      text: getTranslation(context, 'ticket_booking.continue'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
