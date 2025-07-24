import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/createEvent/create_event_controller.dart';
import 'package:xticket/app/modules/createEvent/widget/tab_details_widget.dart';
import 'package:xticket/app/modules/createEvent/widget/tab_general_widget.dart';
import 'package:xticket/app/modules/createEvent/widget/tab_location_widget.dart';
import 'package:xticket/app/modules/createEvent/widget/tab_share_widget.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';
import 'package:xticket/shared/widgets/app_appbar.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateEventController>(
      init: CreateEventController(),
      builder: (controller) {
        return Scaffold(
          appBar: appAppbar(
            backOnPressed: () {
              if (controller.tabController.index > 0) {
                controller.tabController.animateTo(
                  controller.tabController.index - 1,
                );
              } else {
                Get.back();
              }
            },
            title: getTranslation(context, 'create_event.create_event'),
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IgnorePointer(
                  ignoring: true,

                  child: TabBar(
                    dividerColor: AppColor.neutralColor08,
                    controller: controller.tabController,
                    indicatorColor: AppColor.dark,
                    indicatorWeight: 1.w,
                    unselectedLabelStyle: AppStyle.neutral4Medium12Manrope,
                    indicatorPadding: EdgeInsets.zero,
                    labelStyle: AppStyle.neutral4Medium12Manrope.copyWith(
                      color: AppColor.black,
                    ),
                    tabs: [
                      Tab(
                        text: getTranslation(context, 'create_event.general'),
                      ),
                      Tab(
                        text: getTranslation(context, 'create_event.location'),
                      ),
                      Tab(
                        text: getTranslation(context, 'create_event.details'),
                      ),
                      Tab(text: getTranslation(context, 'create_event.share')),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      generalTab(context: context),
                      locationTab(context: context),
                      detailsTab(context: context),
                      shareTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
