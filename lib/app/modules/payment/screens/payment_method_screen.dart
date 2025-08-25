import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/payment/controllers/payment_methods_controller.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/widgets/app_appbar.dart';
import 'package:xticket/shared/widgets/app_button.dart';

import 'payment_method_widget.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppbar(title: "Payment Methods"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: GetBuilder<PaymentMethodsController>(
            init: PaymentMethodsController(),
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Visa first
                  paymentMethodWidget(
                    title: "Visa",
                    assetPath: AppAssets.icVisa,
                    h: 25.h,
                    w: 25.w,
                    radioValue:
                        controller.selectedMethod.value == PaymentMethods.visa,
                    onTap: () => controller.selectMethod(PaymentMethods.visa),
                  ),
                  SizedBox(height: 14.h),

                  // Google Pay second
                  paymentMethodWidget(
                    title: "Google Pay",
                    assetPath: AppAssets.icGooglePay,
                    radioValue:
                        controller.selectedMethod.value ==
                        PaymentMethods.googlePay,
                    onTap:
                        () => controller.selectMethod(PaymentMethods.googlePay),
                  ),
                  SizedBox(height: 14.h),

                  // Apple Pay last
                  Visibility(
                    visible: Platform.isIOS,
                    child: paymentMethodWidget(
                      title: "Apple Pay",
                      assetPath: AppAssets.icApplePay,
                      radioValue:
                          controller.selectedMethod.value ==
                          PaymentMethods.applePay,
                      onTap:
                          () =>
                              controller.selectMethod(PaymentMethods.applePay),
                    ),
                  ),
                  Spacer(),

                  appButton(
                    context: context,
                    text: "Continue payment",
                    isLoading: controller.isLoading.value,
                    onPressed: () async => controller.handlePayment(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
