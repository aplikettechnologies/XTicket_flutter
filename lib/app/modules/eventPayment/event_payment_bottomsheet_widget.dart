import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/payment/controllers/payment_methods_controller.dart';
import 'package:xticket/app/modules/ticket/ticker_dialog_widget.dart';
import 'package:xticket/shared/flutter_stripe_payment/stripe_payment_services.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';
import 'package:xticket/shared/widgets/app_button.dart';
import 'package:xticket/shared/widgets/app_divider.dart';
import '../../../shared/utils/app_debounce_helper.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,

              children: [
                Expanded(
                  child: appTextFormField(
                    context: context,
                    hintText: getTranslation(
                      context,
                      "payment_bottomsheet.enter_discount_code",
                    ),
                  ),
                ),
                SizedBox(width: 6.w),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColor.primaryColor04,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ).copyWith(
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    splashFactory: NoSplash.splashFactory,
                  ),
                  onPressed: () {},
                  child: Text(
                    getTranslation(context, "payment_bottomsheet.apply"),
                    style: AppStyle.buttonTextStyle,
                  ),
                ),
              ],
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
            GetBuilder<PaymentMethodsController>(
              init: PaymentMethodsController(),
              builder: (controller) {
                return paymentButtonWidget(
                  context: context,
                  isLoading: controller.isLoading.value,
                  onTap: () async {
                    DebounceHelper.runDebounce(
                      tag: 'payment-proccessing',
                      milliseconds: 500,
                      action:
                          () async => await controller
                              .makeVisaPayment(amount: "10000")
                              .then((val) async {
                                if (!context.mounted) return;
                                Navigator.of(context).pop();
                                await Future.delayed(
                                  Duration(milliseconds: 400),
                                );
                                if (val == PaymentStatus.Success) {
                                  Get.dialog(
                                    Dialog(
                                      backgroundColor: Colors.transparent,
                                      insetPadding: const EdgeInsets.all(16),
                                      child: TicketPopupCard(),
                                    ),
                                    barrierDismissible: true,
                                  );
                                }
                              }),
                    );
                  },
                );
              },
            ),

            SizedBox(height: Platform.isIOS ? 30.h : 10.h),
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
  required bool isLoading,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 45.h,

      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColor.primaryColor04,
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn,
            ),
            child: child,
          );
        },
        child:
            isLoading
                ? loadingPleaseWaitWidget(
                  h: 15.h,
                  w: 15.w,
                  text: getTranslation(
                    context,
                    "choose_seat.payment_proccessing",
                  ),
                  buttonLoadingtextStyle: AppStyle.whiteMedium14Lato,
                )
                : Row(
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
                      getTranslation(
                        context,
                        "payment_bottomsheet.complete_payment",
                      ),
                      style: AppStyle.whiteMedium14Lato,
                    ),
                  ],
                ),
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
