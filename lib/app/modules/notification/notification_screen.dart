import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xticket/app/modules/notification/widget/item_notification_list.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/widgets/app_appbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppbar(
        title: getTranslation(context, 'notification.notifications'),
      ),
      body: ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.zero,

        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: index == 0 ? 24.h : 0.h),
            child: itemNotificationList(),
          );
        },
      ),
    );
  }
}
