import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/chooseSeat/choose_seat_controller.dart';
import 'package:xticket/app/modules/chooseSeat/seat_layout_widget.dart';
import 'package:xticket/app/modules/eventPayment/event_payment_bottomsheet_widget.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';
import 'package:xticket/shared/widgets/app_button.dart';
import 'package:xticket/shared/widgets/app_divider.dart';
import '../../../shared/localization/localization_const.dart';
import '../../../shared/widgets/app_appbar.dart';
import '../../../shared/widgets/app_image_network.dart';

class ChooseSeatScreen extends StatelessWidget {
  const ChooseSeatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppbar(
        title: getTranslation(context, 'choose_seat.choose_seat_text'),
      ),
      body: GetBuilder<ChooseSeatController>(
        init: ChooseSeatController(),
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 26.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50.h,
                      width: 50.w,
                      padding: EdgeInsets.all(9.w),
                      decoration: BoxDecoration(
                        color: AppColor.neutralColor09,
                        shape: BoxShape.circle,
                      ),
                      child: appImageNetwork(
                        fit: BoxFit.cover,
                        height: 48.h,
                        width: 48.w,
                        url:
                            "https://e7.pngegg.com/pngimages/1018/673/png-clipart-small-fresh-wedding-logo-creative-wedding-bride-and-groom.png",
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Summer Splash A Seasonal Celebration",
                          style: AppStyle.dark14ExtraBoldLato,
                        ),

                        SizedBox(height: 5.h),
                        Text(
                          "18 Jun 2024 | 09:00 AM",
                          style: AppStyle.neutral4Reguler14Lato.copyWith(
                            color: AppColor.navigationSelectedColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.h, bottom: 37.h),
                  child: appDivider(
                    borderHeight: 1.h,
                    dividerColor: AppColor.grey1,
                  ),
                ),
                Container(height: 20.h, color: AppColor.primaryColor04),
                SizedBox(height: 5.h),
                Center(
                  child: Text(
                    getTranslation(context, "choose_seat.screen"),
                    style: AppStyle.neutral3Reguler12Lato.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 26.h),
                SeatLayout(
                  totalSeats: 165,
                  rows: 15,
                  columns: 11,
                  seatSize: 12.sp,
                  selectedSeats: controller.selectedSeats,
                  reservedSeats: controller.reservedSeats,
                  onSeatTap: (seat) => controller.toggleSeatSelection(seat),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h, bottom: 8.h),
                  child: appDivider(
                    borderHeight: 1.h,
                    dividerColor: AppColor.grey1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      seatHintWidget(
                        color: AppColor.grey1,
                        hintTitle: "Available",
                      ),
                      SizedBox(width: 28.w),
                      seatHintWidget(
                        color: AppColor.lightYellow1,
                        hintTitle: "Selected",
                      ),
                      SizedBox(width: 28.w),
                      seatHintWidget(
                        color: AppColor.primaryColor04,
                        hintTitle: "Chosen",
                      ),
                      SizedBox(width: 28.w),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                appDivider(borderHeight: 1.h, dividerColor: AppColor.grey1),
                SizedBox(height: 36.h),
                appButton(
                  context: context,
                  text: getTranslation(
                    context,
                    "choose_seat.continue_to_payment",
                  ),
                  onPressed: () {
                    Get.bottomSheet(
                      eventPaymentBottomSheetWidget(context: context),
                      isScrollControlled: true,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget seatHintWidget({required Color color, required String hintTitle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 16.h,
          width: 16.w,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 8.w),
        Text(
          hintTitle,
          style: AppStyle.darkReguler12Lato.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
