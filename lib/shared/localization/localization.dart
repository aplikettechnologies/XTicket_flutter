import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Localization {
  Locale? locale;
  Localization(this.locale);

  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization)!;
  }

  Map<dynamic, dynamic>? _localizedValue;

  Map flattedTransalation(Map<dynamic, dynamic> json, [String prifix = '']) {
    Map<dynamic, dynamic> transaction = {};
    json.forEach((dynamic key, dynamic value) {
      if (value is Map) {
        transaction.addAll(flattedTransalation(value, '$prifix$key.'));
      } else {
        transaction['$prifix$key'] = value.toString();
      }
    });
    return transaction;
  }

  Future load() async {
    String jsonStringValue = await rootBundle.loadString(
      'assets/languages/${locale?.languageCode}.json',
    );

    Map mappedValue = json.decode(jsonStringValue);

    _localizedValue = flattedTransalation(mappedValue);
  }

  String getTranslation(String key) {
    return _localizedValue![key] ?? key;
  }

  static LocalizationsDelegate<Localization> delegate =
      const LocalizationDelegate();

  static Localization get instance => LocalizationDelegate.instance!;
}

class LocalizationDelegate extends LocalizationsDelegate<Localization> {
  const LocalizationDelegate();

  static Localization? instance;

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) async {
    Localization localization = Localization(locale);

    await localization.load();
    instance = localization;
    return localization;
  }

  @override
  bool shouldReload(LocalizationDelegate old) => false;
}
