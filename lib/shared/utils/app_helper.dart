import 'package:flutter/material.dart';

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
}
