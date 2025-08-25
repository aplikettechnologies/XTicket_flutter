import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:xticket/app/app.dart';
import 'package:xticket/firebase_options.dart';
import 'package:xticket/shared/localization/current_local_storage.dart';
import 'package:xticket/shared/notificationServices/push_notification_services.dart';
import 'package:xticket/shared/utils/app_configuration.dart';
import 'package:xticket/shared/widgets/app_toast.dart';
import 'app/modules/no_internet/controller/no_internet_controller.dart';
import 'shared/appConfiguration/app_configuration_controller.dart';
import 'shared/flutter_stripe_payment/stripe_payment_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.testMode = true;

  // get initial data & route
  final initialRoute = await getInitData();

  runApp(MyApp(initialRoute: initialRoute));
}

Future<String> getInitData() async {
  await getCurrentLanguage();

  final initialRoute = await AppConfigurationService.getInitialRoute();
  await dotenv.load(fileName: ".env");

  // Register global controllers
  Get.put<NoInternetController>(NoInternetController(), permanent: true);
  await stripeInitialization();
  await handlePushNotificationInitialize();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    PushNotificationService.markAppAsInitialized();
  });
  return initialRoute;
}

Future<void> getCurrentLanguage() async {
  String lanCode = await CurrentLocalStorage.getLanguageCode() ?? "en";
  AppConfiguration.languageCode = lanCode;
  Get.updateLocale(Locale(lanCode));
}

//Stripe Inilization
Future<void> stripeInitialization() async {
  await StripePaymentServices.initialize(
    publishableKey:
        "pk_test_51QHiW9P5lYP89dl2fxOuYC4TvYRcrw7gevqX5TJ1HLnF79yvGpPfE3GJ6B4Jts1ReFmEMUWsmHli5sO7W9vHZN0m00t3jSSA1y",
  );
}

Future<void> handlePushNotificationInitialize() async {
  final status = await Permission.notification.request();
  if (!status.isGranted) {
    AppToast.showFailure(
      msg:
          "Please go to settings and allow notification permission to receive future notifications.",
    );
    await Permission.notification.request();
  } else if (status.isGranted) {
    await PushNotificationService.initialize();
    final fcm = await PushNotificationService.getFcmToken();
    Get.log("Fcm token: $fcm");
  }
}
