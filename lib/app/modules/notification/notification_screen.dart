import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/notification/notification_controller.dart';
import 'package:xticket/app/modules/notification/widget/item_notification_list.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/widgets/app_appbar.dart';
import 'package:xticket/shared/widgets/skeletonizer_container.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppbar(
        title: getTranslation(context, 'notification.notifications'),
      ),
      body: GetBuilder<NotificationController>(
        init: NotificationController(),
        builder: (controller) {
          return SkeletonizerContainer(
            enabled: controller.isLoading,
            child: ListView.builder(
              itemCount: 10,
              padding: EdgeInsets.only(top: 24.h),

              itemBuilder: (context, index) {
                return itemNotificationList();
              },
            ),
          );
        },
      ),
    );
  }
}
