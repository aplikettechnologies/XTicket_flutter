import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'app_color.dart';

class AppHelper {
  void showAppDialog({
    required BuildContext context,
    required Widget dialogWidget,
  }) {
    showDialog<void>(
      context: context,
      barrierDismissible: true,

      barrierColor: AppColor.barrierColor,
      builder: (BuildContext context) {
        return dialogWidget;
      },
    );
  }

  void showAppBottomSheet({
    required BuildContext context,
    required Widget bottomSheetWidget,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: AppColor.barrierColor,
      enableDrag: true,
      builder: (BuildContext context) {
        return bottomSheetWidget;
      },
    );
  }

  static String getDay(String fullDate) {
    try {
      final DateTime date = DateFormat('dd MMM yyyy').parse(fullDate);
      return DateFormat('dd').format(date); // e.g. "18"
    } catch (e) {
      return '';
    }
  }

  static String getMonthMMM(String fullDate) {
    try {
      final DateTime date = DateFormat('dd MMM yyyy').parse(fullDate);
      return DateFormat('MMM').format(date); // e.g. "Jun"
    } catch (e) {
      return '';
    }
  }
}
