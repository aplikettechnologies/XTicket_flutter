import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/search/search_controller.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/widgets/app_radio_button.dart';
import 'package:xticket/shared/widgets/app_search_field.dart';

import '../utils/app_style.dart';

Widget dialogSelectCity({
  required BuildContext context,
  required SearchScreenController searchScreenController,
}) {
  return GetBuilder(
    init: searchScreenController,
    builder: (controller) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 79.w, vertical: 100.h),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.neutralColor10,
            borderRadius: BorderRadius.circular(16.r),
          ),
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Search
              appSearchField(
                textEditingController: controller.citySearchController,
                context: context,
                hintText: getTranslation(context, 'search.search'),
              ),
              SizedBox(height: 14.h),

              //list
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  padding: EdgeInsets.zero,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appRadioButton(
                            value: index == controller.selectedCityIndex,
                            onChanged: (value) {
                              controller.selectedCityIndex = index;
                              controller.update();
                            },
                          ),
                          SizedBox(width: 8.w),
                          Text('city', style: AppStyle.blackMedium12Lato),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
