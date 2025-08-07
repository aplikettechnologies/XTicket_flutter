import 'package:flutter/material.dart';
import 'package:xticket/shared/localization/localization_const.dart';

import 'app_configration.dart';

class AppValidator {
  static String? isFieldEmptyValidation({
    required String? value,
    required String title,
    required BuildContext context,
  }) {
    if (value == null || value.isEmpty) {
      return '$title ${getTranslation(context, 'app_validation.required')}';
    }
    return null;
  }

  static String? isValidEmail({
    required String? value,
    required BuildContext context,
  }) {
    if (value == null || value.isEmpty) {
      return getTranslation(context, 'app_validation.email_required');
    }
    final parts = value.split('@');
    if (parts[0].length > 64) {
      return getTranslation(context, 'app_validation.email_invalid_format');
    }

    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[\w-]{2,}$').hasMatch(value)) {
      return getTranslation(context, 'app_validation.email_invalid_format');
    }
    return null;
  }

  static String? isValidPhone({
    required String? value,
    bool isOptional = false,
    required BuildContext context,
  }) {
    if (value == null || value.isEmpty) {
      return isOptional
          ? null
          : getTranslation(context, 'app_validation.contact_no_required');
    } else if (value.length < AppConfigration.mobileNumberLimit) {
      return getTranslation(
        context,
        'app_validation.contact_no_invalid_format',
      );
    }
    return null;
  }

  static String? isValidUrl({
    required String? value,
    required BuildContext context,
  }) {
    if (value == null || value.isEmpty) {
      return null;
    } else if (!RegExp(
      r'^(https?:\/\/)?'
      r'(([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,})'
      r'(\/[^\s]*)?$',
    ).hasMatch(value)) {
      return getTranslation(context, 'app_validation.url_invalid_format');
    }

    return null;
  }
}
