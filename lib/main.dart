import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xticket/app/app.dart';
import 'package:xticket/shared/localization/current_local_storage.dart';
import 'package:xticket/shared/utils/app_configuration.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getInitData();
  runApp(const MyApp());
}

//App Init

Future<void> getInitData() async {
  await getCurrentLanguage();
}

//Get Current Language

Future<void> getCurrentLanguage() async {
  String lanCode = await CurrentLocalStorage.getLanguageCode() ?? "en";
  AppConfiguration.languageCode = lanCode;
  Get.updateLocale(Locale(lanCode));
}
