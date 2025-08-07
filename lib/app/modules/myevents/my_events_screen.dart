import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/myevents/my_events_controller.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/widgets/skeletonizer_container.dart';
import '../../../shared/widgets/app_appbar.dart';
import 'my_events_list_tile.dart';

class MyEventsScreen extends StatelessWidget {
  const MyEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppbar(
        title: getTranslation(
          context,
          getTranslation(context, "drawer.myEvents"),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<MyEventsController>(
        init: MyEventsController(),
        builder: (controller) {
          return SkeletonizerContainer(
            enabled: controller.isLoading,
            child: ListView.builder(
              itemCount: 2,
              padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 16.w),
              itemBuilder:
                  (context, index) => myEventsListTile(context: context),
            ),
          );
        },
      ),
    );
  }
}
