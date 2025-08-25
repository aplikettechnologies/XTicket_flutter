// ignore_for_file: depend_on_referenced_packages, constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:xticket/shared/utils/app_color.dart';

enum PaymentStatus { Failure, Success }

class StripePaymentServices {
  // Singleton
  static final StripePaymentServices _instance =
      StripePaymentServices._internal();
  factory StripePaymentServices() => _instance;
  StripePaymentServices._internal();

  /// Initialize Stripe (call in main.dart)
  static Future<void> initialize({required String publishableKey}) async {
    Stripe.publishableKey = publishableKey;
    Stripe.merchantIdentifier = 'com.amjad.eventNew';
    await Stripe.instance.applySettings();
  }

  /// Create Payment Intent on Stripe via backend secretKey
  static Future<Map<String, dynamic>> createPaymentIntent({
    required String amount,
    required String currency,
    required String secretKey,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {'amount': amount, 'currency': currency},
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to create payment intent: ${response.body}');
      }

      return json.decode(response.body) as Map<String, dynamic>;
    } catch (e) {
      throw Exception('Create Payment Intent failed: $e');
    }
  }

  /// Make payment using PaymentSheet (with Apple Pay / Google Pay support)
  static Future<PaymentStatus> makePayment({
    required String amount,
    required String currency,
    required String secretKey,
    required String merchantDisplayName,
  }) async {
    try {
      final paymentIntent = await createPaymentIntent(
        amount: amount,
        currency: currency,
        secretKey: secretKey,
      );
      log("paymentIntent==> $paymentIntent");
      final clientSecret = paymentIntent['client_secret'];
      if (clientSecret == null) throw Exception('Client secret is null');

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: merchantDisplayName,
          style: ThemeMode.light,
          googlePay: PaymentSheetGooglePay(
            merchantCountryCode: "US", // use "US" for testing
            currencyCode: "USD", // use USD in test mode
            testEnv: true,
          ),
          allowsDelayedPaymentMethods: false,
          customFlow: false,
          appearance: PaymentSheetAppearance(
            primaryButton: PaymentSheetPrimaryButtonAppearance(
              colors: PaymentSheetPrimaryButtonTheme(
                dark: PaymentSheetPrimaryButtonThemeColors(
                  background: AppColor.primaryColor04,
                ),
                light: PaymentSheetPrimaryButtonThemeColors(
                  background: AppColor.primaryColor04,
                ),
              ),
            ),
          ),
          applePay:
              Platform.isIOS
                  ? PaymentSheetApplePay(merchantCountryCode: "US")
                  : null,
        ),
      );

      final status = await _presentPaymentSheet();
      return status;
    } catch (e) {
      _showSnack('Payment Error', e.toString(), Colors.red);
      debugPrint('Stripe Error: $e');
      return PaymentStatus.Failure;
    }
  }

  static Future<PaymentStatus> makePaymentGooglePay({
    required int amount,
  }) async {
    await Stripe.instance.createPlatformPayPaymentMethod(
      params: PlatformPayPaymentMethodParams.googlePay(
        googlePayParams: GooglePayParams(
          // merchantCountryCode: "IN",
          // currencyCode: "INR",
          // testEnv: true,
          merchantCountryCode: "US", // use "US" for testing
          currencyCode: "USD", // use USD in test mode
          testEnv: true,
        ),
        googlePayPaymentMethodParams: GooglePayPaymentMethodParams(
          amount: amount,
        ),
      ),
    );

    final status = await _presentPaymentSheet();
    return status;
  }

  static Future<PaymentStatus> makePaymentApplePay({
    required String amount,
  }) async {
    await Stripe.instance.createPlatformPayPaymentMethod(
      usesDeprecatedTokenFlow: false,
      params: PlatformPayPaymentMethodParams.applePay(
        applePayParams: ApplePayParams(
          // merchantCountryCode: "IN",
          // currencyCode: "INR",
          merchantCountryCode: "US", // use "US" for testing
          currencyCode: "USD", // use USD in test mode
          cartItems: [
            ApplePayCartSummaryItem.immediate(
              label: "Event Ticket",
              amount: amount,
            ),
          ],
        ),
      ),
    );

    final status = await _presentPaymentSheet();
    return status;
  }

  /// Private: Present Payment Sheet
  static Future<PaymentStatus> _presentPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      _showSnack(
        'Payment Successful',
        'Your payment was successfully completed. Thank you!',
        Colors.green,
      );
      return PaymentStatus.Success;
    } on StripeException catch (e) {
      log("Stripe Exception code: ${e.error.code}");
      final failureCode = _mapStripeErrorToFailureCode(e.error.code.name);

      String title;
      String message;
      Color color;

      switch (failureCode) {
        case FailureCode.Canceled:
          title = 'Payment Cancelled';
          message = 'You cancelled the payment. No charges were made.';
          color = Colors.orange;
          break;
        case FailureCode.Failed:
          title = 'Payment Failed';
          message =
              'Payment could not be completed due to a processing error. Please try again.';
          color = Colors.red;
          break;
        case FailureCode.Timeout:
          title = 'Payment Timeout';
          message =
              'Payment timed out. Please check your internet connection and try again.';
          color = Colors.redAccent;
          break;
        case FailureCode.Unknown:
          title = 'Payment Error';
          message =
              'An unknown error occurred. Please contact support if the issue persists.';
          color = Colors.red;
          break;
      }

      _showSnack(title, message, color);
      return PaymentStatus.Failure;
    } catch (e) {
      debugPrint('Unknown Error: $e');
      _showSnack(
        'Payment Error',
        'An unexpected error occurred. Please try again later.',
        Colors.red,
      );
      return PaymentStatus.Failure;
    }
  }

  /// Map Stripe error code (String) to FailureCode enum
  static FailureCode _mapStripeErrorToFailureCode(String? code) {
    switch (code) {
      case 'Canceled':
        return FailureCode.Canceled;
      case 'Failed':
        return FailureCode.Failed;
      case 'Timeout':
        return FailureCode.Timeout;
      default:
        return FailureCode.Unknown;
    }
  }

  /// Private: Show snackbar
  static void _showSnack(String title, String message, Color color) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: color.withValues(alpha: 0.9),
      colorText: Colors.white,
      margin: EdgeInsets.all(12.sp),
      borderRadius: 12.r,
      duration: const Duration(seconds: 3),
    );
  }
}
