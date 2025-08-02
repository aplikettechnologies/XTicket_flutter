import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';
import 'package:xticket/shared/widgets/app_divider.dart';

import '../../../shared/widgets/app_svg_iconbutton.dart';
import '../../../shared/widgets/app_textformfield.dart';

Widget eventPaymentBottomSheetWidget({required BuildContext context}) {
  return Stack(
    alignment: Alignment.topRight,
    children: [
      Container(
        padding: EdgeInsets.all(16.sp),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14.r),
            topRight: Radius.circular(14.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                getTranslation(context, "payment_bottomsheet.event_payment"),
                style: AppStyle.blackExtraBold20Lato,
              ),
            ),
            SizedBox(height: 32.h),
            appTextFormField(
              context: context,
              hintText: getTranslation(context, 'login.password'),
            ),
            SizedBox(height: 14.h),
            paymentDetailsListTile(
              context: context,
              title: getTranslation(
                context,
                "payment_bottomsheet.number_of_tickets",
              ),
              value: "2",
            ),

            paymentDetailsListTile(
              context: context,
              title: getTranslation(context, "payment_bottomsheet.ticket_type"),
              value: "Standard",
            ),
            paymentDetailsListTile(
              context: context,
              title: getTranslation(
                context,
                "payment_bottomsheet.ticket_price",
              ),
              value: "300.00 SAR",
            ),
            SizedBox(height: 8.h),
            appDivider(borderHeight: 1.h, dividerColor: AppColor.grey1),
            SizedBox(height: 16.h),

            paymentDetailsListTile(
              context: context,
              title: getTranslation(
                context,
                "payment_bottomsheet.ticket_price",
              ),
              value: "600.00 SAR",
              style: AppStyle.primaryColor04ExtraBold14Lato,
            ),
            SizedBox(height: 24.h),
            paymentButtonWidget(context: context, onTap: () {}),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: svgIconButton(
          iconPath: AppAssets.icClose,
          size: 30,
          onPressed: () {
            Get.back();
          },
          padding: EdgeInsets.all(5.sp),
        ),
      ),
    ],
  );
}

Widget paymentButtonWidget({
  required BuildContext context,
  void Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColor.primaryColor04,
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.icVisa,
            height: 15.h,
            width: 24.w,
            fit: BoxFit.cover,
          ),

          Container(
            height: 24.h,
            width: 1.w,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            color: AppColor.white,
          ),
          Text(
            getTranslation(context, "payment_bottomsheet.complete_payment"),
            style: AppStyle.whiteMedium14Lato,
          ),
        ],
      ),
    ),
  );
}

Widget paymentDetailsListTile({
  required BuildContext context,
  required String title,
  required String value,
  TextStyle? style,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: AppStyle.darkMedium14Lato),
        Text(
          value,
          style: style ?? AppStyle.blackMedium12Lato.copyWith(fontSize: 14.sp),
        ),
      ],
    ),
  );
}
