import 'package:flutter/material.dart';
import 'package:xticket/shared/localization/current_local_storage.dart';
import 'package:xticket/shared/localization/localization.dart';

String getTranslation(BuildContext context, String key) {
  return Localization.of(context).getTranslation(key);
}

String translation(String key) {
  return Localization.instance.getTranslation(key);
}

const String hindi = 'hi';

Future<Locale> setLocale(String languageCode) async {
  CurrentLocalStorage.setLanguageCode(languageCode: languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  String languageCode = await CurrentLocalStorage.getLanguageCode() ?? hindi;

  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  Locale temp;

  switch (languageCode) {
    case hindi:
      temp = Locale(languageCode);
      break;
    default:
      temp = const Locale(hindi);
  }
  return temp;
}
