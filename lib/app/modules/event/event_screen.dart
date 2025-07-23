import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/event/event_controller.dart';
import 'package:xticket/app/modules/event/widget/item_event_list.dart';
import 'package:xticket/routes/app_routes.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_style.dart';
import 'package:xticket/shared/widgets/app_button.dart';

import '../../../shared/utils/app_color.dart';
import '../../../shared/widgets/app_search_field.dart';
import 'widget/item_category_list.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventController>(
      init: EventController(context: context),
      builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),

                    //Filters
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: appSearchField(
                              context: context,
                              hintText: getTranslation(
                                context,
                                'event.search_events',
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 48.h,
                              padding: EdgeInsets.symmetric(
                                horizontal: 19.w,
                                vertical: 10.h,
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.r),
                                color: AppColor.white,
                                border: Border.all(
                                  color: AppColor.neutralColor08,
                                  width: 1.w,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.black.withValues(
                                      alpha: 0.1,
                                    ),
                                    offset: Offset(1, 1),
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    getTranslation(context, 'event.city'),
                                    style: AppStyle.grey2Regular12Lato.copyWith(
                                      color: AppColor.grey2,
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Padding(
                                    padding: EdgeInsets.only(top: 4.h),
                                    child: SvgPicture.asset(
                                      AppAssets.icDropdown,
                                      height: 6.h,
                                      width: 10.h,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(width: 8.w),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 48.h,
                              padding: EdgeInsets.symmetric(
                                horizontal: 19.w,
                                vertical: 10.h,
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.r),
                                color: AppColor.white,
                                border: Border.all(
                                  color: AppColor.neutralColor08,
                                  width: 1.w,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.black.withValues(
                                      alpha: 0.1,
                                    ),
                                    offset: Offset(1, 1),
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: SvgPicture.asset(
                                AppAssets.icFilter,
                                height: 24.h,
                                width: 24.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),

                    //CategoryList
                    SizedBox(
                      height: 80.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        itemCount: controller.categoryList.length,
                        itemBuilder: (context, index) {
                          return itemCategoryList(
                            icon: controller.categoryList[index]['icon'],
                            title: controller.categoryList[index]['name'],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 24.h),

                    //AllEvent
                    GridView.builder(
                      itemCount: 5,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.25,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return itemEventList();
                      },
                    ),
                  ],
                ),
              ),
            ),

            //CreateEvent
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 18.3,
                    spreadRadius: 0,
                    offset: Offset(0, -2),
                    color: AppColor.black.withValues(alpha: 0.1),
                  ),
                ],
              ),
              child: appButton(
                context: context,
                text: getTranslation(context, 'event.create_event'),
                onPressed: () {
                  Get.toNamed(AppRoutes.createEvent);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
