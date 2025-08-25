import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import '../../../../shared/flutter_stripe_payment/stripe_payment_services.dart';

enum PaymentMethods { applePay, googlePay, visa }

class PaymentMethodsController extends GetxController {
  // Rx variable to hold the selected method
  var selectedMethod = Rxn<PaymentMethods>(PaymentMethods.visa);
  RxBool isLoading = false.obs;

  // Function to select a payment method
  void selectMethod(PaymentMethods method) {
    selectedMethod.value = method;
    isLoading.value = false;
    update(); // update UI for GetBuilder
  }

  // Make Visa Payment

  Future<PaymentStatus> makeVisaPayment({required String amount}) async {
    try {
      // Show loader
      isLoading.value = true;
      update();

      PaymentStatus paymentStatus = await StripePaymentServices.makePayment(
        amount: amount,
        currency: "USD",
        secretKey: dotenv.env['STRIPE_SECRET_KEY'] ?? '',
        merchantDisplayName: "Ikay",
      );

      return paymentStatus;
    } catch (e, s) {
      log("🔥 Exception in makeVisaPayment: $e", stackTrace: s);
      isLoading.value = false;
      update();

      return PaymentStatus.Failure;
    } finally {
      // Always hide loader if still active
      if (isLoading.value == true) {
        isLoading.value = false;
        update();
      }
    }
  }

  // Google Pay Payment
  Future<void> googlePayPayment() async {
    isLoading.value = true;
    update();
    PaymentStatus paymentStatus =
        await StripePaymentServices.makePaymentGooglePay(amount: 1000);
    if (PaymentStatus.Success == paymentStatus) {
      await Future.delayed(const Duration(milliseconds: 300));
    }
    isLoading.value = false;
    update();
  }

  // Apple Pay Payment
  Future<void> applePayPayment() async {
    isLoading.value = true;
    update();
    PaymentStatus paymentStatus =
        await StripePaymentServices.makePaymentApplePay(amount: "200");
    if (PaymentStatus.Success == paymentStatus) {
      await Future.delayed(const Duration(milliseconds: 300));
    }

    isLoading.value = false;
    update();
  }

  Future<void> handlePayment() async {
    if (selectedMethod.value == PaymentMethods.visa) {
      await makeVisaPayment(amount: '10000');
    } else if (selectedMethod.value == PaymentMethods.googlePay) {
      await googlePayPayment();
    } else if (selectedMethod.value == PaymentMethods.applePay) {
      await applePayPayment();
    }
  }
}
