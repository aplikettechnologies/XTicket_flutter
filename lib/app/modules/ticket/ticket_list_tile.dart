import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';

import '../../../shared/localization/localization_const.dart';
import 'ticker_dialog_widget.dart';

Widget iconTextRow({
  required String iconPath,
  required String value,
  required Color color,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SvgPicture.asset(
        iconPath,
        height: 24.h,
        width: 24.w,
        fit: BoxFit.contain,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
      SizedBox(width: 8.w),
      Text(value, style: AppStyle.neutral4Medium12Manrope),
    ],
  );
}

Widget ticketListTile({required BuildContext context}) {
  return InkWell(
    onTap: () {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(16.sp),
            child: TicketPopupCard(),
          );
        },
      );
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 12.9,
            spreadRadius: 0,
            offset: Offset.zero,
            color: AppColor.black.withValues(alpha: 0.15),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Summer Splash - Ladies", style: AppStyle.blackBold16Lato),
                SizedBox(height: 5.h),
                Text("Al Safa Park", style: AppStyle.neutral5Regular12Manrope),
                SizedBox(height: 5.h),
                iconTextRow(
                  iconPath: AppAssets.icCalendar,
                  value: "Mar 19, 2024 - Mar 21, 2024",
                  color: AppColor.neutralColor04,
                ),
                SizedBox(height: 5.h),
                iconTextRow(
                  iconPath: AppAssets.icClock,
                  value: "8:30 PM - 11:30 PM",
                  color: AppColor.neutralColor04,
                ),
                SizedBox(height: 8.h),
                iconTextRow(
                  iconPath: AppAssets.icValidRed,
                  value: getTranslation(context, 'ticket.valid'),
                  color: AppColor.navigationSelectedColor,
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            AppAssets.icDummyQrCode,
            height: 102.h,
            width: 102.w,
            fit: BoxFit.contain,
          ),
        ],
      ),
    ),
  );
}
