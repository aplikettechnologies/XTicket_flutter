import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xticket/app/modules/home/home_controller.dart';
import 'package:xticket/routes/app_routes.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_indicator.dart';
import '../../../shared/utils/app_style.dart';
import '../../../shared/widgets/app_search_field.dart';
import '../event/widget/item_category_list.dart';
import '../event/widget/item_event_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(context: context),
      builder:
          (controller) => SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    //SliderImage
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: false,
                        viewportFraction: 1.0,
                        height: 195.h,
                        reverse: false,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: const Duration(
                          milliseconds: 300,
                        ),
                        onPageChanged: (index, reason) {
                          controller.currentBannerIndex.value = index;
                        },
                      ),
                      items: List.generate(
                        controller.eventBanner.length,
                        (index) => Image.network(
                          controller.eventBanner[index].toString(),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),

                    //Indicator
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) => Obx(
                            () => AppIndicator(
                              index: index,
                              currentPage: controller.currentBannerIndex.value,
                              activeColor: AppColor.grey3,
                              unActiveColor: AppColor.neutralColor04,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 18.h),

                //Filters
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.search);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: appSearchField(
                            onTap: () {
                              Get.toNamed(AppRoutes.search);
                            },
                            readOnly: true,
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
                                  color: AppColor.black.withValues(alpha: 0.1),
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
                              vertical: 13.h,
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
                                  color: AppColor.black.withValues(alpha: 0.1),
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
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                    bottom: 16.h,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.10,
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
    );
  }
}
