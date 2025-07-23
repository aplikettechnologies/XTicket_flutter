import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/dashboard/dashboard_controller.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_style.dart';
import 'package:xticket/shared/widgets/app_button.dart';

import '../../../shared/utils/app_assets.dart';

Widget emptyTicketWidget(BuildContext context) {
  return Center(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.icEmptyTicket,
            height: 98.h,
            width: 98.w,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 25.h),

          Text(
            getTranslation(context, "ticket.looking_for_your_tickets"),
            style: AppStyle.darkBold24Lato,
          ),
          SizedBox(height: 40.h),
          appButton(
            context: context,
            text: getTranslation(context, "ticket.explore_events"),
            onPressed: () {
              final c = Get.find<DashboardController>();
              c.setTabIndex(2);
            },
          ),
        ],
      ),
    ),
  );
}
